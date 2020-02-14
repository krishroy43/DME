pageextension 50118 GeneralLEdSetup extends "General Ledger Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter(Application)
        {
            group("Bank Accounts")
            {
                field("Bank Account No."; "Bank Account No.")
                {
                    ApplicationArea = All;
                }
                field("Correspondent Bank Account No."; "Correspondent Bank Account No.")
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
}