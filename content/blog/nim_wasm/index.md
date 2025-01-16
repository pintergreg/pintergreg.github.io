---
title: "nim + webassembly"
description: |
    how to use nim code as a WASM binary in a webpage
author: Gergő Pintér
date: 2025-01-15T19:20:00+01:00
draft: true
type: blog
tags:
    - programming
    - nim
    - webassembly
    - today-i-learned
---

This post introduces how to use a webassembly (WASM) module written in [nim](https://nim-lang.org/) in a webpage.


## have some nim code

Let's use a simple 'add' function for the experiment.

```nim
proc add*(a: int, b: int): int =
  return a + b
```

NB: the code above is not final, read further.


## compile to WASM

As a prerequisite, [emscipten](https://emscripten.org/) should be installed. 

The nimble file is very simple as this simple code does not use any dependencies.

```nim
# Package

version       = "1.0.0"
author        = "Gergő Pintér"
description   = "WASM experiment"
license       = "MIT"
srcDir        = "src"
bin           = @["main"]

# Dependencies

requires "nim >= 2.0.0"
```

The `config.nims` script is based on the `emscripten` branch of a [paranim](https://github.com/paranim/paranim) example, [parakeet](https://github.com/paranim/parakeet/) [^parakeet]., but it was revised.
<!-- based on the  -->

```nim
when defined(emscripten):
  --nimcache:tmp

  --os:standalone
  --cpu:wasm32
  --cc:clang
  --clang.exe:emcc
  --clang.linkerexe:emcc
  --clang.cpp.exe:emcc
  --clang.cpp.linkerexe:emcc

  --gc:none
  --exceptions:goto
  --define:noSignalHandler

  --define:useMalloc
  --opt:size
  --threads:off

  --stackTrace:off
  --nomain

  switch("passL", "--no-entry")
```

A `panicoverride.nim` file is also required with the following content, based on the [nlvm](https://github.com/arnetheduck/nlvm) project [^panicoverride].

```nim
proc rawoutput(s: string) = discard
proc panic(s: string) {.noreturn.} = discard
```


### compilation

```
nimble build -d:release -d:emscripten
```


## call from JS

For this solution, it is important that a webserver should provide the WASM file with `application/wasm` content type.

I used lighttpd for this experiment, so the mimetype section of my config looks like this:
```
mimetype.assign = (
    ".html" => "text/html",
    ".txt" => "text/plain",
    ".css" => "text/css",
    ".js" => "application/x-javascript",
    ".jpg" => "image/jpeg",
    ".jpeg" => "image/jpeg",
    ".gif" => "image/gif",
    ".png" => "image/png",
    ".wasm" => "application/wasm",
    "" => "application/octet-stream"
)
```

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>WASM experiment</title>
  </head>
  <body>
    <script>
        function call_nim() {
            WebAssembly.instantiateStreaming(fetch('main.wasm'), {}).then(obj => {
                const fun = obj.instance.exports.add;
                console.log(fun(10, 7));
            });
        }
    </script>
    <button onclick="call_nim()">call 'nim'</button>
  </body>
</html>
```

The problem with this is that the `add` function cannot be found:

```
Uncaught (in promise) TypeError: fun is not a function
```

It seems that the `add` function is not exported. The `{.exportc: "add".}` pragma does not solve this either.

After some searching, I found the [WASM-4](https://github.com/aduros/wasm4) project, which uses a custom macro [^exportwasm] for the task ([ISC license](https://opensource.org/license/isc-license-txt)).

```nim
import std/macros

macro exportWasm*(def: untyped): untyped =
  result = def
  result[^3] = nnkPragma.newTree(
    ident("exportc"),
    nnkExprColonExpr.newTree(
      ident("codegenDecl"),
      newStrLitNode("__attribute__((export_name(\"$2\"))) $1 $2$3")
    )
  )
```

Adding it to the code (as `exportwasm.nim`) solves the problem.

```nim
import exportwasm

proc add*(a: int, b: int): int {.exportWasm.} =
  return a + b
```


## references

[^parakeet]: https://github.com/paranim/parakeet/blob/e9bbade4195c5df14cf51bb06e1801b8ce253082/config.nims
[^panicoverride]: https://github.com/arnetheduck/nlvm/blob/89db076a7b2907d87463496017b5a5c2a7448686/README.md#wasm32-support
[^exportwasm]: https://github.com/aduros/wasm4/blob/979be845216ee9d613cb6555fb8b11c01bec39a0/cli/assets/templates/nim/src/cart/wasm4.nim#L100-L110
