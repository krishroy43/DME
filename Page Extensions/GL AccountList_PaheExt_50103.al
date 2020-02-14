/*pageextension 50103 "G/L Account List Page Ext" extends "G/L Account List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Direct Posting")
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

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}*/