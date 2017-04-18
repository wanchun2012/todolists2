class Profile < ActiveRecord::Base
	belongs_to :user
	
	validate :either_first_name_or_last_name_should_not_be_nil
	validate :boy_name_should_not_be_sue
	validates :gender, presence: true, inclusion: {in: ["male", "female"], message: "Must be male or female"}

	def either_first_name_or_last_name_should_not_be_nil
		if first_name.nil? and last_name.nil?
			errors.add(:first_name, "does not allow a Profile with a null first and last name")
		end
	end

	def boy_name_should_not_be_sue
		if gender == "male" && first_name == "Sue" 
			errors.add(:gender, "does not allow a boy named Sue")
		end
	end

	default_scope { order :birth_year}
	scope :get_all_profiles, -> (min, max) { where("birth_year BETWEEN ? AND ?", "#{min}", "#{max}") }
end
