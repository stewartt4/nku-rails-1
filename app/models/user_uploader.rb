class UserUploader
  def initialize(file)
    @file = file
    import
  end
 
  def import
    #@count = 0
    CSV.foreach(@file.path, headers: true, header_converters: :symbol) do |row|
      email = row.delete(:email)
      #if Assignment.where("user_id = ? AND assignment_name = ?", row[:user_id], row[:assignment_name]).blank?
      #  @count += 1
      #end
      row[:user_id] = User.find_by_email!(email).id
      assignment = Assignment.find_or_initialize_by_user_id_and_assignment_name(row[:user_id], row[:assignment_name])
      assignment.update_attributes(row.to_hash)
    end
  end
end
