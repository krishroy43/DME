pageextension 50122 VendorBankAccPage extends "Vendor Bank Account Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Bank Account No.")
        {
            field("BIC Code for Bene Bank"; "BIC Code for Bene Bank")
            {
                ApplicationArea = All;
            }
            field("Route Code"; "Route Code")
            {
                ApplicationArea = All;
            }
            field("Sort Code"; "Sort Code")
            {
                ApplicationArea = All;
            }
            field("BIC_SWIFT Intermediary Bank 1"; "BIC_SWIFT Intermediary Bank 1")
            {
                ApplicationArea = All;
            }
        }
        // modify(Description)
        // {
        //     Editable = false;
        // }
    }

    actions
    {

        // Add changes to page actions here
    }

    var
        myInt: Integer;
}