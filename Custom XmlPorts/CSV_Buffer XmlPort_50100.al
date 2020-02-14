xmlport 50100 "CSV Buffer"
{
    Caption = 'CSV Import';
    Direction = Import;
    Format = VariableText;
    TextEncoding = UTF8;
    FieldSeparator = ',';
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(CSV; CSV_Buffer)
            {
                fieldattribute(FILL_FIRM_ID; CSV."Fill Firm Id")
                {
                }
                fieldattribute(FIRM_NAME; CSV."Firm Name")
                {

                }
                fieldattribute(MAIN_ACCOUNT_NUMBER; CSV."Main Account Number")
                {

                }
                fieldattribute(ACCOUNT_NUMBER; CSV."Account Number")
                {

                }
                fieldattribute(PROCESS_DATE; CSV."Process Date")
                {

                }
                fieldattribute(TRADE_DATE; CSV."Trade Date")
                {

                }
                fieldattribute(PRODUCT_EXCHANGE; CSV."Product Exchange")
                {

                }
                fieldattribute(VENUE; CSV.Venue)
                {

                }
                fieldattribute(TRAN_TYPE_NAME; CSV."Tran Type Name")
                {

                }
                fieldattribute(ORIG_TRAN_TYPE_NAME; CSV."Orig Tran Type Name")
                {

                }
                fieldattribute(CHANGE_CODE; csv."Change Code")
                {

                }
                fieldattribute(COMMODITY_CODE; CSV."Commodity Code")
                {

                }
                fieldattribute(FUT_OPT_IND; CSV."FUT Opt Ind")
                {

                }
                fieldattribute(BROKER_CODE; csv."Broker Code")
                {

                }
                fieldattribute(BROKER_NAME; csv."Broker Name")
                {

                }
                fieldattribute(TAG50; csv.TAG50)
                {

                }
                fieldattribute(CONTRACT_YYYY_MM; csv."Contract YYYY MM")
                {

                }
                fieldattribute(INVOICE_STATUS; csv."Invoice Status")
                {

                }
                fieldattribute(TYPE_NAME; csv."Type Name")
                {

                }
                fieldattribute(RATE_TYPE; csv."Rate Type")
                {

                }

                fieldattribute(RATE; csv.Rate)
                {

                }
                fieldattribute(ACCOUNT_OWNER_TITLE; csv."Account Owner Title")
                {

                }
                fieldattribute(ACCOUNT_OWNER_1; csv."Account Owner 1")
                {

                }
                fieldattribute(ACCOUNT_OWNER_2; csv."Account Owner 2")
                {

                }
                fieldattribute(ACCOUNT_OWNER_3; csv."Account Owner 3")
                {

                }
                fieldattribute(FEE_QUANTITY; csv."fee Quantity")
                {

                }
                fieldattribute(APPLIED_FEES; csv."Applied fees")
                {

                }
                trigger OnAfterInitRecord()
                begin
                    if Pagecaption = true then begin
                        Pagecaption := false;
                        RowNumber += 1;
                        currXMLport.Skip();
                    end;
                end;

                trigger OnBeforeInsertRecord()
                var
                    NoSeriesMgmt: Codeunit NoSeriesManagement;
                    SnR_Setup: Record "Account No. Setup";
                    Customer: Record Customer;
                begin
                    RowNumber += 1;
                    if CSV."Fill Firm Id" = 0 then
                        Error(Text001, CSV.FieldCaption("Fill Firm Id"), RowNumber)
                    else
                        if CSV."Tran Type Name" = '' then
                            Error(Text001, CSV.FieldCaption("Tran Type Name"), RowNumber)
                        else
                            if CSV."Orig Tran Type Name" = '' then
                                Error(Text001, CSV.FieldCaption("Orig Tran Type Name"), RowNumber)
                            else
                                if CSV."Change Code" = '' then
                                    Error(Text001, CSV.FieldCaption("Change Code"), RowNumber)
                                else
                                    if CSV."Commodity Code" = '' then
                                        Error(Text001, CSV.FieldCaption("Commodity Code"), RowNumber)
                                    else
                                        if CSV."Invoice Status" = '' then
                                            Error(Text001, CSV.FieldCaption("Invoice Status"), RowNumber)
                                        else
                                            if CSV."Type Name" = '' then
                                                Error(Text001, CSV.FieldCaption("Type Name"), RowNumber)
                                            else
                                                if CSV."Rate Type" = '' then
                                                    Error(Text001, CSV.FieldCaption("Rate Type"), RowNumber)
                                                else begin
                                                    if CSV."Account Number" = '' then begin
                                                        /* SnR_Setup.GET;
                                                         if CSV."Rate Type" = 'NON-MEMBER' then begin
                                                             if SnR_Setup."Non-Member No." = '' then
                                                                 Error(Text002, SnR_Setup.FieldCaption("Non-Member No."));
                                                             CSV."Account Number" := NoSeriesMgmt.GetNextNo(SnR_Setup."Non-Member No.", WorkDate(), true);
                                                         end else begin
                                                             if SnR_Setup."Member No." = '' then
                                                                 Error(Text002, SnR_Setup.FieldCaption("Member No."));
                                                             CSV."Account Number" := NoSeriesMgmt.GetNextNo(SnR_Setup."Member No.", WorkDate(), true);
                                                         end;*/
                                                        Clear(SnR_Setup);
                                                        if CSV."Rate Type" = 'NON-MEMBER' then begin
                                                            SnR_Setup.SetRange("Fill Firm Id", CSV."Fill Firm Id");
                                                            SnR_Setup.SetRange("Type Of Member", SnR_Setup."Type Of Member"::"NON-MEMBER");
                                                            if SnR_Setup.FindFirst() then
                                                                CSV."Account Number" := SnR_Setup.Code
                                                            else
                                                                Error(Text002 + 'Fill Firm Id: ' + FORMAT(CSV."Fill Firm Id") + ' & Type Of Member: NON-MEMBER');
                                                        end else begin
                                                            SnR_Setup.SetRange("Fill Firm Id", CSV."Fill Firm Id");
                                                            SnR_Setup.SetRange("Type Of Member", SnR_Setup."Type Of Member"::"MEMBER");
                                                            if SnR_Setup.FindFirst() then
                                                                CSV."Account Number" := SnR_Setup.Code
                                                            else
                                                                Error(Text002 + 'Fill Firm Id: ' + FORMAT(CSV."Fill Firm Id") + ' & Type Of Member: MEMBER');
                                                        end;
                                                    end;

                                                    if CSV."Rate Type" = 'NON-MEMBER' then
                                                        CSV."Type of Member" := CSV."Rate Type"
                                                    else
                                                        CSV."Type of Member" := 'MEMBER';

                                                    if CSV.Venue = '' then
                                                        CSV.Validate(Venue, 'NONTRD');

                                                    if csv."Firm Name" = '' then begin
                                                        Customer.Reset();
                                                        Customer.SetCurrentKey("No.");
                                                        if Customer.GET(CSV."Fill Firm Id") then
                                                            CSV."Firm Name" := Customer.Name;
                                                    end;
                                                    if SelectedMonth <> '' then
                                                        CSV.Month := SelectedMonth;
                                                    CSV.Date := SelectedDate;
                                                end;
                end;

            }

        }

    }
    trigger OnPreXmlPort()
    begin
        Pagecaption := true;
        RowNumber := 0;
    end;

    procedure setMonth(month: Code[20]; SelectedDateL: date)
    begin
        Clear(SelectedMonth);
        Clear(SelectedDate);
        SelectedMonth := month;
        SelectedDate := SelectedDateL;
    end;
    /*requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }*/
    var
        Pagecaption: Boolean;
        RowNumber: Integer;
        Text001: Label 'The Field %1 is blank at Row Number : %2';
        Text002: Label 'Account No. Setup not found for ';
        SelectedMonth: Code[20];
        SelectedDate: date;
}