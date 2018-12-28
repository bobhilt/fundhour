require_relative '../bin/campaign'
require 'date'

class TestCampaign < Minitest::Test

    def campaign_factory(id, group_id)
        Campaign.new({id: id,
            title: "Campaign #{id}",
            group:{id: group_id,
                    name: "Public School #{group_id}",
                    description: "A school raising money #{id}"
                    },
            goal_amount: 10000 * id,
            attributes: {campaign_start: Date.today + 7,
                    campaign_end: Date.today + 37,
                    status: "planning",
                    manager: "Mary Madison#{id}",
                    description: "For #{group_id} basic program costs"
                    }
            })
    end

    def test_campaign_properties
        campaign = campaign_factory(1,22)

        assert_respond_to(campaign, :id)
        assert_respond_to(campaign, :title)
        assert_respond_to(campaign, :group)
        assert_equal('Public School 22',campaign.group[:name])
        assert_respond_to(campaign, :attributes)

        assert_equal(1, campaign.id)
        assert_equal(22, campaign.group[:id])
        assert_equal('Campaign 1', campaign.title)
        assert_equal(10000, campaign.goal_amount)
    end

    def test_campaign_attributes_property
        campaign = campaign_factory(2, 33)

        assert_equal('Mary Madison2', campaign.attributes[:manager])
        assert_equal(Date.today + 7, campaign.attributes[:campaign_start])
        assert_equal(Date.today + 37, campaign.attributes[:campaign_end])
        assert_match(/For 33 basic/, campaign.attributes[:description])
    end

    def test_method_responses
        campaign = campaign_factory(1, 2)
        assert_respond_to(campaign, :get_donations)
        assert_respond_to(campaign, :save)
    end

    def test_campaign_save
        campaign = campaign_factory(22,44)
        assert_equal(campaign, campaign.save) 
        assert_in_delta(Time.now, campaign.created_at)
        #sanity check one value after save
        assert_equal(220000, campaign.goal_amount)
    end

end
