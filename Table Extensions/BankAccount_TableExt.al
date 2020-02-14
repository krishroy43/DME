tableextension 50121 "Bank Account" extends "Bank Account"
{
    fields
    {
        field(50000; "Bank Branch Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }




    }

    var
        myInt: Integer;
}