require_relative '../bin/campaign'
require 'date'

class TestCampaign < Minitest::Test

    def campaign_factory(id, group_id)
        campaign.new({id: id,
            title: "Campaign #{id}",
            group:{id: group_id,
                    name: "Public School#{group_id}",
                    description: "A school raising money #{id}"
                    },
                    goal_amount: 10000 * id,
                    campaign_start: Date.today + 7,
                    campaign_end: Date.today + 37,
                    status: "planning",
                    manager: "Mary Madison#{id}",
                    description: "For basic program costs"
                })
    end

    def test_campaign_properties
        campaign = campaign_factory(1,22)

        assert_respond_to(campaign, :id)
        assert_respond_to(campaign, :group)
        assert_respond_to(campaign, :description)
        assert_respond_to(campaign, :goal_amount)
        assert_respond_to(campaign, :campaign_start)
        assert_respond_to(campaign, :campaign_end)
        assert_respond_to(campaign, :status)
        assert_respond_to(campaign, :manager)
        assert_respond_to(campaign, :description)

        assert_equal(1, campaign.id)
        assert_equal(22, campaign.group[:id])
        #ToDo: Etc. for other attributes
    end

    def test_campaign_attributes_property
        campaign = campaign_factory(2, 33)
        assert_equal('Public School 33',campaign.group[:name])
    end

    def test_method_responses
        campaign = campaign_factory(1)
        assert_respond_to(campaign, :get_donations)
        assert_respond_to(campaign, :save)
    end

    def test_campaign_save
        campaign = campaign_factory(44)
        assert_equal(campaign, campaign.save) 
        assert_equal(campaign.contact_info[:email], 'john.adams44@example.com')
    end

end
=begin
id
created_at (Time.now)
name {first, last}
contact_info {phone, email}    
=end
    

