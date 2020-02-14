pageextension 50107 PostedSalesCrMemo extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Unit Price")
        {
            field("Original Quantity"; "Original Quantity")
            {
                ApplicationArea = All;
            }
            field("Broker Code"; "Broker Code")
            {
                ApplicationArea = All;
            }
            field("Broker Name"; "Broker Name")
            {
                ApplicationArea = All;
            }
            field(Tag50; Tag50)
            {
                ApplicationArea = All;
            }
            field("Contract YYYY MM"; "Contract YYYY MM")
            {
                ApplicationArea = All;
            }
            field("Invoice Status"; "Invoice Status")
            {
                ApplicationArea = All;
            }
            field("Type Name"; "Type Name")
            {
                ApplicationArea = All;
            }
            field("Rate Type"; "Rate Type")
            {
                ApplicationArea = All;
            }
            field("Account Owner Title"; "Account Owner Title")
            {
                ApplicationArea = All;
            }

            field("Type of Member"; "Type of Member")
            {
                ApplicationArea = All;
            }
            field("Participant Account"; "Participant Account")
            {
                ApplicationArea = All;
            }
            field(Month; Month)
            {
                ApplicationArea = All;
            }
        }

        addafter(Description)
        {
            field("Add. Description"; "Add. Description")
            {
                ApplicationArea = All;
            }
        }
        /*  modify(Description)
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