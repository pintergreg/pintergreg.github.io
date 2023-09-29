import yaml
from pathlib import Path
import rispy
from rispy import TAG_KEY_MAPPING

Path("data/ris").mkdir(parents=True, exist_ok=True)
mapping = {k: k for k, v in TAG_KEY_MAPPING.items()}
for ris_file in Path("resources/ris/").glob("*.ris"):
    text = ris_file.read_text()
    if not text.endswith("ER  -\n"):
        text += "ER  -\n"
    entries = rispy.loads(text, mapping=mapping)
    basename = Path(ris_file).name[:-4]
    with open(f"data/ris/{basename}.yaml", "w") as fp:
        yaml.dump(entries[0], fp)
