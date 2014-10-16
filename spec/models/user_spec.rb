describe User do
	let(user){User.new(first_name: "Clark", last_name: "Kent", email: "ck@gmail.com", password: "superman")}
	context 'validations' do

		it "should have a valid have a email address " do
		  # expect(user.email).to ("New Post")
		end

		it 'should have a password' do 

		end
	end

	context 'associations' do 
		it { should have_many(:pantry_participations) }

		it { should have_many(:pantries)}
	end
end

describe Item do 
	context 'validations' do 
	end

	context 'associations' do 
		it { should belong_to(:prototype) }
		it { should belong_to(:pantry) }
	end
end
