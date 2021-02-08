from flask import Flask,request,jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///./user_database.db'
db = SQLAlchemy(app)

# this class is for creating tables in db
class user(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80))
    password = db.Column(db.String(80))

@app.route('/') 
def home():
    return "Home" 

@app.route("/login",methods=["GET", "POST"])
def login():
    d = {}
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        
        login = user.query.filter_by(username=username, password=password).first()

        if login is not None:
            # account found
            d["status"] = 11
            return jsonify(d)
        else:
            # account not exist
            d["status"] = 22
            return jsonify(d)
            


@app.route("/register", methods=["GET", "POST"])
def register():
    d = {}
    if request.method == "POST":
        uname = request.form['username']
        passw = request.form['password']
        username = user.query.filter_by(username=uname).first()
        if username is None:
            register = user(username = uname, password = passw)
            db.session.add(register)
            db.session.commit()
            d["status"] = 11
            return jsonify(d)
        else:
            # already exist
            d["status"] = 22
            return jsonify(d)

if __name__ == "__main__":
    db.create_all()
    app.run(debug=True)
