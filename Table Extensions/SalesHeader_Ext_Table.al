tableextension 50118 "Sales Header" extends "Sales Header"
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
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                SalesSetup: Record "Sales & Receivables Setup";
            begin
                SalesSetup.Get();
                "Bank Account No." := SalesSetup."Bank Account No.";
                "Correspondent Bank Account No." := SalesSetup."Correspondent Bank Account No.";
            end;

        }
    }

    var
        myInt: Integer;
}