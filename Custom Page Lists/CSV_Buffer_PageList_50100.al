page 50100 "CSV Buffer List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CSV_Buffer;
    Caption = 'DME Data Import';
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                }
                field(Month; Month)
                {
                    ApplicationArea = All;
                }
                field("Fill Firm Id"; "Fill Firm Id")
                {
                    ApplicationArea = All;
                }
                field("Firm Name"; "Firm Name")
                {
                    ApplicationArea = All;
                }
                field("Main Account Number"; "Main Account Number")
                {
                    ApplicationArea = All;
                }
                field("Account Number"; "Account Number")
                {
                    ApplicationArea = All;
                }
                field("Process Date"; "Process Date")
                {
                    ApplicationArea = All;
                }
                field("Trade Date"; "Trade Date")
                {
                    ApplicationArea = All;
                }
                field("Product Exchange"; "Product Exchange")
                {
                    ApplicationArea = All;
                }
                field(Venue; Venue)
                {
                    ApplicationArea = All;
                }
                field("Tran Type Name"; "Tran Type Name")
                {
                    ApplicationArea = All;
                }
                field("Orig Tran Type Name"; "Orig Tran Type Name")
                {
                    ApplicationArea = All;
                }
                field("Change Code"; "Change Code")
                {
                    ApplicationArea = All;
                }
                field("Commodity Code"; "Commodity Code")
                {
                    ApplicationArea = All;
                }
                field("FUT Opt Ind"; "FUT Opt Ind")
                {
                    ApplicationArea = All;
                }
                field("Broker Code"; "Broker Code")
                {
                    ApplicationArea = All;
                }
                field("Broker Name"; "Broker Name")
                {
                    ApplicationArea = All;
                }
                field(Tag50; Tag50)
                {
                    ApplicationArea = All;
                }
                field("Contract YYYY MM"; "Contract YYYY MM")
                {
                    ApplicationArea = All;
                }
                field("Invoice Status"; "Invoice Status")
                {
                    ApplicationArea = All;
                }
                field("Type Name"; "Type Name")
                {
                    ApplicationArea = All;
                }
                field("Rate Type"; "Rate Type")
                {
                    ApplicationArea = All;
                }
                field(Rate; Rate)
                {
                    ApplicationArea = All;
                }
                field("Account Owner Title"; "Account Owner Title")
                {
                    ApplicationArea = All;
                }
                field("Account Owner 1"; "Account Owner 1")
                {
                    ApplicationArea = All;
                }
                field("Account Owner 2"; "Account Owner 2")
                {
                    ApplicationArea = All;
                }
                field("Account Owner 3"; "Account Owner 3")
                {
                    ApplicationArea = All;
                }
                field("fee Quantity"; "fee Quantity")
                {
                    ApplicationArea = All;
                }
                field("Applied fees"; "Applied fees")
                {
                    ApplicationArea = All;
                }
                field("Type of Member"; "Type of Member")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import CSV")
            {
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                begin
                    //                    Xmlport.Run(50100, false, true);
                    Report.RunModal(50101, true, false);
                end;
            }

            action("Process Data")
            {
                ApplicationArea = All;
                Image = Export;
                trigger OnAction()
                var
                    CSVBuffer: Record CSV_Buffer;
                begin
                    Clear(CSVBuffer);
                    CSVBuffer.SetFilter("Entry No.", '<>%1', 0);
                    if CSVBuffer.FindSet() then begin
                        If Confirm(Text001, FALSE) then Begin
                            Codeunit.Run(50100, CSVBuffer);
                            CurrPage.Update();
                            Message(Text002);
                        End;
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
        Text001: Label 'Are you sure you want to process the data for Invoicing?';
        Text002: Label 'All the rows proccessed successfully.';
}