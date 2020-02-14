page 50109 "DME Participants"
{
    PageType = List;
    ApplicationArea = All;
    Caption = 'DME Participants';
    UsageCategory = Administration;
    SourceTable = "DME Participants";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("DME Participant Account"; "DME Participant Account")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = All;

                }
                field("Customer Segment"; "Customer Segment")
                {
                    ApplicationArea = All;
                }
                field("Member Category"; "Member Category")
                {
                    ApplicationArea = All;

                }
                field("Domicile Region"; "Domicile Region")
                {
                    ApplicationArea = All;

                }
                field("Domicile Country"; "Domicile Country")
                {
                    ApplicationArea = All;
                }
                field("DME Vendor"; "DME Vendor")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    var
        myInt: Integer;

}