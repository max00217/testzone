import imaplib
import email

email_address = "이메일 적는 곶"
email_password = "앱 비밀번호 적는 곶"
keyword = "키워드"

mail = imaplib.IMAP4_SSL("imap.gmail.com")
mail.login(email_address, email_password)

mail.select("inbox")
type, data = mail.search(None, f'BODY "{keyword}"')

email_ids = data[0].split()

for e_id in email_ids:
    _, msg_data = mail.fetch(e_id, "(RFC822)")
    for response_part in msg_data:
        if isinstance(response_part, tuple):
            msg = email.message_from_bytes(response_part[1])

            print("Subject:", msg["subject"])
            print("From:", msg["from"])
            print("Date:", msg["date"])
            
    mail.store(e_id, "+FLAGS", "\\Deleted")

mail.expunge()
mail.close()
mail.logout()
