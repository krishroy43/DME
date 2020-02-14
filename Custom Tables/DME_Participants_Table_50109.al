table 50109 "DME Participants"
{
    DataClassification = ToBeClassified;
    LookupPageId = "DME Participants";
    DrillDownPageId = "DME Participants";
    DataCaptionFields = "DME Participant Account", "Member Category", "Domicile Country", "Domicile Region";
    fields
    {
        field(1; "DME Participant Account"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Member Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Member Category".Code;
        }
        field(4; "Domicile Region"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domicile Region".Code;
        }
        field(5; "Domicile Country"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domicile Country".Code;
        }
        field(6; "Customer Segment"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Segment".Code;
        }
        field(7; "DME Vendor"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }

    }

    keys
    {

        key(PK; "DME Participant Account")
        {
            Clustered = true;
        }

        /*  key(PK2; "Entry No.", "DME Participant Account")
          {
              Clustered = true;
          }*/
    }
    fieldgroups
    {
        fieldgroup(DropDown; "DME Participant Account", "Member Category", "Domicile Country", "Domicile Region")
        {

        }/*
         fieldgroup(LookUp; "DME Participant Account", "Member Category", "Domicile Country", "Domicile Region")
         {

         }*/


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