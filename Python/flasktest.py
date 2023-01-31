from flask import Flask

app = Flask(__name__)

@app.route('/')

@app.route('/home')
def home():
    return '''
    <h1>HTML 제목</h1>
    <p>HTML 본문 </p>
    <a href="https://discord.gg/HGTYEzfMGY">Stack OryangFlow</a>
    '''

@app.route('/user/<user_name>/<int:user_id>')
def user(user_name, user_id):
    return f'Hello, {user_name}({user_id})!'

if __name__ == '__main__':
    app.run(host = "0.0.0.0")