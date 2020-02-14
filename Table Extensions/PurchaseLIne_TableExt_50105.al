tableextension 50105 PurchaseLineExt extends "Purchase Line"
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