from flask import Flask

flaskApp = Flask(__name__)

@flaskApp.route("/")
def hello():
    return "<h1>Binod Suman Academy YouTube  </h1>"

if __name__ == "__main__":
    #flaskApp.run(debug=True, host='0.0.0.0', port=8080) 
    flaskApp.run()
    