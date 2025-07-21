from flask import Flask, jsonify, request
from flask_cors import CORS
from llm.models.gemini import Gemini, GeminiModel
from llm.llm_init import LLM

app = Flask(__name__)
CORS(app)

llm = LLM(Gemini(api_key='', model=GeminiModel.GEMINI_PRO))


@app.route('/')
def test():
    return jsonify({"msg": "hello world"})

@app.route("/api/analyse", methods=["POST"])
def analyse():
    data = request.json
    return jsonify({"received": data})

if __name__ == '__main__':
    app.run(debug=True, port=5000)