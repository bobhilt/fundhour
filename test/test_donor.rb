require_relative '../bin/donor'

class TestDonor < Minitest::Test

    def donor_factory(id)
        #ToDo: add faker for generating better attributes
        Donor.new({id: id, 
                    name:{first_name: "John#{id}",
                        last_name: "Adams#{id}"
                    },
                    contact_info: {
                            phone: "555-234-456#{id}",
                            email: "john.adams#{id}@example.com"
                    }
                })
    end

    def test_donor_properties
        donor = donor_factory(1)

        assert_respond_to(donor, :id)
        assert_respond_to(donor, :name)
        assert_respond_to(donor, :contact_info)
        assert_equal(1, donor.id)
        assert_equal('John1', donor.name[:first_name])
        assert_equal('Adams1', donor.name[:last_name])
    end

    def test_donor_attributes_property
        donor = donor_factory(7)
        assert_equal('555-234-4567',donor.contact_info[:phone])
        assert_equal('john.adams7@example.com',donor.contact_info[:email])
    end

    def test_method_responses
        donor = donor_factory(1)
        assert_respond_to(donor, :get_donations)
        assert_respond_to(donor, :save)
    end

    def test_donor_save
        donor = donor_factory(44)
        assert_equal(donor, donor.save) 
        assert_equal(donor.contact_info[:email], 'john.adams44@example.com')
    end

end
=begin
id
created_at (Time.now)
name {first, last}
contact_info {phone, email}    
=end
    
