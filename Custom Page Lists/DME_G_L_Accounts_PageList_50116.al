page 50116 "DME G/L Accounts"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "DME G/L Accounts";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("TYPE NAME"; "TYPE NAME")
                {
                    ApplicationArea = All;
                }
                field("COMMODITY CODE"; "COMMODITY CODE")
                {
                    ApplicationArea = All;
                }
                field(VENUE; VENUE)
                {
                    ApplicationArea = All;
                }
                field("RATE TYPE"; "RATE TYPE")
                {
                    ApplicationArea = All;
                }
                field("G/L Account Name"; "G/L Account Name")
                {
                    ApplicationArea = All;
                }
                field("G/L Account Number"; "G/L Account Number")
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