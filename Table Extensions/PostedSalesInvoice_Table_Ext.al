tableextension 50145 "salesInvoiceHeader" extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "Bank Account No."; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(50002; "Correspondent Bank Account No."; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
    }

    var
        myInt: Integer;
}