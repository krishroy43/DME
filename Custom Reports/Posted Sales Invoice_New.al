report 50107 "Posted Sales Invoice_New"
{
    UsageCategory = Administration;
    DefaultLayout = RDLC;
    PreviewMode = PrintLayout;
    Caption = 'Posted Sales Invoice_New';
    RDLCLayout = 'Custom Reports\R_50107_Posted Sales Invoice Report_New.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("No.");
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
                DataItemLink = "Document No." = FIELD("No.");
                column(SrNo; SrNo) { }
                column(Invoice_Status; "Invoice Status") { }
                column(Description; Description) { }
                column(No_; "No.") { }
                column(Type_Name; "Type Name") { }
                column(Commodity_Code; "Commodity Code") { }
                column(Orig_Tran_Type_Name; "Orig Tran Type Name") { }
                column(Change_Code; "Change Code") { }
                column(Trade_Date; "Trade Date") { }
                column(Venue; Venue) { }
                column(UnitPrice_SalesInvoiceLine; "Unit Price") { }
                column(Original_Quantity; "Original Quantity") { }
                column(Line_Amount; "Line Amount") { }
                column(Amount; Amount) { }

                trigger OnPreDataItem()
                begin
                    SrNo := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    if ("No." <> '') then
                        SrNo += 1;
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

            end;

            trigger OnAfterGetRecord()
            begin

                GLSetup.Get();
                GLSetup.TestField("Bank Account No.");
                GLSetup.TestField("Correspondent Bank Account No.");
                Customer_Rec.RESET;
                IF Customer_Rec.GET("Sales Invoice Header"."Sell-to Customer No.") THEN;
                BankAccount_Rec.Reset();
                if BankAccount_Rec.Get(GLSetup."Bank Account No.") then begin
                    BankAccNo := BankAccount_Rec."Bank Account No.";
                    IBAN := BankAccount_Rec.IBAN;
                    BankName := BankAccount_Rec.Name;
                    SWIFTCode := BankAccount_Rec."SWIFT Code";
                    BankBranchName := BankAccount_Rec."Bank Branch Name";
                end;

                BankAccount_Rec.Reset();
                if BankAccount_Rec.Get(GLSetup."Correspondent Bank Account No.") then begin
                    CorrBankAccNo := BankAccount_Rec."Bank Account No.";
                    CorrSwift := BankAccount_Rec."SWIFT Code";
                    CorrBankName := BankAccount_Rec.Name;
                end;
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

}