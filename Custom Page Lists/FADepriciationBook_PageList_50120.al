page 50120 "FA Dep Book"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "FA Depreciation Book";
    Caption = 'FA Dep Book';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("FA No."; "FA No.")
                {
                    ApplicationArea = All;
                }
                field("Depreciation Book Code"; "Depreciation Book Code")
                {
                    ApplicationArea = All;
                }
                field("Depreciation Method"; "Depreciation Method")
                {
                    ApplicationArea = All;
                }
                field("Depreciation Starting Date"; "Depreciation Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Straight-Line %"; "Straight-Line %")
                {
                    ApplicationArea = All;
                }
                field("No. of Depreciation Years"; "No. of Depreciation Years")
                {
                    ApplicationArea = All;
                }
                field("No. of Depreciation Months"; "No. of Depreciation Months")
                {
                    ApplicationArea = All;
                }
                field("Fixed Depr. Amount"; "Fixed Depr. Amount")
                {
                    ApplicationArea = All;
                }
                field("Declining-Balance %"; "Declining-Balance %")
                {
                    ApplicationArea = All;
                }
                field("Depreciation Table Code"; "Depreciation Table Code")
                {
                    ApplicationArea = All;
                }
                field("Final Rounding Amount"; "Final Rounding Amount")
                {
                    ApplicationArea = all;
                }
                field("Ending Book Value"; "Ending Book Value")
                {
                    ApplicationArea = All;
                }
                field("FA Posting Group"; "FA Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Depreciation Ending Date"; "Depreciation Ending Date")
                {
                    ApplicationArea = All;
                }
                field("Acquisition Cost"; "Acquisition Cost")
                {
                    ApplicationArea = All;
                }
                field(Depreciation; Depreciation)
                {
                    ApplicationArea = All;
                }
                field("Book Value"; "Book Value")
                {
                    ApplicationArea = All;
                }
                field("Proceeds on Disposal"; "Proceeds on Disposal")
                {
                    ApplicationArea = All;
                }
                field("Gain/Loss"; "Gain/Loss")
                {
                    ApplicationArea = All;
                }
                field("Write-Down"; "Write-Down")
                {
                    ApplicationArea = All;
                }
                field(Appreciation; Appreciation)
                {
                    ApplicationArea = All;
                }
                field("Custom 1"; "Custom 1")
                {
                    ApplicationArea = all;
                }
                field("Custom 2"; "Custom 2")
                {
                    ApplicationArea = All;
                }
                field("Depreciable Basis"; "Depreciable Basis")
                {
                    ApplicationArea = All;
                }
                field("Salvage Value"; "Salvage Value")
                {
                    ApplicationArea = All;
                }
                field("Book Value on Disposal"; "Book Value on Disposal")
                {
                    ApplicationArea = All;
                }
                field(Maintenance; Maintenance)
                {
                    ApplicationArea = All;
                }
                field("Acquisition Date"; "Acquisition Date")
                {
                    ApplicationArea = all;
                }
                field("G/L Acquisition Date"; "G/L Acquisition Date")
                {
                    ApplicationArea = All;
                }
                field("Disposal Date"; "Disposal Date")
                {
                    ApplicationArea = All;
                }
                field("Last Acquisition Cost Date"; "Last Acquisition Cost Date")
                {
                    ApplicationArea = All;
                }
                field("Last Depreciation Date"; "Last Depreciation Date")
                {
                    ApplicationArea = all;
                }
                field("Last Write-Down Date"; "Last Write-Down Date")
                {
                    ApplicationArea = All;
                }
                field("Last Custom 1 Date"; "Last Custom 1 Date")
                {
                    ApplicationArea = All;
                }
                field("Last Custom 2 Date"; "Last Custom 2 Date")
                {
                    ApplicationArea = all;
                }
                field("Last Salvage Value Date"; "Last Salvage Value Date")
                {
                    ApplicationArea = all;
                }
                field("FA Exchange Rate"; "FA Exchange Rate")
                {
                    ApplicationArea = All;
                }
                field("Fixed Depr. Amount below Zero"; "Fixed Depr. Amount below Zero")
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = All;
                }
                field("First User-Defined Depr. Date"; "First User-Defined Depr. Date")
                {
                    ApplicationArea = All;
                }
                field("Use FA Ledger Check"; "Use FA Ledger Check")
                {
                    ApplicationArea = All;
                }
                field("Last Maintenance Date"; "Last Maintenance Date")
                {
                    ApplicationArea = All;
                }
                field("Depr. below Zero %"; "Depr. below Zero %")
                {
                    ApplicationArea = All;
                }
                field("Projected Disposal Date"; "Projected Disposal Date")
                {
                    ApplicationArea = All;
                }
                field("Projected Proceeds on Disposal"; "Projected Proceeds on Disposal")
                {
                    ApplicationArea = All;
                }
                field("Depr. Starting Date (Custom 1)"; "Depr. Starting Date (Custom 1)")
                {
                    ApplicationArea = All;
                }
                field("Depr. Ending Date (Custom 1)"; "Depr. Ending Date (Custom 1)")
                {
                    ApplicationArea = All;
                }
                field("Accum. Depr. % (Custom 1)"; "Accum. Depr. % (Custom 1)")
                {
                    ApplicationArea = All;
                }
                field("Depr. This Year % (Custom 1)"; "Depr. This Year % (Custom 1)")
                {
                    ApplicationArea = All;
                }
                field("Property Class (Custom 1)"; "Property Class (Custom 1)")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Main Asset/Component"; "Main Asset/Component")
                {
                    ApplicationArea = All;
                }
                field("Component of Main Asset"; "Component of Main Asset")
                {
                    ApplicationArea = All;
                }
                field("FA Add.-Currency Factor"; "FA Add.-Currency Factor")
                {
                    ApplicationArea = All;
                }
                field("Use Half-Year Convention"; "Use Half-Year Convention")
                {
                    ApplicationArea = All;
                }
                field("Use DB% First Fiscal Year"; "Use DB% First Fiscal Year")
                {
                    ApplicationArea = All;
                }
                field("Temp. Ending Date"; "Temp. Ending Date")
                {
                    ApplicationArea = All;
                }
                field("Temp. Fixed Depr. Amount"; "Temp. Fixed Depr. Amount")
                {
                    ApplicationArea = All;
                }
                field("Ignore Def. Ending Book Value"; "Ignore Def. Ending Book Value")
                {
                    ApplicationArea = All;
                }
                field("Default FA Depreciation Book"; "Default FA Depreciation Book")
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}