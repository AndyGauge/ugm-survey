class Survey < ActiveRecord::Base
  has_many :answers
  belongs_to :client, class_name: "Person"
  belongs_to :staff,  class_name: "Person"

  def Survey.process params 
    survey = Survey.new
    survey.client = Person.client.where(name: params["client"]).first_or_create
    survey.staff = Person.staff.where(name: params["staff"]).first_or_create
    params["question"].each do |k,v|
      survey.answers.new(question: Question.find_by_slug(k),
                            value: v["value"],
                            comments: v["comments"])
    end
    survey.save
  end

  def send_mail
    mail = Mail.new(Email.new(email: 'andy@yetanother.site'),
      'New Work Therapy Survey for' + client.name,
      Email.new(email: 'andrewgauger@hotmail.com'),
      Content.new(type: 'text/html', value: html_email))
    SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY']).client.mail
      ._('send').post(request_body: mail.to_json)
  end  

  def html_email
    @survey = self
    ERB.new(File.read 'views/mail.erb').result(binding)
  end
end
