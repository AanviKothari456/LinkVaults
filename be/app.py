from flask_cors import CORS
from flask import Flask\napp = Flask(__name__)\n@app.route('/')\ndef home(): return 'OK'
from routes.summarize import summarize_bp
from routes.history import history_bp
app.register_blueprint(history_bp)
CORS(app)
from dotenv import load_dotenv\nload_dotenv()
