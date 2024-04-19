# frozen_string_literal: true

require 'rqrcode'

qrcode = RQRCode::QRCode.new('https://pintergreg.github.io')

svg = qrcode.as_svg(
  color: '#2d2d2d',
  shape_rendering: 'crispEdges',
  module_size: 12,
  standalone: true,
  use_path: true
)

File.open('static/images/qr.svg', 'w') { |file| file.write(svg) }
