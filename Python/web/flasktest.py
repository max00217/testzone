from flask import Flask

app = Flask(__name__)

@app.route('/')

@app.route('/home')
def home():
    return '''
    <h1>A.C.T.</h1>
    <p>웹 개발 인력 없음</p>
    <a href="https://discord.gg/HGTYEzfMGY">Stack OryangFlow</a>
    '''

@app.route('/user/<user_name>/<int:user_id>')
def user(user_name, user_id):
    return f'Hello, {user_name}({user_id})!'

if __name__ == '__main__':
    app.run(host = "0.0.0.0", port=5000)