report 50100 UpdateMemberCategory
{
    // UsageCategory = ReportsAndAnalysis;
    //ApplicationArea = All;
    UseRequestPage = true;
    ProcessingOnly = true;
    Caption = 'Update Member Category';

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
                    field("From Date :"; FromDate)
                    {
                        ApplicationArea = All;
                    }
                    field("To Date :"; Todate)
                    {
                        ApplicationArea = All;
                    }
                    field(ParticipantNo; ParticipantNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Participant No. :';
                        TableRelation = "DME Participants"."DME Participant Account";                   //  

                    }
                }

            }

        }

        actions
        {
            /*  area(processing)
              {
                  action(ActionName)
                  {
                      ApplicationArea = All;

                  }
              }*/
        }
        trigger OnQueryClosePage(CloseAction: Action): Boolean
        var
            Text001: Label 'Are you sure you want to update the Member Category?';
            RecDMEPartc: Record "DME Participants";
            RecMisTable: Record "MIS Table";
            SalesInvCr: Record "Sales Invoice Creation";
        begin
            If CloseAction IN [ACTION::OK, ACTION::LookupOK] then begin

                if (FromDate = 0D) AND (Todate = 0D) AND (ParticipantNo = '') then begin
                    if Confirm(Text001, FALSE) then begin
                        Clear(RecMisTable);
                        RecMisTable.SetFilter("Participant Account", '<>%1', '');
                        if RecMisTable.FindSet() then begin
                            repeat
                                Clear(RecDMEPartc);
                                RecDMEPartc.SetRange("DME Participant Account", RecMisTable."Participant Account");
                                if RecDMEPartc.FindFirst() then begin
                                    RecMisTable."Member Category" := RecDMEPartc."Member Category";
                                    RecMisTable.Modify();
                                end;
                            until RecMisTable.Next() = 0;
                        end;
                        Clear(SalesInvCr);
                        SalesInvCr.SetFilter("Participant Account", '<>%1', '');
                        if SalesInvCr.FindSet() then begin
                            repeat
                                Clear(RecDMEPartc);
                                RecDMEPartc.SetRange("DME Participant Account", SalesInvCr."Participant Account");
                                if RecDMEPartc.FindFirst() then begin
                                    SalesInvCr."Member Category" := RecDMEPartc."Member Category";
                                    SalesInvCr.Modify();
                                end;
                            until SalesInvCr.Next() = 0;
                        end;
                    end;
                end else
                    if (FromDate = 0D) AND (Todate = 0D) AND (ParticipantNo <> '') then begin
                        if Confirm(Text001, FALSE) then begin
                            Clear(RecMisTable);
                            RecMisTable.SetFilter("Participant Account", '=%1', ParticipantNo);
                            if RecMisTable.FindSet() then begin
                                repeat
                                    Clear(RecDMEPartc);
                                    RecDMEPartc.SetRange("DME Participant Account", RecMisTable."Participant Account");
                                    if RecDMEPartc.FindFirst() then begin
                                        RecMisTable."Member Category" := RecDMEPartc."Member Category";
                                        RecMisTable.Modify();
                                    end;
                                until RecMisTable.Next() = 0;
                            end;
                            Clear(SalesInvCr);
                            SalesInvCr.SetFilter("Participant Account", '=%1', ParticipantNo);
                            if SalesInvCr.FindSet() then begin
                                repeat
                                    Clear(RecDMEPartc);
                                    RecDMEPartc.SetRange("DME Participant Account", SalesInvCr."Participant Account");
                                    if RecDMEPartc.FindFirst() then begin
                                        SalesInvCr."Member Category" := RecDMEPartc."Member Category";
                                        SalesInvCr.Modify();
                                    end;
                                until SalesInvCr.Next() = 0;
                            end;
                        end;
                    end else
                        if (FromDate <> 0D) AND (Todate <> 0D) AND (ParticipantNo = '') then begin
                            if FromDate > Todate then
                                Error('From Date should be less than To Date.')
                            else begin
                                if Confirm(Text001, FALSE) then begin
                                    Clear(RecMisTable);
                                    RecMisTable.SetFilter("Process Date", '>=%1', FromDate);
                                    RecMisTable.SetFilter("Process Date", '<=%1', Todate);
                                    if RecMisTable.FindSet() then begin
                                        repeat
                                            Clear(RecDMEPartc);
                                            RecDMEPartc.SetRange("DME Participant Account", RecMisTable."Participant Account");
                                            if RecDMEPartc.FindFirst() then begin
                                                RecMisTable."Member Category" := RecDMEPartc."Member Category";
                                                RecMisTable.Modify();
                                            end;
                                        until RecMisTable.Next() = 0;
                                    end;
                                    Clear(SalesInvCr);
                                    SalesInvCr.SetFilter("Process Date", '>=%1', FromDate);
                                    SalesInvCr.SetFilter("Process Date", '<=%1', Todate);
                                    if SalesInvCr.FindSet() then begin
                                        repeat
                                            Clear(RecDMEPartc);
                                            RecDMEPartc.SetRange("DME Participant Account", SalesInvCr."Participant Account");
                                            if RecDMEPartc.FindFirst() then begin
                                                SalesInvCr."Member Category" := RecDMEPartc."Member Category";
                                                SalesInvCr.Modify();
                                            end;
                                        until SalesInvCr.Next() = 0;
                                    end;
                                end;
                            end;
                        end else
                            if (FromDate <> 0D) AND (Todate <> 0D) AND (ParticipantNo <> '') then begin
                                if FromDate > Todate then
                                    Error('From Date should be less than To Date.')
                                else begin
                                    if Confirm(Text001, FALSE) then begin
                                        Clear(RecMisTable);
                                        RecMisTable.SetFilter("Process Date", '>=%1', FromDate);
                                        RecMisTable.SetFilter("Process Date", '<=%1', Todate);
                                        RecMisTable.SetFilter("Participant Account", '=%1', ParticipantNo);
                                        if RecMisTable.FindSet() then begin
                                            repeat
                                                Clear(RecDMEPartc);
                                                RecDMEPartc.SetRange("DME Participant Account", RecMisTable."Participant Account");
                                                if RecDMEPartc.FindFirst() then begin
                                                    RecMisTable."Member Category" := RecDMEPartc."Member Category";
                                                    RecMisTable.Modify();
                                                end;
                                            until RecMisTable.Next() = 0;
                                        end;
                                        Clear(SalesInvCr);
                                        SalesInvCr.SetFilter("Process Date", '>=%1', FromDate);
                                        SalesInvCr.SetFilter("Process Date", '<=%1', Todate);
                                        SalesInvCr.SetFilter("Participant Account", '=%1', ParticipantNo);
                                        if SalesInvCr.FindSet() then begin
                                            repeat
                                                Clear(RecDMEPartc);
                                                RecDMEPartc.SetRange("DME Participant Account", SalesInvCr."Participant Account");
                                                if RecDMEPartc.FindFirst() then begin
                                                    SalesInvCr."Member Category" := RecDMEPartc."Member Category";
                                                    SalesInvCr.Modify();
                                                end;
                                            until SalesInvCr.Next() = 0;
                                        end;
                                        Message('Member Category updated successfully.');
                                    end;
                                end;
                            end;


            end;

        end;
    }

    var
        FromDate: Date;
        Todate: Date;
        ParticipantNo: Code[50];

}