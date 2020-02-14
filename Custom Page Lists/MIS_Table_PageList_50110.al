page 50110 "MIS Table"
{
    PageType = List;
    caption = 'MIS Table';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "MIS Table";
    DeleteAllowed = true;
    InsertAllowed = false;
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
                    Editable = false;
                }
                field(Month; Month)
                {
                    ApplicationArea = All;
                }
                field(Date; Date)
                {
                    ApplicationArea = All;
                }
                field("Participant Account"; "Participant Account")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Segment"; "Customer Segment")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Member Category"; "Member Category")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Domicile Region"; "Domicile Region")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Domicile Country"; "Domicile Country")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("DME Vendor"; "DME Vendor"
                )
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Fill Firm Id"; "Fill Firm Id")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Firm Name"; "Firm Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Main Account Number"; "Main Account Number")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Account Number"; "Account Number")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Process Date"; "Process Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Trade Date"; "Trade Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Product Exchange"; "Product Exchange")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Venue; Venue)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Tran Type Name"; "Tran Type Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Orig Tran Type Name"; "Orig Tran Type Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Change Code"; "Change Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Commodity Code"; "Commodity Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("FUT Opt Ind"; "FUT Opt Ind")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Broker Code"; "Broker Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Broker Name"; "Broker Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Tag50; Tag50)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Contract YYYY MM"; "Contract YYYY MM")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Invoice Status"; "Invoice Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Type Name"; "Type Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Rate Type"; "Rate Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Rate; Rate)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Account Owner Title"; "Account Owner Title")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Account Owner 1"; "Account Owner 1")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Account Owner 2"; "Account Owner 2")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Account Owner 3"; "Account Owner 3")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("fee Quantity"; "fee Quantity")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Applied fees"; "Applied fees")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Type of Member"; "Type of Member")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Participant Account")
            {
                Image = CreateDocuments;
                ApplicationArea = All;
                trigger OnAction()
                var
                    DME_Fn: Codeunit "DME Functions";
                begin
                    If Confirm(Text001, FALSE) then Begin
                        DME_Fn.CreateParticipantAcc();
                        CurrPage.Update();
                        Message(Text002);
                    end;
                end;
            }
            action("Update participant Details")
            {
                Image = UpdateDescription;
                ApplicationArea = All;
                trigger OnAction()
                var
                    DME_Fn: Codeunit "DME Functions";
                begin
                    If Confirm(Text003, FALSE) then Begin
                        DME_Fn.UpdateParticipantDetails();
                        CurrPage.Update();
                        Message(Text004);
                    end;
                end;
            }
            action("Update Member Category")
            {
                Image = Category;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Report.RunModal(50100, true, false);
                end;
            }
        }
    }

    var

        Text001: Label 'Are you sure you want to create Participant Account?';
        Text002: Label 'Participant Account Created.';
        Text003: Label 'Are you sure you want to update the Participant Details?';
        Text004: Label 'Participant Details updated.';
}