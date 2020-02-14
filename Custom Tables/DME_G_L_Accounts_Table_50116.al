table 50116 "DME G/L Accounts"
{
    DataClassification = ToBeClassified;
    LookupPageId = "DME G/L Accounts";
    DrillDownPageId = "DME G/L Accounts";
    fields
    {
        field(1; "TYPE NAME"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Type Name".Code;
        }
        field(2; "COMMODITY CODE"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commodity Code".Code;
        }
        field(3; VENUE; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Venue.Code;
        }
        field(4; "RATE TYPE"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rate Type".Code;
        }
        field(5; "G/L Account Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No." where ("Direct Posting" = const (true), "Account Type" = const (Posting), Blocked = const (false));
            ValidateTableRelation = true;
            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
            begin
                Clear(GLAccount);
                GLAccount.SetCurrentKey("No.");
                If GLAccount.GET("G/L Account Number") then
                    "G/L Account Name" := GLAccount.Name;
            end;
        }
        field(6; "G/L Account Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "TYPE NAME", "COMMODITY CODE", VENUE, "RATE TYPE")
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