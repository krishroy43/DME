table 50117 "Account No. Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Account No. Setup';
    LookupPageId = "Account No. Setup";
    DrillDownPageId = "Account No. Setup";
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Fill Firm Id"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(3; "Type Of Member"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,MEMBER,"NON-MEMBER";
        }
        field(4; Code; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK1; "Entry No.")
        {
            Clustered = true;
        }
        key(PK2; "Fill Firm Id", "Type Of Member")
        {

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