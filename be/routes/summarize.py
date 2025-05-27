# routes/summarize.py
from flask import Blueprint, request, jsonify
from services.openai_summary import get_summary
from utils.validator import is_valid_url
from services.history_store import save_summary

summarize_bp = Blueprint("summarize", __name__)

@summarize_bp.route("/api/summarize", methods=["POST"])
def summarize():
    data = request.get_json()
    url = data.get("url")

    if not is_valid_url(url):
        return jsonify({"error": "Invalid URL format"}), 400

    try:
        summary = get_summary(url)
        return jsonify({"summary": summary})
    except Exception as e:
        return jsonify({"error": str(e)}), 500
