import os
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello there, this is flask app 2! \n'

if __name__ == '__main__':
    app.run(debug=True, port=int(os.getenv("PORT", 5001)))
