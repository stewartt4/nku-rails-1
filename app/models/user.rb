class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :default => :identicon
end
