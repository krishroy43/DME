codeunit 50103 "DME Events"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeDeleteAfterPosting', '', false, false)]
    procedure DeleteSalesInvCreation(VAR SalesHeader: Record "Sales Header"; VAR SalesInvoiceHeader: Record "Sales Invoice Header"; VAR SalesCrMemoHeader: Record "Sales Cr.Memo Header"; VAR SkipDelete: Boolean)
    var
        SalesInvCreation: Record "Sales Invoice Creation";
        FillFirmLocal: Integer;
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice Then begin
            Clear(SalesInvCreation);
            Clear(FillFirmLocal);
            if Evaluate(FillFirmLocal, SalesHeader."Sell-to Customer No.") then Begin
                SalesInvCreation.SetRange("Fill Firm Id", FillFirmLocal);
                SalesInvCreation.SetRange("Invoice Created", true);
                if SalesInvCreation.FindSet() then begin
                    SalesInvCreation.DeleteAll();
                end;
            End;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeDeleteEvent', '', false, false)]
    procedure EnableSalesInvCreation(var Rec: Record "Sales Header")
    var
        salesInvCr: Record "Sales Invoice Creation";
        FillFirmLocal: Integer;
    begin
        if Rec."Document Type" = Rec."Document Type"::Invoice Then begin
            Clear(salesInvCr);
            if Evaluate(FillFirmLocal, Rec."Sell-to Customer No.") then Begin
                salesInvCr.SetRange("Fill Firm Id", FillFirmLocal);
                salesInvCr.SetRange("Invoice Created", true);
                if salesInvCr.FindSet() then
                    repeat
                        salesInvCr."Invoice Created" := false;
                        salesInvCr."Invoice No." := '';
                        salesInvCr.Modify();
                    until salesInvCr.Next() = 0;
            end;
        end;

    end;

    var
        myInt: Integer;
}