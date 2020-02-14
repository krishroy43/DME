pageextension 50123 PostedSalesInvoicesPageExtends extends "Posted Sales Invoices"
{
    layout
    {
        addafter("Location Code")
        {
            field("User ID"; "User ID")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        addafter(Print)
        {
            group(PostedInvoice)
            {
                action(PostedInvoice1)
                {
                    Image = Report;
                    Caption = 'Clearing Invoice';
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        SalesInvoice_Rec.Reset();
                        SalesInvoice_Rec.SetRange("No.", "No.");
                        if SalesInvoice_Rec.FindFirst() then
                            Report.RunModal(50106, true, true, SalesInvoice_Rec);


                    end;

                }
                action(Non_ClearingInvoice)
                {
                    Image = Report;
                    Caption = 'Non_Clearing Invoice';
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        SalesInvoice_Rec.Reset();
                        SalesInvoice_Rec.SetRange("No.", "No.");
                        if SalesInvoice_Rec.FindFirst() then
                            Report.RunModal(50107, true, true, SalesInvoice_Rec);
                    end;
                }
            }
        }
    }

    var
        myInt: Integer;
        SalesInvoice_Rec: Record "Sales Invoice Header";
}

pageextension 50127 PostedPurchInv extends "Posted Purchase Invoices"
{
    layout
    {
        // Add changes to page layout here
        addafter("Location Code")
        {
            field("User ID"; "User ID")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}

pageextension 50128 VendorLedgerEntries extends "Vendor Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document No.")
        {
            field("Document Date"; "Document Date")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}


