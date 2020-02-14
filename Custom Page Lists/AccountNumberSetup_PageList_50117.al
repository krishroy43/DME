page 50117 "Account No. Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Account No. Setup";
    caption = 'Account No. Setup';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Fill Firm Id"; "Fill Firm Id")
                {
                    ApplicationArea = All;
                }
                field("Type Of Member"; "Type Of Member")
                {
                    ApplicationArea = All;
                }
                field(Code; Code)
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