page 50106 "Invoice Type"
{
    PageType = List;
    Caption = 'Invoice Type';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Invoice Type";

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