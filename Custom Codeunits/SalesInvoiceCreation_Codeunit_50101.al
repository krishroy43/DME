codeunit 50101 "Sales Invoice Creation"
{
    TableNo = "Sales Invoice Creation";
    trigger OnRun()
    var
        SnPSetup: Record "Sales & Receivables Setup";
    begin
        SalesHeader.Reset();
        SnPSetup.GET;
        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader.Validate("No.", NoSeriesMgmt.GetNextNo(SnPSetup."Invoice Nos.", WorkDate(), true));
        SalesHeader.Validate("Sell-to Customer No.", FORMAT(Rec."Fill Firm Id"));
        SalesHeader.Insert(true);
        //Sales Line
        Clear(SalesInvCreation);
        SalesInvCreation.SetRange("Fill Firm Id", Rec."Fill Firm Id");
        SalesInvCreation.SetRange("Invoice Created", false);
        if SalesInvCreation.FindSet() then
            repeat
                SalesLine.Reset();
                SalesLine.Init();
                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine."Line No." += 10000;
                SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
                Clear(RecGL_Ac);
                RecGL_Ac.SetRange("Type Name", SalesInvCreation."Type Name");
                RecGL_Ac.SetRange("Commodity Code", SalesInvCreation."Commodity Code");
                RecGL_Ac.SetRange(Venue, SalesInvCreation.Venue);
                RecGL_Ac.SetRange("Rate Type", SalesInvCreation."Rate Type");
                /* RecGL_Ac.SetRange("Direct Posting", true);
                 RecGL_Ac.SetRange("Account Type", RecGL_Ac."Account Type"::Posting);
                 RecGL_Ac.SetRange(Blocked, false);*/
                If RecGL_Ac.FindFirst() then begin
                    if RecGL_Ac."G/L Account Number" <> '' then
                        SalesLine.Validate("No.", RecGL_Ac."G/L Account Number")
                    else
                        Error(ErrorGL + '\' + SalesInvCreation.FieldCaption("Type Name") + ' : ' + SalesInvCreation."Type Name" + ',' + SalesInvCreation.FieldCaption("Commodity Code") + ' : ' + SalesInvCreation."Commodity Code" + ',' +
                        SalesInvCreation.FieldCaption(Venue) + ' : ' + SalesInvCreation.Venue + ',' + SalesInvCreation.FieldCaption("Rate Type") + ' : ' + SalesInvCreation."Rate Type");
                end else
                    Error(ErrorGL + '\' + SalesInvCreation.FieldCaption("Type Name") + ' : ' + SalesInvCreation."Type Name" + ',' + SalesInvCreation.FieldCaption("Commodity Code") + ' : ' + SalesInvCreation."Commodity Code" + ',' +
                    SalesInvCreation.FieldCaption(Venue) + ' : ' + SalesInvCreation.Venue + ',' + SalesInvCreation.FieldCaption("Rate Type") + ' : ' + SalesInvCreation."Rate Type");
                SalesLine.validate(Quantity, SalesInvCreation."Quantity To Invoice");//."fee Quantity");
                SalesLine.Validate("Unit Price", SalesInvCreation.Rate);
                SalesLine.Validate(Amount, SalesInvCreation."Applied fees");// Added later to take it as it is.
                SalesLine."Original Quantity" := SalesInvCreation."fee Quantity";
                SalesLine."Main Account Number" := SalesInvCreation."Main Account Number";
                SalesLine."Account Number" := SalesInvCreation."Account Number";
                SalesLine."Process Date" := SalesInvCreation."Process Date";
                SalesLine."Trade Date" := SalesInvCreation."Trade Date";
                SalesLine.Venue := SalesInvCreation.Venue;
                SalesLine."Tran Type Name" := SalesInvCreation."Tran Type Name";
                SalesLine."Orig Tran Type Name" := SalesInvCreation."Orig Tran Type Name";
                SalesLine."Change Code" := SalesInvCreation."Change Code";
                SalesLine."Broker Code" := SalesInvCreation."Broker Code";
                SalesLine."Broker Name" := SalesInvCreation."Broker Name";
                SalesLine.Tag50 := SalesInvCreation.Tag50;
                SalesLine."Contract YYYY MM" := SalesInvCreation."Contract YYYY MM";
                SalesLine."Invoice Status" := SalesInvCreation."Invoice Status";
                SalesLine."Type Name" := SalesInvCreation."Type Name";
                SalesLine."Rate Type" := SalesInvCreation."Rate Type";
                SalesLine."Account Owner Title" := SalesInvCreation."Account Owner Title";
                SalesLine."Type of Member" := SalesInvCreation."Type of Member";
                SalesLine."Commodity Code" := SalesInvCreation."Commodity Code";
                SalesLine.Month := SalesInvCreation.Month;
                SalesLine."Participant Account" := SalesInvCreation."Participant Account";
                SalesInvCreation."Invoice Created" := true;
                SalesInvCreation."Invoice No." := SalesHeader."No.";
                SalesInvCreation.Error := '';
                SalesInvCreation.Modify();
                /*
                 Error(ErrorGL + '\' + SalesInvCreation.FieldCaption("Type Name") + ' : ' + SalesInvCreation."Type Name" + '\' + SalesInvCreation.FieldCaption("Commodity Code") + ' : ' + SalesInvCreation."Commodity Code" + '\' +
                 SalesInvCreation.FieldCaption(Venue) + ' : ' + SalesInvCreation.Venue + '\' + SalesInvCreation.FieldCaption("Rate Type") + ' : ' + SalesInvCreation."Rate Type");
                */
                SalesLine.Insert(true);
            until SalesInvCreation.Next() = 0;
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        RecGL_Ac: Record "DME G/L Accounts";
        SalesInvCreation: Record "Sales Invoice Creation";
        ErrorGL: Label 'There is no G/L Account for :';
        NoSeriesMgmt: codeunit NoSeriesManagement;
}