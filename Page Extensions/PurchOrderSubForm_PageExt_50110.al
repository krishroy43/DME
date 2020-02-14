pageextension 50110 PurchOrderSubForm extends "Purchase Order Subform"
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
        addbefore("Variant Code")
        {
            field("Deferral Code_"; "Deferral Code")
            {
                ApplicationArea = All;
                Caption = 'Deferral Code';
            }
        }
        modify("Deferral Code")
        {
            Visible = false;
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