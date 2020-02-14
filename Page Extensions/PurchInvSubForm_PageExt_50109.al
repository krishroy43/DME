pageextension 50109 PurchInvSubForm extends "Purch. Invoice Subform"
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