from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World!"

@app.route('/demo')
def demo():
    return "This is a demo page."

@app.route('/error')
def error():
    response = jsonify({'message': 'An error occurred'})
    response.status_code = 500
    return response

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
