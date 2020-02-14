codeunit 50100 "DME Functions"
{
    TableNo = CSV_Buffer;
    trigger OnRun()
    Var
        RecMISL: Record "MIS Table";
        RecSalesInvL: Record "Sales Invoice Creation";
    begin
        Clear(RecMIS);
        If Rec.FindSet() then
            repeat
                Clear(RecMISL);
                IF RecMISL.FindLast() then;
                RecMIS.Init();
                RecMIS.TransferFields(Rec);
                RecMIS."Entry No." := RecMISL."Entry No." + 1;
                RecMIS.Insert();
                if Rec."Invoice Status" <> 'EXPIRE' then begin
                    Clear(RecSalesInvL);
                    IF RecSalesInvL.FindLast() then;
                    RecSalesInvCreation.Init();
                    RecSalesInvCreation."Entry No." := RecSalesInvL."Entry No." + 1;
                    RecSalesInvCreation.TransferFields(Rec);
                    RecSalesInvCreation.Insert(true);
                end;
            until Rec.Next() = 0;
        Rec.DeleteAll();
    end;

    procedure "CreateParticipantAcc"()
    var
        ParticipiantAcc: Code[50];
    begin
        Clear(RecMIS);
        If RecMIS.FindSet() then
            repeat
                //modified as per discussion to have only 5 fields in DME participants
                Clear(RecDMEPart);
                Clear(ParticipiantAcc);
                //ParticipiantAcc := FORMAT(RecMIS."Fill Firm Id") + RecMIS."Account Number";
                // Adding a - as per new changes, Mentioned in email
                ParticipiantAcc := FORMAT(RecMIS."Fill Firm Id") + '-' + RecMIS."Account Number";
                RecDMEPart.SetRange("DME Participant Account", ParticipiantAcc);
                If not RecDMEPart.FindFirst() then begin
                    RecDMEPart.Init();
                    RecDMEPart."DME Participant Account" := ParticipiantAcc;
                    RecDMEPart.Insert();
                end;
                RecMIS."Participant Account" := FORMAT(RecMIS."Fill Firm Id") + '-' + RecMIS."Account Number";
                RecMIS.Modify();
            until RecMIS.Next() = 0;
        Clear(RecSalesInvCreation);
        RecSalesInvCreation.SetCurrentKey("Entry No.");
        RecSalesInvCreation.SetFilter("Entry No.", '<>%1', 0);
        if RecSalesInvCreation.FindSet() then begin
            repeat
                RecSalesInvCreation."Participant Account" := FORMAT(RecSalesInvCreation."Fill Firm Id") + '-' + RecSalesInvCreation."Account Number";
                RecSalesInvCreation.Modify();
            until RecSalesInvCreation.Next() = 0;
        end;
    end;

    procedure UpdateParticipantDetails()
    begin
        Clear(RecDMEPart);
        RecDMEPart.SetCurrentKey("DME Participant Account");
        RecDMEPart.SetFilter("DME Participant Account", '<>%1', '');
        If RecDMEPart.FindSet() then
            repeat
                Clear(RecMIS);
                RecMIS.SetRange("Participant Account", RecDMEPart."DME Participant Account");
                if RecMIS.FindSet() then begin
                    repeat
                        RecMIS."Customer Name" := RecDMEPart."Customer Name";
                        RecMIS."Customer Segment" := RecDMEPart."Customer Segment";
                        RecMIS."Domicile Region" := RecDMEPart."Domicile Region";
                        RecMIS."Domicile Country" := RecDMEPart."Domicile Country";
                        RecMIS."DME Vendor" := RecDMEPart."DME Vendor";
                        RecMIS.Modify();
                    until RecMIS.Next() = 0;
                end;
                Clear(RecSalesInvCreation);
                RecSalesInvCreation.SetRange("Participant Account", RecDMEPart."DME Participant Account");
                If RecSalesInvCreation.FindSet() then begin
                    repeat
                        RecSalesInvCreation."Customer Name" := RecDMEPart."Customer Name";
                        RecSalesInvCreation."Customer Segment" := RecDMEPart."Customer Segment";
                        RecSalesInvCreation."Domicile Region" := RecDMEPart."Domicile Region";
                        RecSalesInvCreation."Domicile Country" := RecDMEPart."Domicile Country";
                        RecSalesInvCreation.Modify();
                    until RecSalesInvCreation.Next() = 0;
                end;
            until RecDMEPart.Next() = 0;
    end;

    procedure SalesInvoiceCreation()
    var
        RecSalesInvCr: Record "Sales Invoice Creation";
        InvoiceCreation: Codeunit "Sales Invoice Creation";
        Text001: Label 'Are you sure you want to create the Sales Invoice?';
    begin
        Clear(RecSalesInvCr);
        RecSalesInvCr.SetRange("Invoice Created", false);
        If RecSalesInvCr.FindSet() then begin
            if Confirm(Text001, false) then begin
                repeat
                    ClearLastError();
                    If not (InvoiceCreation.Run(RecSalesInvCr)) then begin
                        RecSalesInvCr."Invoice Created" := false;
                        RecSalesInvCr.Error := CopyStr(GetLastErrorText(), 1, 250);
                        RecSalesInvCr.Modify();
                        Commit();//
                    end;
                until RecSalesInvCr.Next() = 0;
                Message('Sales Invoice Creation Process completed.');
            end;
        end else
            Error('There is no line to create invoice.');

    end;

    var
        RecMIS: Record "MIS Table";
        RecDMEPart: Record "DME Participants";
        RecSalesInvCreation: Record "Sales Invoice Creation";
}