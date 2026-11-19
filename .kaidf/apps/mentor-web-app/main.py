from __future__ import annotations

import json
import os
from datetime import datetime, timezone
from http import HTTPStatus
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

ROOT = Path(__file__).resolve().parent
REPO_ROOT = ROOT.parents[1]
APP_ID = 'mentor-web-app'
IMPLEMENTATION_FOCUS = 'lightweight browser workflow on localhost'
QUESTION = 'What evidence must exist before this work is considered verified and transferable?'
ANSWER = 'Evidence: (1) all 5 delivery phases accepted in kob status; (2) kob audit re-run after the remediation batch is applied, with the new score and any remaining findings recorded under docs/05_verification_transfer; (3) the CI workflow green on GitHub (Vimscript lint plus headless plugin load test, no continue-on-error); (4) a headless Vim smoke test proving the plugin loads and :KobAudit, :KobChat, :KobMentor, :KobContracts and :KobApps are registered; (5) the full state — plugin code, .kaidf scaffold, contracts and apps — committed and pushed, so the repository itself is the transferable artifact.'
ANSWERS_PATH = ROOT / 'mentor-answers.json'
BRIEF_PATH = ROOT / 'mentor-brief.json'
PORT = int(os.environ.get("INSTANT_APP_PORT", "8765"))

def load_answers() -> dict[str, object]:
    if not ANSWERS_PATH.is_file():
        return {'answers': []}
    data = json.loads(ANSWERS_PATH.read_text(encoding='utf-8'))
    return data if isinstance(data, dict) else {'answers': []}

def save_answer(text: str) -> dict[str, str]:
    payload = load_answers()
    answers = payload.get('answers')
    if not isinstance(answers, list):
        answers = []
    item = {
        'text': text,
        'created_at': datetime.now(timezone.utc).isoformat(),
    }
    answers.append(item)
    payload['answers'] = answers
    ANSWERS_PATH.write_text(json.dumps(payload, indent=2, sort_keys=True) + '\n', encoding='utf-8')
    return item

def load_brief() -> dict[str, object]:
    if not BRIEF_PATH.is_file():
        return {}
    data = json.loads(BRIEF_PATH.read_text(encoding='utf-8'))
    return data if isinstance(data, dict) else {}

class MentorAppHandler(SimpleHTTPRequestHandler):
    def do_GET(self) -> None:
        if self.path == '/api/state':
            payload = load_brief()
            payload['question'] = QUESTION
            payload['answer'] = ANSWER
            payload['answers'] = load_answers().get('answers', [])
            body = json.dumps(payload, indent=2, sort_keys=True).encode('utf-8')
            self.send_response(HTTPStatus.OK)
            self.send_header('Content-Type', 'application/json; charset=utf-8')
            self.send_header('Content-Length', str(len(body)))
            self.end_headers()
            self.wfile.write(body)
            return
        return super().do_GET()

    def do_POST(self) -> None:
        if self.path != '/api/answers':
            self.send_error(HTTPStatus.NOT_FOUND, 'Unknown API endpoint')
            return
        length = int(self.headers.get('Content-Length', '0'))
        raw = self.rfile.read(length)
        data = json.loads(raw.decode('utf-8') or '{}')
        text = str(data.get('text', '')).strip()
        if not text:
            self.send_error(HTTPStatus.BAD_REQUEST, 'Missing answer text')
            return
        saved = save_answer(text)
        body = json.dumps(saved, indent=2, sort_keys=True).encode('utf-8')
        self.send_response(HTTPStatus.CREATED)
        self.send_header('Content-Type', 'application/json; charset=utf-8')
        self.send_header('Content-Length', str(len(body)))
        self.end_headers()
        self.wfile.write(body)

if __name__ == "__main__":
    server = ThreadingHTTPServer(("127.0.0.1", PORT), MentorAppHandler)
    os.chdir(ROOT)
    print(f"Serving {APP_ID} at http://127.0.0.1:{PORT}")
    print(f"Focus: {IMPLEMENTATION_FOCUS}")
    server.serve_forever()
