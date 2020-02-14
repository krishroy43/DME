tableextension 50101 SalesLineTableExt extends "Sales Line"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Main Account Number"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Account Number"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Process Date"; DATE)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Trade Date"; DATE)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; Venue; code[6])
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
        field(50006; "Tran Type Name"; code[15])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Transaction Type DME".Code;
            ValidateTableRelation = true;
        }
        field(50007; "Orig Tran Type Name"; code[15])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Original Transaction Type Name".Code;
            ValidateTableRelation = true;
        }
        field(50008; "Change Code"; code[8])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Change Code".Code;
            ValidateTableRelation = true;
        }
        field(50009; "Commodity Code"; code[15])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commodity Code".Code;
            ValidateTableRelation = true;
        }
        field(50010; "Broker Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Broker Name"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; Tag50; code[32])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Contract YYYY MM"; Text[7])
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Invoice Status"; Code[6])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Invoice Type".Code;
            ValidateTableRelation = true;
        }
        field(50015; "Type Name"; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Type Name".Code;
            ValidateTableRelation = true;
        }
        field(50016; "Rate Type"; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rate Type".Code;
            ValidateTableRelation = true;
        }
        field(50017; "Account Owner Title"; Text[40])
        {
            DataClassification = ToBeClassified;
        }

        field(50018; "Type of Member"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Participant Account"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Original Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Add. Description"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(50022; Month; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}