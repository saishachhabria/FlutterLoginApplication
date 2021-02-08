# Flutter Login Application

Used Flutter SDK with Android Studio to design the login screen as per the given specifications.

For the backend, I used Python - Flask, and SQL. I created a Flask API with a user database using SQL. The application is sending a POST request to the API and verifying the credentials. 

The website needs to be hosted as I was getting an error with the localhost. I used ngrok for temporary hosting.

## Setup

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
pip install -r requirements.txt
```

## Steps

1. Navigate to the flask_backend folder and execute the command
```bash
python app.py
```
2. Open another terminal and host the API
```bash
ngrok http 5000
```
3. The generate http link needs to be copied in the code where the http post request is being made. 
```bash
ngrok by @inconshreveable 
Session Status                online
Account                       saisha98@gmail.com (Plan: Free)
Version                       2.3.35
Region                        United States (us)
Web Interface                 http://127.0.0.1:4040
Forwarding                    http://113194e5f107.ngrok.io -> http://localhost:5000
Forwarding                    https://113194e5f107.ngrok.io -> http://localhost:5000
```
[http://113194e5f107.ngrok.io/login](http://113194e5f107.ngrok.io) needs to be copied and pasted on **Line 241, in login_screen.dart**

4. Open an editor or Android Studio and run the flutter

5. New users:
The users can be added via a CURL command or manually into the .db file, it would be easy to integrate the same from the flutter application too.

```bash
Status 11: Successful
Status 22: Unsuccessful
```

```bash
CURL -X POST http://127.0.0.1:5000/register -d "username=username&password=password" 
```
