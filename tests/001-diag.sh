python3 - <<'EOF'
import glob, yaml
REQ = ("id","title","document_class","phase","visibility","status")
for f in sorted(glob.glob(".kaidf/**/*.md", recursive=True)):
    t = open(f, encoding="utf-8", errors="replace").read().replace("\r\n","\n")
    d = {}
    if t.startswith("---\n"):
        e = t.find("\n---\n", 4)
        if e != -1:
            try: d = yaml.safe_load(t[4:e]) or {}
            except Exception: d = {}
    missing = [k for k in REQ if not (isinstance(d, dict) and d.get(k))]
    print(("OK    " if not missing else "FALTA " + ",".join(missing) + "  "), f)
EOF
