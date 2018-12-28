**Fund Hour Demo**

Rules:
* Fundraiser model
* Ruby object model
* Tested
* 1hr limit

**Process:**
Preparation:
Refresh on Ruby. Review: POODR (-Sandi Metz); practice to retrain muscle memory. 

Complete design. 
Do timed Implementation, 
Push.

Hardest part is cutting valuable elements from model due to time constraint, creating a workable model in time, but without things I’d like to include.
 
Principles: 
“SOLID”;
Preserve changeability;  
Focus on messages (what) & trusting, not prescribing (how); 
Test first;
Early design, sticking to flexible interface, e.g., hash arguments for constructors, anticipating further
definition and changes down the road.

**Model**
    
Donor
id
created_at (Time.now)
name {first, last}
contact_info {phone, email}

methods
initialize
save
accessors: name, contact_info
attr_readers: id, created_at
get_donations -- donation objects array

Campaign
id
group = {:id, :name, :description} 
goal_amount
campaign_start
campaign_end
status
manager
description
notes

methods
initialize
save
get_amount_raised
accessors: group, goal_amount, campaign_start, campaign_end, status, manager, description,              notes
attr_readers: id

Donation
donor_id
campaign_id
created_at
[composite key above—could be more than one donation per donor+campaign]
source
amount
message
notes

methods
initialize
save
accessors: source, amount, message, notes
attr_readers: donor_id, campaign_id, created_at

Ideas considered, cut for time:
* User Auth
* Payment processingDonors, Group Manager, Group Members as subclass of person
* Group —Start with group as campaign attribute, enhance with time/clarification
* GroupCampaign (Multiple campaigns per group).
* Group UsersCampaign message manager
* Campaign Manager 
* Marketing
* SWAG sales
* Persistence to datastore, per instructions.
* Validation of attributes, business rules
* Donation followup, thanks, messaging flow (CRM interface)
* With persistence, add:
    * self.find (id)      #find by id
    * self.where(attributes)      #find by criteria hash

Model
Person
    person_id
    create_date
    name {first, last}
    contact_info

Donor -< Person
    id
    name {first, last}
    contact_info {phone, email}

    methods
        intialize
        save
        accessors (name, contact_info)
        attr_reader (id)
        get_donations

Campaign
    campaign_id
    group = Struct.new(:id, :name, :desc) should this be a hash?  I want a group name & description as well.
    goal = Struct.new(:amount, :currency, :units)
    dates = Struct.new(:start_date, :end_date) #Flexibility for milestone dates
    status
    manager < person
    tag_line
    description
    notes

    methods
        initialize
        save
        get_amount_raised
        accessors

Donation
    donor_id
    campaign_id
    datetime
    [composite key above—could be more than one donation per donor+campaign]
    amount
    message
    notes
    
Messages        
* Create campaign
* Update campaign
* Add/Update Donor
* Update contact info
* Add donation
* Add campaign

Ideas considered, cut for time:
* Super-class person --Donors, Group Manager, Group Members  
* Group —Start with group as campaign attribute, enhance with time/clarification
* GroupCampaign (Multiple campaigns per group).
* Organization (parent organization for Groups, e.g., School with groups Girls Basketball, Varsity Football)
* Group UsersCampaign message manager
* Campaign Manager (person)
* User Auth (donors, group members, 
* Payment processing
* Marketing
* SWAG sales
* Persistence to datastore, per instructions.
* Validation of attributes, business rules
* Donation Followup, thanks, messaging flow
* With persistence, add:
* self.find (id) #find by id
* self.where(attributes) #find by criteria hash
* Superclass Person (group member, manager, donors)