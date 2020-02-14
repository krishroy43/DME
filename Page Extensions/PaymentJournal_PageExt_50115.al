pageextension 50115 PaymentJournal extends "Payment Journal"
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
            field("Pay Mode"; "Pay Mode")
            {
                ApplicationArea = All;
            }
            field("Charge Type"; "Charge Type")
            {
                ApplicationArea = All;
            }
            field("Transaction Type"; "Transaction Type")
            {
                ApplicationArea = All;
            }
            field("Payment Type"; "Payment Type")
            {
                ApplicationArea = All;
            }
            field("Transaction Reference"; "Transaction Reference")
            {
                ApplicationArea = All;
            }
            field("Payment Details Link"; "Payment Details Link")
            {
                ApplicationArea = All;
            }
        }
        // modify(Description)
        // {
        //     Editable = false;
        // }
    }

    actions
    {
        addafter(Post)
        {
            action("Export Payment")
            {
                ApplicationArea = All;
                Image = Export;
                trigger OnAction()
                var
                    RestMgmt: Codeunit 1550;
                    GenJournalBatch: Record "Gen. Journal Batch";
                    RestrictedRecord: Record 1550;
                    RecRef: RecordRef;

                begin
                    /*
                      //Restrict before approval
                      IF GenJournalBatch.GET(Rec."Journal Template Name", Rec."Journal Batch Name") then begin
                          Clear(RestrictedRecord);
                          RecRef.GetTable(GenJournalBatch);
                          RestrictedRecord.SETRANGE("Record ID", RecRef.RecordId);
                          IF RestrictedRecord.FINDFIRST THEN begin
                              Error('Approval is required to export the Payment File.');
                          end;
                      end;
  */
                    Genjnlline.RESET;
                    Genjnlline.setrange("Journal Template Name", Rec."Journal Template Name");
                    Genjnlline.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    if Genjnlline.findset then;

                    PayExport.SetTableView(Genjnlline);
                    PayExport.run;
                end;
            }

        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        PayExport: xmlport 50118;
        Genjnlline: record "Gen. Journal Line";
}