require_relative '../bin/donation'

class TestDonation < Minitest::Test

    def donation_factory(donation_id, donor_id, campaign_id, amount)
        Donation.new({id: donation_id, 
            donor_id: donor_id, 
            campaign_id: campaign_id,
            amount: amount, 
            attributes: {source: "http://#{donation_id}_#{donor_id}", 
                    message: "Good luck with your season ! -Love, Uncle #{donor_id}",
                    notes: "Here's more stuff for donation to donation #{donation_id}"
                    }
            })
    end

    def test_donation_properties
        donation = donation_factory(1,2,3,100.00)

        assert_respond_to(donation, :id)
        assert_respond_to(donation, :campaign_id)
        assert_respond_to(donation, :donor_id)
        assert_respond_to(donation, :amount)
        assert_respond_to(donation, :attributes)
        assert_respond_to(donation, :created_at)
        assert_equal(1,donation.id)
        assert_equal(2, donation.donor_id)
        assert_equal(3, donation.campaign_id)
        assert_equal(100.0, donation.amount)
        assert_equal('http://1_2', donation.attributes[:source])
        assert_match(/Uncle 2/, donation.attributes[:message])
        
    end
    
    def test_donation_save
        donation = donation_factory(1,22,44,5.23)
        assert_equal(donation, donation.save) 
        assert_in_delta(Time.now, donation.created_at)
        #sanity check one value after save
        assert_equal(5.23, donation.amount)
    end


end