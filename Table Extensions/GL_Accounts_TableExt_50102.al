/*tableextension 50102 GLAccountTableExt extends "G/L Account"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Type Name"; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Type Name".Code;
            ValidateTableRelation = true;
        }
        field(50002; "Commodity Code"; code[15])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commodity Code".Code;
            ValidateTableRelation = true;
        }
        field(50003; Venue; code[6])
        {
            DataClassification = ToBeClassified;
            TableRelation = Venue.Code;
            ValidateTableRelation = true;
            trigger OnValidate()
            begin
                if Venue = '' then
                    Venue := 'NONTRD';
            end;
        }
        field(50004; "Rate Type"; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rate Type".Code;
            ValidateTableRelation = true;
        }
    }

    var
        myInt: Integer;
}*/