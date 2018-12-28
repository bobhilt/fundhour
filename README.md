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
Push at 1hr (campaign not completed, donation not started)
 
Principles: 
“SOLID”;
Preserve changeability;  
Focus on messages (what) & trusting, not prescribing (how); 
Test first;
Early design, sticking to flexible interface, e.g., hash arguments for constructors, anticipating further
definition and changes down the road.

Hardest part is cutting valuable elements from model due to time constraint, creating a workable model in time, but without things I’d like to include.

**Ideas considered, cut for time:**
* Super-class person --Donors, Group Manager, Group Members  
* Group —Started with group as campaign attribute, enhance as separate class with time/clarification
* GroupCampaign (Multiple campaigns per group).
* Organization (parent organization for Groups, e.g., School with groups Girls Basketball, Varsity Football)
* Group UsersCampaign message manager
* Campaign Manager (person)
* User Auth (donors, group members, 
* Payment processing
* Marketing
* SWAG sales
* Validation of attributes, business rules
* Donation Followup, thanks, messaging flow
* Persistence to datastore, skipped per instructions/time constraints.
* With persistence, add:
** Searchability: self.find (id) #find by id, self.where(attributes) #find by criteria hash
