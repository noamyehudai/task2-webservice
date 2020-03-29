#!/usr/bin/python3
from flask import Flask
from flask import request
import redis

# Connect to the remote DB
db = redis.Redis('localhost')

# Initialize the counter
db.set("num_posts", 0)

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def index():
    counter = db.get("num_posts")
    if request.method == "POST":
        db.incr("num_posts")
        return 'posted successfully!'
    else:
        return str(counter)


app.run(host='0.0.0.0', port=5000)
