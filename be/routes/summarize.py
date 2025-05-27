from flask import Blueprint\nsummarize_bp = Blueprint('summarize', __name__)
from services.openai_summary import get_summary
from services.history_store import save_summary
@summarize_bp.route('/api/summarize', methods=['POST'])\ndef summarize(): return 'ok'
from utils.validator import is_valid_url
