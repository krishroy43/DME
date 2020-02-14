pageextension 50102 SalesInvSubForm extends "Sales Invoice Subform"
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
            field("Commodity Code"; "Commodity Code")
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
            field("Main Account Number"; "Main Account Number")
            {
                ApplicationArea = All;
            }
            field("Account Number"; "Account Number")
            {
                ApplicationArea = All;
            }
            field("Trade Date"; "Trade Date")
            {
                ApplicationArea = All;
            }
            field(Venue; Venue)
            {
                ApplicationArea = All;
            }
            field("Tran Type Name"; "Tran Type Name")
            {
                ApplicationArea = All;
            }
            field("Orig Tran Type Name"; "Orig Tran Type Name")
            {
                ApplicationArea = All;
            }
            field("Change Code"; "Change Code")
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
        addlast(Control1)
        {

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