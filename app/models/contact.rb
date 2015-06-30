class Contact < ActiveRecord::Base
  has_no_table

  column :name, :string
  column :email, :string
  column :subject, :string
  column :message, :string

  attr_accessible :name, :email, :subject, :message

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :subject
  validates_presence_of :message
  validates_format_of :email,
                      :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :subject, :maximum => 50
  validates_length_of :message, :maximum => 500

  def update_spreadsheet
    connection = GoogleDrive.login(ENV["EMAIL_USERNAME"], ENV["EMAIL_PASSWORD"])
    ss = connection.spreadsheet_by_title('Website Contact')
    if ss.nil?
      ss = connection.create_spreadsheet('Website Contact')
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.new
    ws[last_row, 2] = self.name
    ws[last_row, 3] = self.email
    ws[last_row, 4] = self.subject
    ws[last_row, 5] = self.message
    ws.save
  end

end
