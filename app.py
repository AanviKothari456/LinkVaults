from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return "Welcome to LinkVault API!"

@app.route("/api/summarize", methods=["POST"])
def summarize():
    data = request.get_json()
    url = data.get("url")
    # Placeholder summary logic
    summary = f"This is a fake summary for: {url}"
    return jsonify({"summary": summary})

if __name__ == "__main__":
    app.run(debug=True)
