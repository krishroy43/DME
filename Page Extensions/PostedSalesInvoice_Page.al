pageextension 50120 PostedSalesInvoicePage extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Bank Account No."; "Bank Account No.")
            {
                ApplicationArea = all;
            }
            field("Correspondent Bank Account No."; "Correspondent Bank Account No.")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        addafter("&Navigate")
        {
            group(PostedInvoice)
            {
                action(PostedInvoice1)
                {
                    Image = Report;
                    Caption = 'ClearingInvoice';
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        SalesInvoice_Rec.Reset();
                        SalesInvoice_Rec.SetRange("No.", Rec."No.");
                        if SalesInvoice_Rec.FindFirst() then
                            Report.RunModal(50106, true, true, SalesInvoice_Rec);


                    end;

                }
                action(Non_ClearingInvoice)
                {
                    Image = Report;
                    Caption = 'Non_ClearingInvoice';
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        SalesInvoice_Rec.Reset();
                        SalesInvoice_Rec.SetRange("No.", Rec."No.");
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

