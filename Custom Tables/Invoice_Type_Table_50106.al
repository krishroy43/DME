table 50106 "Invoice Type"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Invoice Type";
    DrillDownPageId = "Invoice Type";
    DataCaptionFields = Code, Description;
    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }


    keys
    {
        key(PK; code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}