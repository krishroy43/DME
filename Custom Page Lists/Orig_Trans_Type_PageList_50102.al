page 50102 "Original Transaction Type Name"
{
    PageType = List;
    Caption = 'Original Transaction Type Name';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Original Transaction Type Name";

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