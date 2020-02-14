pageextension 50124 SalesInvoicePage extends "Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Bank Account No."; "Bank Account No.")
            {
                ApplicationArea = all;
            }
            field("Correspondent Bank Account No."; "Correspondent Bank Account No.")
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

