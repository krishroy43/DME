page 50101 Venue
{
    PageType = List;
    Caption = 'Venue';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Venue;

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