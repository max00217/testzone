from flask import Flask, render_template, redirect, request, url_for
from flaskext.mysql import MySQL

mysql = MySQL()
app = Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'Jin714243#'
app.config['MYSQL_DATABASE_DB'] = 'FLASK_BASIC'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.secret_key = "ABCDEFG"
mysql.init_app(app)

@app.route('/')
def index():
    error = None
    if request.method == 'POST': # 게시판에 글 등록하기
        print("POST TEST")
        content = request.form['content']
        conn = mysql.connect()  # DB와 연결
        cursor = conn.cursor()  # connection으로부터 cursor 생성
        sql = "INSERT INTO content (id, content) VALUES ('%s', '%s')" % (id, content)  # 실행할 SQL문
        cursor.execute(sql)  # 메소드로 전달해 명령문을 실행
        new_data = cursor.fetchall()  # 실행한 결과 데이터를 꺼냄
 
        if not new_data:
            conn.commit()  # 변경사항 저장
            return redirect(url_for("index.html"))
 
    elif request.method == 'GET': # 처음 페이지가 로드되는 GET 통신
        conn = mysql.connect()  # DB와 연결
        cursor = conn.cursor()  # connection으로부터 cursor 생성 (데이터베이스의 Fetch 관리)
        sql = "SELECT content, id, times FROM content ORDER BY times desc" # 실행할 SQL문
        data = cursor.fetchall()  # 실행한 결과 데이터를 꺼냄
 
        data_list = []
 
        for obj in data: # 튜플 안의 데이터를 하나씩 조회해서
            data_dic = { # 딕셔너리 형태로
                # 요소들을 하나씩 넣음
                'con': obj[0],
                'writer': obj[1],
                'time':obj[2]
            }
            data_list.append(data_dic) # 완성된 딕셔너리를 list에 넣음
 
        cursor.close()
        conn.close()
 
        return render_template('home.html', error=error, name=id, data_list=data_list) # html을 렌더하며 DB에서 받아온 값들을 넘김
 
    return render_template('home.html', error=error, name=id)

@app.route('/submit', methods=['POST'])
def submit():
    title = request.form['title']
    content = request.form['content']
    # 여기서 게시글을 저장하는 코드를 작성합니다.
    return "게시글이 성공적으로 저장되었습니다!"

if __name__ == '__main__':
    app.run(host = "0.0.0.0", port=5000)