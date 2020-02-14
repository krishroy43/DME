tableextension 50104 PurchInvLineExt extends "Purch. Inv. Line"
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