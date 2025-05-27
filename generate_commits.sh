#!/bin/bash

echo "Generating 20 commits..."

# Step 1: Set up structure
mkdir -p be/routes be/services be/utils
touch be/app.py be/routes/summarize.py be/routes/history.py
touch be/services/openai_summary.py be/services/history_store.py
touch be/utils/validator.py
echo "Initial backend structure" > README.md
git add .
git commit -m "Commit 1: Create backend folder structure"

# Step 2: Set up Flask base
echo "from flask import Flask\napp = Flask(__name__)\n@app.route('/')\ndef home(): return 'OK'" > be/app.py
git add be/app.py
git commit -m "Commit 2: Set up basic Flask app"

# Step 3–6: Add history and summarize blueprints
echo "from flask import Blueprint\nsummarize_bp = Blueprint('summarize', __name__)" > be/routes/summarize.py
git add be/routes/summarize.py
git commit -m "Commit 3: Add summarize blueprint stub"

echo "from flask import Blueprint\nhistory_bp = Blueprint('history', __name__)" > be/routes/history.py
git add be/routes/history.py
git commit -m "Commit 4: Add history blueprint stub"

echo "from routes.summarize import summarize_bp" >> be/app.py
git add be/app.py
git commit -m "Commit 5: Register summarize blueprint"

echo "from routes.history import history_bp" >> be/app.py
echo "app.register_blueprint(history_bp)" >> be/app.py
git add be/app.py
git commit -m "Commit 6: Register history blueprint"

# Step 7–9: Add services
echo "def get_summary(url): return f'Summary for {url}'" > be/services/openai_summary.py
git add be/services/openai_summary.py
git commit -m "Commit 7: Add OpenAI summary service stub"

echo "history_log = []\ndef save_summary(u,s): history_log.append({'url':u,'summary':s})" > be/services/history_store.py
git add be/services/history_store.py
git commit -m "Commit 8: Add save_summary logic"

echo "def get_history(): return []" >> be/services/history_store.py
git add be/services/history_store.py
git commit -m "Commit 9: Add get_history function"

# Step 10–11: Routes use services
echo -e "from services.openai_summary import get_summary\nfrom services.history_store import save_summary" >> be/routes/summarize.py
git add be/routes/summarize.py
git commit -m "Commit 10: Import services in summarize"

echo "from services.history_store import get_history" >> be/routes/history.py
git add be/routes/history.py
git commit -m "Commit 11: Import service in history route"

# Step 12–13: Add /api routes
echo "@summarize_bp.route('/api/summarize', methods=['POST'])\ndef summarize(): return 'ok'" >> be/routes/summarize.py
git add be/routes/summarize.py
git commit -m "Commit 12: Add summarize API route stub"

echo "@history_bp.route('/api/history')\ndef history(): return '[]'" >> be/routes/history.py
git add be/routes/history.py
git commit -m "Commit 13: Add history API route stub"

# Step 14–15: Add util
echo "def is_valid_url(u): return u.startswith('http')" > be/utils/validator.py
git add be/utils/validator.py
git commit -m "Commit 14: Add simple URL validator"

echo "from utils.validator import is_valid_url" >> be/routes/summarize.py
git add be/routes/summarize.py
git commit -m "Commit 15: Import validator"

# Step 16–18: Refactor app.py
sed -i '' '1s/^/from flask_cors import CORS\n/' be/app.py
echo "CORS(app)" >> be/app.py
git add be/app.py
git commit -m "Commit 16: Add CORS support"

echo "from dotenv import load_dotenv\nload_dotenv()" >> be/app.py
git add be/app.py
git commit -m "Commit 17: Load .env"

touch be/.env
echo "OPENAI_API_KEY=sk-testkey" > be/.env
git add be/.env
git commit -m "Commit 18: Add dummy .env file"

# Step 19: .gitignore
echo ".env" > .gitignore
git add .gitignore
git commit -m "Commit 19: Add .env to .gitignore"

# Step 20: Requirements
echo -e "flask\nflask-cors\nopenai\npython-dotenv" > be/requirements.txt
git add be/requirements.txt
git commit -m "Commit 20: Add requirements.txt"

echo "✅ Done: 20 commits created!"
