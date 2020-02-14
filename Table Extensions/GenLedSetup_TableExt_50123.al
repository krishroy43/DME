tableextension 50109 MyExtension extends "General Ledger Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Bank Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(50001; "Correspondent Bank Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
    }

    var
        myInt: Integer;
}