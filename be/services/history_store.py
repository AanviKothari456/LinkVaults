# services/history_store.py

history_log = []

def save_summary(url, summary):
    history_log.append({"url": url, "summary": summary})

def get_history():
    return history_log[::-1]  # return most recent first
