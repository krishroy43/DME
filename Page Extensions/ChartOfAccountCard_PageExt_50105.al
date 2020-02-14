/*pageextension 50105 ChartOfAccountCard extends "G/L Account Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Cost Accounting")
        {
            group("DME Setup")
            {
                field("Type Name"; "Type Name")
                {
                    ApplicationArea = All;
                }
                field("Commodity Code"; "Commodity Code")
                {
                    ApplicationArea = All;
                }
                field(Venue; Venue)
                {
                    ApplicationArea = All;
                }
                field("Rate Type"; "Rate Type")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}*/