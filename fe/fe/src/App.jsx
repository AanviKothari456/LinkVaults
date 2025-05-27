import React, { useState } from "react";
import axios from "axios";

function App() {
  const [url, setUrl] = useState("");
  const [summary, setSummary] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const res = await axios.post("/api/summarize", { url });
      setSummary(res.data.summary);
    } catch (err) {
      setSummary("Error: " + (err.response?.data?.error || err.message));
    }
    setLoading(false);
  };

  return (
    <div className="min-h-screen bg-gray-100 flex flex-col items-center justify-center p-6">
      <h1 className="text-3xl font-bold mb-4">🔗 LinkVault</h1>
      <form onSubmit={handleSubmit} className="w-full max-w-md flex flex-col gap-4">
        <input
          type="text"
          value={url}
          onChange={(e) => setUrl(e.target.value)}
          placeholder="Paste your link here"
          className="p-3 rounded border border-gray-300"
          required
        />
        <button
          type="submit"
          className="bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700"
        >
          {loading ? "Summarizing..." : "Summarize"}
        </button>
      </form>
      {summary && (
        <div className="mt-6 w-full max-w-md bg-white p-4 rounded shadow">
          <h2 className="text-lg font-semibold mb-2">🧠 Summary</h2>
          <p>{summary}</p>
        </div>
      )}
    </div>
  );
}

export default App;
