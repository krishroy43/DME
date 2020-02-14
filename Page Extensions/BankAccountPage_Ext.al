pageextension 50121 BankAccountPage extends "Bank Account Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Bank Branch No.")
        {
            field("Bank Branch Name"; "Bank Branch Name")
            {
                ApplicationArea = all;
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

