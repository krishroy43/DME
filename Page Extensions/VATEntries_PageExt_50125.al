pageextension 50126 VATENtries extends "VAT Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Type)
        {
            field("Vendor Invoice No."; "Vendor Invoice No.")
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
}