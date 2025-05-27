from flask import Blueprint\nhistory_bp = Blueprint('history', __name__)
from services.history_store import get_history
