python3 - <<'EOF'
from pathlib import Path
blocks = {
 ".kaidf/apps/mentor-web-app/README.md": """---
id: apps/mentor-web-app/README.md
title: Mentor web app — instant app README
document_class: core-doc
phase: 04_execution_instrumentation
visibility: internal
status: active
---

""",
 ".kaidf/apps/mentor-web-app/mentor-notes.md": """---
id: apps/mentor-web-app/mentor-notes.md
title: Mentor notes — mentor-web-app
document_class: core-doc
phase: 04_execution_instrumentation
visibility: internal
status: active
---

""",
}
for path, fm in blocks.items():
    p = Path(path)
    t = p.read_text(encoding="utf-8")
    if t.startswith("---\n"):
        print("ja tem FM:", path); continue
    p.write_text(fm + t, encoding="utf-8")
    print("FM adicionado:", path)
EOF
