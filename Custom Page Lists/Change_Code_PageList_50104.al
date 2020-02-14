page 50104 "Change Code"
{
    PageType = List;
    ApplicationArea = All;
    Caption = 'Change Code';
    UsageCategory = Lists;
    SourceTable = "Change Code";

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
            /* action(ActionName)
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
