from flask import Flask\napp = Flask(__name__)\n@app.route('/')\ndef home(): return 'OK'
from routes.summarize import summarize_bp
