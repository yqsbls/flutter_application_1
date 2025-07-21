from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/')
def test():
    return jsonify({"msg": "hello world"})

@app.route("/api/data", methods=["POST"])
def receive_data():
    data = request.json
    return jsonify({"received": data})

if __name__ == '__main__':
    app.run(debug=True, port=5000)