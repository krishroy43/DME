pageextension 50117 CashReeciptJournal extends "Cash Receipt Journal"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Add. Description"; "Add. Description")
            {
                ApplicationArea = All;
            }
        }
        /* modify(Description)
         {
             Editable = false;
         }*/
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}