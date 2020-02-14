tableextension 50123 VATEntry extends "VAT Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Vendor Invoice No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup ("Purch. Inv. Header"."Vendor Invoice No." where("No." = field("Document No.")));
        }
    }

    var
        myInt: Integer;
}