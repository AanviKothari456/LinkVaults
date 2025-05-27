# routes/history.py
from flask import Blueprint, jsonify
from services.history_store import get_history

history_bp = Blueprint("history", __name__)

@history_bp.route("/api/history", methods=["GET"])
def history():
    return jsonify({"history": get_history()})
