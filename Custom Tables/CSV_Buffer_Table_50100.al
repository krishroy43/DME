// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

table 50100 "CSV_Buffer"
{
    DataClassification = ToBeClassified;

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
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(3; "Firm Name"; Text[35])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Main Account Number"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Account Number"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Process Date"; DATE)
        {
            DataClassification = ToBeClassified;
            //  NotBlank = true;
        }
        field(7; "Trade Date"; DATE)
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(8; "Product Exchange"; Code[5])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(9; Venue; code[6])
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
        field(10; "Tran Type Name"; code[15])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Transaction Type DME".Code;
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(11; "Orig Tran Type Name"; code[15])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Original Transaction Type Name".Code;
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(12; "Change Code"; code[8])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Change Code".Code;
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(13; "Commodity Code"; code[15])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commodity Code".Code;
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(14; "FUT Opt Ind"; code[5])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(15; "Broker Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(16; "Broker Name"; Text[20])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(17; Tag50; code[32])
        {
            DataClassification = ToBeClassified;
            //NotBlank = true;
        }
        field(18; "Contract YYYY MM"; Text[7])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(19; "Invoice Status"; Code[6])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Invoice Type".Code;
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(20; "Type Name"; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Type Name".Code;
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(21; "Rate Type"; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rate Type".Code;
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(22; Rate; Decimal)
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(23; "Account Owner Title"; Text[40])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(24; "Account Owner 1"; text[60])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(25; "Account Owner 2"; Text[60])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(26; "Account Owner 3"; Text[60])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(27; "fee Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(28; "Applied fees"; Decimal)
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(29; "Type of Member"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(42; Month; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(43; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        Customer: Record Customer;

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