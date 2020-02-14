xmlport 50118 "Payment Export"
{
    Caption = 'Payment Export';
    Direction = Export;
    Format = VariableText;
    TextEncoding = UTF8;
    FieldSeparator = ',';
    FieldDelimiter = '';
    UseRequestPage = False;

    schema
    {
        textelement(Root)
        {
            tableelement(Int; Integer)
            {
                SourceTableView = SORTING(Number) WHERE(Number = CONST(1));

                textattribute(Pay_Mode)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Pay_Mode := 'Pay Mode';
                    end;
                }
                textattribute(Beneficiary_Bank)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Beneficiary_Bank := 'Beneficiary Bank';
                    end;
                }
                textattribute(Beneficiary_Name)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Beneficiary_Name := 'Beneficiary Name';
                    end;
                }
                textattribute(Pay_Amount)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Pay_Amount := 'Pay Amount';
                    end;
                }
                textattribute(Pay_Currency)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Pay_Currency := 'Pay Currency';
                    end;
                }
                textattribute(Beneficary_Account_Number)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Beneficary_Account_Number := 'Beneficiary Account Number';
                    end;
                }
                textattribute(Beneficiary_Email)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Beneficiary_Email := 'Beneficiary Email';
                    end;
                }
                textattribute(Payment_Details_Beneficiary)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Payment_Details_Beneficiary := 'Payment Details Beneficiary';
                    end;
                }
                textattribute(Payable_Country)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Payable_Country := 'Payable Country';
                    end;
                }
                textattribute(BICCode_BeneBank)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        BICCode_BeneBank := 'BIC Code for Beneficiary Bank';
                    end;
                }
                textattribute(Route_Code)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Route_Code := 'Route Code';
                    end;
                }
                textattribute(Sort_Code)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Sort_Code := 'Sort Code';
                    end;
                }
                textattribute(BICSWIFT_IntermediaryBank)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        BICSWIFT_IntermediaryBank := 'BIC SWIFT Intermediary Bank';
                    end;
                }
                textattribute(Charge_type)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Charge_type := 'Charge Type';
                    end;
                }
                textattribute(Transaction_type)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Transaction_type := 'Transaction type';
                    end;
                }
                textattribute(Payment_type)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Payment_type := 'Payment type';
                    end;
                }
                textattribute(PaymentDetailsLink)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        PaymentDetailsLink := 'Payment Details Link';
                    end;
                }
                textattribute(Transaction_Reference)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Transaction_Reference := 'Transaction Reference';
                    end;
                }
                textattribute(Account_debitdate)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Account_debitdate := 'Account debit date';
                    end;
                }
                textattribute(Beneficiary_Country)
                {
                    trigger OnBeforePassVariable()
                    var
                        myInt: Integer;
                    begin
                        Beneficiary_Country := 'Beneficiary Country';
                    end;
                }

            }
            tableelement(Genjnlline; "Gen. Journal Line")
            {
                SourceTableView = SORTING("Journal Template Name", "Journal Batch Name", "Line No.") ORDER(Ascending);
                fieldattribute(PayCode; Genjnlline."Pay Mode")
                {

                }
                textattribute(BenCode)
                {

                }
                textattribute(Benename)
                {

                }
                fieldattribute(Pay_Amount; Genjnlline.Amount)
                {

                }
                fieldattribute(Pay_currency; Genjnlline."Currency Code")
                {

                }
                textattribute(BeneAccnum)
                {

                }
                textattribute(BeneAddr)
                {

                }
                textattribute(BeneEmail)
                {

                }
                fieldattribute(Payment_Details; Genjnlline."Message to Recipient")
                {

                }
                fieldattribute(Payable_country; Genjnlline."Country/Region Code")
                {

                }
                textattribute(BICCode)
                {

                }
                textattribute(RouteCode)
                {

                }
                textattribute(SortCode)
                {

                }
                textattribute(BICSwift)
                {

                }
                fieldattribute(Charge_Type; Genjnlline."Charge Type")
                {

                }
                fieldattribute(Transaction_Type; Genjnlline."Transaction Type")
                {

                }
                fieldattribute(Payment_Type; Genjnlline."Payment Type")
                {

                }
                fieldattribute(Payment_DetailsLink; Genjnlline."Payment Details Link")
                {

                }
                fieldattribute(Transaction_Ref; Genjnlline."Transaction Reference")
                {

                }
                fieldattribute(Debit_Date; Genjnlline."Posting Date")
                {

                }
                textattribute(Benecountry)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    //Genjnlline.TestField("Pay Mode");
                    Genjnlline.TESTFIELD(Amount);
                    Genjnlline.TestField("Currency Code");
                    Genjnlline.TestField("Transaction Type");

                    RecVendBankAccount.reset;
                    RecVendBankAccount.SetRange("Vendor No.", Genjnlline."Account No.");
                    if RecVendBankAccount.findfirst then begin


                        RecVendBankAccount.TestField(Code);
                        RecVendBankAccount.TESTFIELD(Name);
                        RecVendBankAccount.TestField("Bank Account No.");
                        BenCode := RecVendBankAccount.Code;
                        Benename := RecVendBankAccount.Name;
                        BeneAccnum := RecVendBankAccount."Bank Account No.";
                        BICCode := RecVendBankAccount."BIC Code for Bene Bank";
                        BICSWIFT := RecVendBankAccount."BIC_SWIFT Intermediary Bank 1";
                        Routecode := RecVendBankAccount."Route Code";
                        SortCode := RecVendBankAccount."Sort Code";
                    end;

                    RecVendor.reset;
                    if RecVendor.GET(Genjnlline."Account No.") then begin
                        RecVendor.TestField(Address);
                        RecVendor.TestField("Country/Region Code");
                        BeneAddr := RecVendor.Address + ' ' + RecVendor."Address 2";
                        BeneEmail := RecVendor."E-Mail";
                        Benecountry := RecVendor."Country/Region Code";
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

    var
        Pagecaption: Boolean;
        RowNumber: Integer;
        Text001: Label 'The Field %1 is blank at Row Number : %2';
        Text002: Label 'Account No. Setup not found for ';
        SelectedMonth: Code[20];
        RecVendBankAccount: Record "Vendor Bank Account";
        RecVendor: record Vendor;
}