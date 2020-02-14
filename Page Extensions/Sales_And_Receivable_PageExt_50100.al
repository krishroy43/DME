/*pageextension 50100 "Sales & Receivable PageExt" extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Dynamics 365 for Sales")
        {
            group("DME Setup")
            {
                field("Member No."; "Member No.")
                {
                    ApplicationArea = All;
                }
                field("Non-Member No."; "Non-Member No.")
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

}*/