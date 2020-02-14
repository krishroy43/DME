page 50108 "Rate Type"
{
    PageType = List;
    Caption = 'Rate Type';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Rate Type";

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
            /*  action(ActionName)
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