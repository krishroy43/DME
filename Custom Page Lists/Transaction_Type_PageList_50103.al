page 50103 "Transaction Type DME"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Transaction Type DME";
    Caption = 'Transaction Type';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            /*action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }*/
        }
    }

    var
        myInt: Integer;
}