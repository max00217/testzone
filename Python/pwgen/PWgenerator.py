from tkinter import *
from tkinter import ttk
from tkinter import messagebox
import string
import random

tk = Tk()

tk.title('오량인의 성능 안 좋은 비밀번호 생성기')
tk.geometry("390x170+0+0")
tk.resizable(False, False)
tk.configure(bg='#333333')
label = Label(tk, text="오량인의 성능 안 좋은 비밀번호 생성 및 관리 프로그램",height = 2, width = 56, bg = "#444444", fg = "skyblue").place(x=0,y=0)

def pw():
    global new_pw_len
    new_pw_len= int(entry3.get())
    pw_candidate = string.ascii_letters + string.digits + entry0.get()
    b=0
    global nameofpassword
    global new_pw
    new_pw = ""
    for i in range(new_pw_len):
        if new_pw_len >=40:
            messagebox.showinfo("","값이 너무 큽니다. 40 미만의 수를 사용해 주세요.")
            break
        else:
            pass
        a= random.choice(pw_candidate)
        new_pw+=a
        b+=1
        
        global nameofpassword
        
        label7 = Label(tk,text='생성된 비밀번호 이름 입력(저장에 사용) : ',bg='#333333', fg = "#FDFD96").place(x=5,y=142)
        nameofpw = Entry(tk,borderwidth = 0)
        nameofpw.place(x=235,y=144)
        nameofpassword = nameofpw.get()
        
        Newpw = Label(tk,text="생성된 비밀번호 : "+new_pw, width = 100, anchor = "w",bg='#333333', fg = "#FDFD96").place(x=5,y=120)
        Newpwq = Entry(tk,text=new_pw,borderwidth = 0)
        Newpwq.insert(0, new_pw)
        
        def copy():
            tk.clipboard_clear()
            tk.clipboard_append(new_pw)
            messagebox.showinfo("","클립보드에 복사되었습니다.")
            
        def fsave():
            f = open("pw.txt", 'a')
            f.write(f"{nameofpw.get()} : {new_pw}\n")
            f.close
            messagebox.showinfo("",'"{}"로저장되었습니다.'.format(nameofpw.get()))
            
        btn5 = Button(tk,text='비밀번호 저장',bg='#D98155',fg='white',command=fsave,height = 2, width = 15,borderwidth = 0).place(x=275,y=40)    
        btn3 = Button(tk,text='클립보드에 복사',bg='#D98155',fg='white',command=copy,height = 2, width = 15,borderwidth = 0).place(x=275,y=80)


label3 = Label(tk,text='비밀번호 자릿수 입력:',bg='#333333', fg = "#FDFD96").place(x=5,y=43)
label0 = Label(tk,text='사용할 특수문자 입력:',bg='#333333', fg = "#FDFD96").place(x=5,y=68)
entry3 = Entry(tk,borderwidth = 0)
entry0 = Entry(tk,borderwidth = 0)
entry3.place(x=130,y=45)
entry0.place(x=130,y=70)      
btn1 = Button(tk,text='비밀번호 생성',height = 1, width = 37 ,bg='#D98155',fg='white', command=pw,borderwidth = 0).place(x=7,y=95)

tk.mainloop()