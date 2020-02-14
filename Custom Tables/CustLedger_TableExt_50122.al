tableextension 50122 CustTable extends "Cust. Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50001; Month; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup ("Sales Invoice Line".Month where("Document No." = field("Document No.")));
        }
    }

    var
        myInt: Integer;
}