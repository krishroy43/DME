/*tableextension 50100 "Sales & Receivable Table Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Member No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(50002; "Non-Member No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }

    }

}*/