tableextension 50108 GenGlnLine extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Add. Description"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Pay Mode"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = MC,OB,TT,TR;
            OptionCaption = 'MC,OB,TT,TR';
        }
        field(50002; "Charge Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Charge type";
        }
        field(50003; "Transaction Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Transaction Type";
        }
        field(50004; "Payment Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            Tablerelation = "Payment type";
        }
        field(50005; "Payment Details Link"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Transaction Reference"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}