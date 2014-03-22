class UserUploader
  def initialize
    @file = file
  end
  
  def import
    @file.read
  end
end
