pageextension 50108 PageExtension50100 extends "Vendor List"
{
    layout
    {
        addafter(Name)
        {
            field("VAT Registration No."; "VAT Registration No.")
            {
                ApplicationArea = All;
            }
            field("VAT Bus. Posting Group50391"; "VAT Bus. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Vendor Posting Group36188"; "Vendor Posting Group")
            {
                ApplicationArea = All;
            }
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Phone No.")
        {
            Visible = false;
        }
        modify(Contact)
        {
            Width = 9;
        }
    }
    actions
    {
    }
}
