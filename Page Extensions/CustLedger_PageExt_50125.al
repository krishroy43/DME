pageextension 50125 CustLedger extends "Customer Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Currency Code")
        {
            field(Month; Month)
            {
                ApplicationArea = all;
            }
        }
        addafter("Document No.")
        {
            field("Document Date"; "Document Date")
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