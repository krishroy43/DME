page 50111 "Sales Invoice Creation"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Invoice Creation";
    Caption = 'Sales Invoice Creation';
    DeleteAllowed = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Month; Month)
                {
                    ApplicationArea = All;
                }
                field("Participant Account"; "Participant Account")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Segment"; "Customer Segment")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Member Category"; "Member Category")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Domicile Region"; "Domicile Region")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Domicile Country"; "Domicile Country")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Fill Firm Id"; "Fill Firm Id")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Firm Name"; "Firm Name")
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
                field("Invoice Created"; "Invoice Created")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Invoice No."; "Invoice No.")
                {
                    // Editable = false;
                    ApplicationArea = All;
                    Style = StrongAccent;
                }
                field("Process Date"; "Process Date")
                {
                    ApplicationArea = All;
                }
                field("Trade Date"; "Trade Date")
                {
                    ApplicationArea = All;
                }
                field("Product Exchange"; "Product Exchange")
                {
                    ApplicationArea = All;
                }
                field(Venue; Venue)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Tran Type Name"; "Tran Type Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Orig Tran Type Name"; "Orig Tran Type Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Change Code"; "Change Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Commodity Code"; "Commodity Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("FUT Opt Ind"; "FUT Opt Ind")
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
                    Editable = false;
                }
                field("Contract YYYY MM"; "Contract YYYY MM")
                {
                    ApplicationArea = All;
                }
                field("Invoice Status"; "Invoice Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Type Name"; "Type Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Rate Type"; "Rate Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Rate; Rate)
                {
                    ApplicationArea = All;
                }
                field("Account Owner Title"; "Account Owner Title")
                {
                    ApplicationArea = All;
                }
                field("Account Owner 1"; "Account Owner 1")
                {
                    ApplicationArea = All;
                }
                field("Account Owner 2"; "Account Owner 2")
                {
                    ApplicationArea = All;
                }
                field("Account Owner 3"; "Account Owner 3")
                {
                    ApplicationArea = All;
                }
                field("fee Quantity"; "fee Quantity")
                {
                    ApplicationArea = All;
                }
                field("Quantity To Invoice"; "Quantity To Invoice")
                {
                    ApplicationArea = All;
                }
                field("Applied fees"; "Applied fees")
                {
                    ApplicationArea = All;
                }
                field("Type of Member"; "Type of Member")
                {
                    ApplicationArea = All;
                }
                field(Error; Error)
                {
                    ApplicationArea = All;
                    Style = Attention;
                }

            }

        }
        area(Factboxes)
        {

        }

    }


    actions
    {
        area(Processing)
        {
            action("Generate Invoice")
            {
                ApplicationArea = All;
                Image = CreateJobSalesInvoice;
                trigger OnAction();
                var
                    DME_Fn: Codeunit "DME Functions";
                begin
                    DME_Fn.SalesInvoiceCreation();
                end;
            }
        }
    }
    trigger OnDeleteRecord(): Boolean
    var
        Text001: Label 'The Invoice is already created for this row. Do you still want to contunue?';
    begin
        if Rec."Invoice Created" AND (Rec."Invoice No." <> '') then begin
            // if Confirm(Text001, FALSE) then
            //     exit(true)
            // else
            exit(false);
        end;
    end;
}