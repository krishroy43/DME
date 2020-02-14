tableextension 50119 VendBankAcc extends "Vendor Bank Account"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "BIC Code for Bene Bank"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Route Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50002; "Sort Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "BIC_SWIFT Intermediary Bank 1"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}