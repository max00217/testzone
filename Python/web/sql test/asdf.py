from flask import Flask, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)

# MySQL 연결 설정
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '[비밀번호]'
app.config['MYSQL_DB'] = '[DB이름]'

mysql = MySQL(app)

# 글 목록 보기
@app.route('/')
def show_entries():
    cur = mysql.connection.cursor()
    cur.execute('SELECT id, title, text FROM entries ORDER BY id DESC')
    DB테이블이름 = cur.fetchall()
    cur.close()
    return render_template('show_entries.html', DB테이블이름=DB테이블이름)

# 글 작성 폼 보여주기
@app.route('/add', methods=['GET'])
def add_entry_form():
    return render_template('add_entry.html')

# 글 작성하기
@app.route('/add', methods=['POST'])
def add_entry():
    title = request.form['title']
    text = request.form['text']
    cur = mysql.connection.cursor()
    cur.execute('INSERT INTO entries (title, text) VALUES (%s, %s)', (title, text))
    mysql.connection.commit()
    cur.close()
    return '새 글이 작성되었습니다'

if __name__ == '__main__':
    app.run(host = "0.0.0.0", port=5000)