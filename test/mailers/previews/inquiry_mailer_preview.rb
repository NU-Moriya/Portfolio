# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
# ----追記-----
  def send_mail
     inquiry = Inquiry.new(name: "侍 太郎", message: "問い合わせメッセージ")

     InquiryMailer.inquiry_mail(inquiry)
  end
#----追記ここまで----
end