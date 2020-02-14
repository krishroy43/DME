report 50106 "Posted Sales Invoice"
{
    UsageCategory = Administration;
    //ApplicationArea = All;
    DefaultLayout = RDLC;
    PreviewMode = PrintLayout;
    Caption = 'Posted Sales Invoice';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting ("No.");
            column(No_SalesInvoiceHeader; "No.")
            {

            }
            column(SelltoCustomerNo_SalesInvoiceHeader; "Sell-to Customer No.") { }
            column(CompanyInfoPicture; CompanyInfo.Picture) { }
            column(ComName; CompanyInfo.Name) { }
            column(CompAddress; CompanyInfo.Address) { }
            column(CompCity; CompanyInfo.City) { }
            column(CompanyInfo_Postcode; CompanyInfo."Post Code") { }
            column(CompCountry; CompanyInfo."Country/Region Code") { }
            column(CompPhone; CompanyInfo."Phone No.") { }
            column(CompEmail; CompanyInfo."E-Mail") { }
            column(TRN; CompanyInfo."VAT Registration No.") { }
            column(Fax; CompanyInfo."Fax No.") { }
            column(PhoneNo; CompanyInfo."Phone No.") { }
            column(Cust_Name; Customer_Rec.Name) { }
            column(Cust_Address; Customer_Rec.Address) { }
            column(Cust_Address2; Customer_Rec."Address 2") { }
            column(Cust_City; Customer_Rec.City) { }
            column(Cust_PostCode; Customer_Rec."Post Code") { }
            column(Cust_Contact; Customer_Rec.Contact) { }
            column(PostingDate_SalesInvoiceHeader; "Posting Date") { }
            column(BankAccNo; BankAccNo) { }
            column(BankName; BankName) { }
            column(SWIFTCode; SWIFTCode) { }
            column(IBAN; IBAN) { }
            column(CorrBankAccNo; CorrBankAccNo) { }
            column(CorrBankName; CorrBankName) { }
            column(CorrSwift; CorrSwift) { }
            column(BankBranchName; BankBranchName) { }
            column(LCYcode; GLSetup."LCY Code") { }
            column(CorrespondingAccNo; CorrespondingAccNo) { }

            column(Sell_to_Customer_No_; "Sell-to Customer No.") { }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD ("No.");
                column(SrNo; SrNo) { }
                column(Invoice_Status; "Invoice Status") { }
                column(Type_Name; "Type Name") { }
                column(Commodity_Code; "Commodity Code") { }
                column(Orig_Tran_Type_Name; "Orig Tran Type Name") { }
                column(Change_Code; "Change Code") { }
                column(Trade_Date; "Trade Date") { }
                column(Venue1; Venue) { }
                column(UnitPrice_SalesInvoiceLine; "Unit Price") { }
                column(Original_Quantity; "Original Quantity") { }
                column(Line_Amount; "Line Amount") { }
                column(InvoiceState; InvoiceState) { }
                column(TypeName; TypeName) { }
                column(Commoditycode; Commoditycode) { }
                column(Orig_Tran_Type_Name1; origin) { }
                column(Tradedate; Tradedate) { }
                column(changecode; changecode) { }
                column(Venue; Venue) { }
                column(Amount; Amount) { }

                trigger OnPreDataItem()
                begin
                    SrNo := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    if ("No." <> '') and ("Sales Invoice Line"."Invoice Status" <> 'EXPIRE') then
                        SrNo += 1;

                    if "Sales Invoice Line"."Invoice Status" <> '' then
                        InvoiceState := "Sales Invoice Line"."Invoice Status" + '-'
                    else
                        InvoiceState := "Sales Invoice Line"."Invoice Status";


                    if "Sales Invoice Line"."Type Name" <> '' then
                        TypeName := "Sales Invoice Line"."Type Name" + '-'
                    else
                        TypeName := "Sales Invoice Line"."Type Name";

                    if "Sales Invoice Line"."Commodity Code" <> '' then
                        Commoditycode := "Sales Invoice Line"."Commodity Code" + '-'
                    else
                        Commoditycode := "Sales Invoice Line"."Commodity Code";

                    if "Sales Invoice Line"."Orig Tran Type Name" <> '' then
                        origin := "Sales Invoice Line"."Orig Tran Type Name" + '-'
                    else
                        origin := "Sales Invoice Line"."Orig Tran Type Name";

                    if "Sales Invoice Line"."Change Code" <> '' then
                        changecode := "Sales Invoice Line"."Change Code" + '-'
                    else
                        changecode := "Sales Invoice Line"."Change Code";





                end;
            }
            trigger OnPreDataItem()
            begin
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(CompanyInfo.Picture);

                Clear(IBAN);
                Clear(SWIFTCode);
                Clear(BankAccNo);
                Clear(CorrespondingAccNo);
                Clear(BankName);
                Clear(CorrBankAccNo);
                Clear(CorrBankName);
                Clear(CorrSwift);
                Clear(BankBranchName);
                Clear(Amount);
                Clear(InvoiceState);
                Clear(TypeName);
                Clear(Commoditycode);
                Clear(origin);
                Clear(changecode);

            end;

            trigger OnAfterGetRecord()
            begin

                GLSetup.Get();


                Customer_Rec.RESET;
                IF Customer_Rec.GET("Sales Invoice Header"."Sell-to Customer No.") THEN;

                BankAccount_Rec.Reset();
                if BankAccount_Rec.Get("Bank Account No.") then begin
                    BankAccNo := BankAccount_Rec."Bank Account No.";
                    IBAN := BankAccount_Rec.IBAN;
                    BankName := BankAccount_Rec.Name;
                    SWIFTCode := BankAccount_Rec."SWIFT Code";
                    BankBranchName := BankAccount_Rec."Bank Branch Name";

                end;

                BankAccount_Rec.Reset();
                if BankAccount_Rec.Get("Correspondent Bank Account No.") then begin
                    CorrBankAccNo := BankAccount_Rec."Bank Account No.";
                    CorrSwift := BankAccount_Rec."SWIFT Code";
                    CorrBankName := BankAccount_Rec.Name;
                end;

                SalesInvoiceLine_Rec.Reset();
                SalesInvoiceLine_Rec.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                SalesInvoiceLine_Rec.SetFilter("Invoice Status", '<>%1', 'EXPIRE');
                if SalesInvoiceLine_Rec.FindFirst() then
                    Amount += SalesInvoiceLine_Rec."Line Amount";








            end;
        }
    }

    /*  requestpage
      {
          layout
          {
              area(Content)
              {
                  group(GroupName)
                  {
                      field(Name; SourceExpression)
                      {
                          ApplicationArea = All;

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
                      ApplicationArea = All;

                  }
              }
          }
      }*/

    var
        myInt: Integer;
        CompanyInfo: Record "Company Information";
        Customer_Rec: Record Customer;
        SrNo: Integer;
        BankAccount_Rec: Record "Bank Account";
        BankAccNo: Text[30];
        CorrBankAccNo: Text[30];
        CorrBankName: Text[50];
        CorrSwift: Code[20];
        IBAN: Code[30];
        BankName: Text[50];
        SWIFTCode: Code[20];
        CorrespondingAccNo: Text[30];
        BankBranchName: Text[50];
        Amount: Decimal;
        SalesInvoiceLine_Rec: Record "Sales Invoice Line";

        GLSetup: Record "General Ledger Setup";
        InvoiceState: Code[50];
        TypeName: Text[50];
        Commoditycode: Code[50];
        origin: code[50];
        changecode: code[8];
        Tradedate: Date;
        venue: Code[6];
        DescCode: Code[250];
        DescText: Text[50];

}