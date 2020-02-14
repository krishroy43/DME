tableextension 50107 PurchCrMemo extends "Purch. Cr. Memo Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Add. Description"; Text[150])
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        myInt: Integer;
}