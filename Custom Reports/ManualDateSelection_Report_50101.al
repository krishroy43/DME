report 50101 MonthSelection
{
    UseRequestPage = true;
    ProcessingOnly = true;
    Caption = 'Select Month';

    dataset
    {
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {
                    field("Select Month :"; SelectedDate)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        var
            UploadCsv: XmlPort 50100;
        begin
            If CloseAction IN [ACTION::OK, ACTION::LookupOK] then begin
                IF SelectedDate <> 0D then begin
                    UploadCsv.setMonth(FORMAT(SelectedDate, 0, '<Month Text,3> <Year4>'), SelectedDate);
                    UploadCsv.ImportFile(true);
                    UploadCsv.Run();

                end else
                    Error('Select date.');
            end;
        end;
    }

    var
        SelectedDate: Date;
}