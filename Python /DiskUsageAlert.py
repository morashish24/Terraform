import os 
import smtplib
from email.message import EmailMessage

# Threshold for disk usage percentage 

DISK_USAGE_THRESHOLD = 80 

# Email configuration 

SMTP_SERVER = "smtp.gmail.com"
SMTP_PORT = 587
SENDER_EMAIL = "your_gmail@gmail.com"
SENDER_PASSWORD = "your_password"
RECIPIENT_EMAIL = "recipient_email@gmail.com"

def get_disk_usage ():
    """ Gets the current disk usage percentage."""
    disk_usage = os.popen("df / --output=pcent | tail -1").strip().replate('%', '')
    return int (disk_usage)

def send_email_alert ( usage ):

    """Sends an email alert if disk usage exceeds the threshold."""

    subject = "Disk Usage Alert"
    body = f"Warning! Disk usage has reached {usage}%"

    msg = EmailMessage()
    msg.set_content(body)
    msg["Subject"] = subject 
    msg["From"] = SENDER_EMAIL
    msg["To"] = RECIPIENT_EMAIL

    # Content to the SMTP server and send the email 

    try: 
        with smtpllib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
            
            server.startls()
            server.login(SENDER_EMAIL, SENDER_PASSWORD)
            server.send_message(msg)
            print ( "Alert email sent Successfully!")

    except Exception as e:

        print ( f"Failed to end email: {e}")

def main():

    """Main function to monitor disck usage and send alerts"""

    usage = get_disk_usage()

    print (f"Current disk usage: {usage}")

    if usage > DISK_USAGE_THRESHOLD:

        send_email_alert(usaage)

if __name__ == "__main__":

    main ()

    
