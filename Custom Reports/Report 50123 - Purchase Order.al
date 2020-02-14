report 50123 "Purchase Order1"
{
    // version LT
    DefaultLayout = RDLC;
    Caption = 'Purchase Order_LT';
    PreviewMode = PrintLayout;
    RDLCLayout = 'Custom Reports\PurchaseOrder Report.rdl';
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("No.", "Document Type")
                                ORDER(Ascending)
                                WHERE("Document Type" = FILTER(Order));
            RequestFilterFields = "Buy-from Vendor No.", "No.";
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(Name_Vend; Name_Vend)
            {
            }
            column(Add_Vend; Add_Vend)
            {
            }
            column(Add2_Vend; Add2_Vend)
            {
            }
            column(BuyfromContact_PurchaseHeader; "Purchase Header"."Buy-from Contact")
            {
            }
            column(VATRegistrationNo_PurchaseHeader; "Purchase Header"."VAT Registration No.")
            {
            }
            column(PostingDate_PurchaseHeader1; "Purchase Header"."Posting Date")
            {
            }
            column(PostingDate_PurchaseHeader; "Purchase Header"."Order Date")
            {
            }
            column(ShiptoAddress_PurchaseHeader; "Purchase Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_PurchaseHeader; "Purchase Header"."Ship-to Address 2")
            {
            }
            column(CurrencyCode_PurchaseHeader; CurrCode)
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader; "Purchase Header"."Expected Receipt Date")
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(ComName; CompanyInfo.Name)
            {
            }
            column(CompAddress; CompanyInfo.Address)
            {
            }
            column(CompCity; CompanyInfo.City)
            {
            }
            column(CoMpanyInfo_Add2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_Postcode; CompanyInfo."Post Code")
            {
            }
            column(CompCountry; CompanyInfo."Country/Region Code")
            {
            }
            column(CompPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompEmail; CompanyInfo."E-Mail")
            {
            }
            column(TRN; CompanyInfo."VAT Registration No.")
            {
            }
            column(Desc; Desc)
            {
            }
            column(VendNo; VendNo)
            {
            }
            column(City; City)
            {
            }
            column(PostCode; PostCode)
            {
            }
            column(Contact; Contact)
            {
            }
            column(PhoneNo; PhoneNo)
            {
            }
            column(Fax; Fax)
            {
            }
            column(Email; Email)
            {
            }
            dataitem("Purch. Comment Line"; "Purch. Comment Line")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemLinkReference = "Purchase Header";
                DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.");
                column(Comment_PurchCommentLine; "Purch. Comment Line".Comment)
                {
                }
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                    ORDER(Ascending);
                column(DocumentNo_PurchaseLine; "Purchase Line"."Document No.")
                {
                }
                column(No_PurchaseLine; "Purchase Line"."No.")
                {
                }
                column(Description_PurchaseLine; "Add. Description")
                {
                }
                column(Quantity_PurchaseLine; "Purchase Line".Quantity)
                {
                }
                column(UnitCost_PurchaseLine; "Purchase Line"."Unit Cost")
                {
                }
                column(UnitofMeasure_PurchaseLine; "Purchase Line"."Unit of Measure")
                {
                }
                column(VAT_PurchaseLine; "Purchase Line"."VAT %")
                {
                }
                column(LineAmount_PurchaseLine; "Purchase Line"."Line Amount")
                {
                }
                column(InvDiscountAmount_PurchaseLine; "Purchase Line"."Inv. Discount Amount")
                {
                }
                column(VATBaseAmount_PurchaseLine; "Purchase Line"."VAT Base Amount")
                {
                }
                column(AmountIncludingVAT_PurchaseLine; "Purchase Line"."Amount Including VAT")
                {
                }
                column(LineDiscount_PurchaseLine; Discount)
                {
                }
                column(LineDiscountAmount_PurchaseLine; "Purchase Line"."Line Discount Amount")
                {
                }
                column(Amount; Amount)
                {
                }
                column(SNo; SNo)
                {
                }
                column(AmountText1; AmountText1)
                {
                }
                column(VatAmt; VatAmt)
                {
                }
                column(AmtInWord; AmtInWord)
                {
                }
                column(AmtIncVat; AmtIncVat)
                {
                }
                column(UnitofMeasureCode_PurchaseLine; "Purchase Line"."Unit of Measure Code")
                {
                }
                column(Amount_PurchaseLine; "Purchase Line".Amount)
                {
                }
                column(DirectUnitCost_PurchaseLine; "Purchase Line"."Direct Unit Cost")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF "Purchase Line"."No." <> '' THEN
                        SNo += 1;

                    Amount := "Purchase Line"."Unit Cost" * "Purchase Line"."Unit Cost";
                    //VatAmt := ("Purchase Line"."VAT Base Amount" * "Purchase Line"."VAT %") /100;
                    VatAmt := "Purchase Line"."Amount Including VAT" - "Purchase Line"."Line Amount";

                    Discount := "Purchase Line"."Line Discount %";
                    //MESSAGE('%1',"Purchase Line"."Line Discount %");


                    AmtIncVat += "Purchase Line"."Amount Including VAT";

                    /*CLEAR(CheckRep);
                    CheckRep.InitTextVariable;
                    CheckRep.FormatNoText(NoText,ROUND(AmtIncVat),'');
                    AmtInWord := CurrCode + ' ' + NoText[1] ;*/
                    //TotalAmt +="Purchase Line"."Amount Including VAT";

                    tvar := (ROUND(AmtIncVat) MOD 1 * 100);



                    InitTextVariable;
                    FormatNoText(AmtInwrd11, tvar, '');
                    AmtInwrd12 := AmtInwrd11[1];
                    IF AmtInwrd12 = '' THEN
                        AmtInwrd12 := 'ZERO';


                    InitTextVariable;
                    FormatNoText(Amount_Words, AmtIncVat, '');
                    Text := Amount_Words[1];

                    AmountText1 := Text + ' AND ' + AmtInwrd12 + ' ' + 'ONLY';

                end;

                trigger OnPreDataItem();
                begin
                    SNo := 0;

                    CLEAR(Amount);
                    CLEAR(SNo);
                    CLEAR(VatAmt);
                    CLEAR(Discount);
                    CLEAR(AmtIncVat)
                end;
            }

            trigger OnAfterGetRecord();
            begin

                GlSetup.Get();
                IF VendorRec.GET("Buy-from Vendor No.") THEN BEGIN
                    Name_Vend := VendorRec.Name;
                    Add_Vend := VendorRec.Address;
                    Add2_Vend := VendorRec."Address 2";
                    VendNo := VendorRec."No.";
                    City := VendorRec.City;
                    Contact := VendorRec.Contact;
                    PhoneNo := VendorRec."Phone No.";
                    Fax := VendorRec."Fax No.";
                    Email := VendorRec."E-Mail";
                END;


                IF "Purchase Header"."Currency Code" = '' THEN
                    CurrCode := GlSetup."LCY Code"
                ELSE
                    CurrCode := "Purchase Header"."Currency Code";
                //<LT>
                //<LT>
                Currency_Rec.RESET;
                IF Currency_Rec.GET(CurrCode) THEN
                    // DecimalDec :=Currency_Rec."Decimal Description";
                    //<\LT>
                    PaymentTerms_Rec.RESET;
                IF PaymentTerms_Rec.GET("Purchase Header"."Payment Terms Code") THEN
                    Desc := PaymentTerms_Rec.Description;
                //<LT>
            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(CompanyInfo.Picture);

                CLEAR(CurrCode);

                CLEAR(DecimalDec);
                CLEAR(Desc);
                CLEAR(Name_Vend);
                CLEAR(Add_Vend);
                CLEAR(Add2_Vend);
                CLEAR(VendNo);
                CLEAR(City);
                CLEAR(Contact);
                CLEAR(PhoneNo);
                CLEAR(Fax);
                CLEAR(Email);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        VendorRec: Record Vendor;
        Add_Vend: Text;
        Add2_Vend: Text;
        Name_Vend: Text;
        Amount: Decimal;
        SNo: Integer;
        VatAmt: Decimal;
        Discount: Decimal;
        CompanyInfo: Record "Company Information";
        CheckRep: Report Check;
        DisAmt: Decimal;
        AmtIncVat: Decimal;
        NoText: array[3] of Text;
        AmtInWord: Text;
        CurrCode: Code[20];
        AmtDec: Decimal;
        Text026: Label 'ZERO';
        Text027: Label 'HUNDRED';
        Text028: Label 'AND';
        Text029: Label '%1 results in a written number that is too long.';
        Text030: Label '" is already applied to %1 %2 for customer %3."';
        Text031: Label '" is already applied to %1 %2 for vendor %3."';
        Text032: Label 'ONE';
        Text033: Label 'TWO';
        Text034: Label 'THREE';
        Text035: Label 'FOUR';
        Text036: Label 'FIVE';
        Text037: Label 'SIX';
        Text038: Label 'SEVEN';
        Text039: Label 'EIGHT';
        Text040: Label 'NINE';
        Text041: Label 'TEN';
        Text042: Label 'ELEVEN';
        Text043: Label 'TWELVE';
        Text044: Label 'THIRTEEN';
        Text045: Label 'FOURTEEN';
        Text046: Label 'FIFTEEN';
        Text047: Label 'SIXTEEN';
        Text048: Label 'SEVENTEEN';
        Text049: Label 'EIGHTEEN';
        Text050: Label 'NINETEEN';
        Text051: Label 'TWENTY';
        Text052: Label 'THIRTY';
        Text053: Label 'FORTY';
        Text054: Label 'FIFTY';
        Text055: Label 'SIXTY';
        Text056: Label 'SEVENTY';
        Text057: Label 'EIGHTY';
        Text058: Label 'NINETY';
        Text059: Label 'THOUSAND';
        Text060: Label 'MILLION';
        Text061: Label 'BILLION';
        Text062: Label 'G/L Account,Customer,Vendor,Bank Account';
        Text063: Label 'Net Amount %1';
        Text064: Label '%1 must not be %2 for %3 %4.';
        Text065: Label 'Subtotal';
        CheckNoTextCaptionLbl: Label 'Check No.';
        LineAmountCaptionLbl: Label 'Net Amount';
        LineDiscountCaptionLbl: Label 'Discount';
        AmountCaptionLbl: Label 'Amount';
        DocNoCaptionLbl: Label 'Document No.';
        DocDateCaptionLbl: Label 'Document Date';
        CurrencyCodeCaptionLbl: Label 'Currency Code';
        YourDocNoCaptionLbl: Label 'Your Doc. No.';
        TransportCaptionLbl: Label 'Transport';
        TotalAmt: Decimal;
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        tvar: Integer;
        Amount1: Decimal;
        AmtInwrd11: array[2] of Text;
        AmtInwrd12: Text;
        Amount_Words: array[2] of Text;
        Text: Text;
        AmountText1: Text;
        Currency_Rec: Record Currency;
        DecimalDec: Text[250];
        PaymentTerms_Rec: Record "Payment Terms";
        Desc: Text[250];
        VendNo: Code[20];
        City: Text[250];
        PostCode: Code[250];
        Contact: Text[250];
        PhoneNo: Text[250];
        Fax: Text[250];
        Email: Text[250];
        GlSetup: Record "General Ledger Setup";

    [Scope('Cloud')]
    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10]);
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        DecimalPosition: Decimal;
    begin
        CLEAR(NoText);
        NoTextIndex := 1;
        NoText[1] := '';
        //GLSetup.GET;

        IF No < 1 THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        ELSE
            FOR Exponent := 4 DOWNTO 1 DO BEGIN
                PrintExponent := FALSE;
                Ones := No DIV POWER(1000, Exponent - 1);
                Hundreds := Ones DIV 100;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                IF Hundreds > 0 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                END;
                IF Tens >= 2 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    IF Ones > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                END ELSE
                    IF (Tens * 10 + Ones) > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                IF PrintExponent AND (Exponent > 1) THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
            END;

        //AddToNoText(NoText,NoTextIndex,PrintExponent,Text028);
        //DecimalPosition := GetAmtDecimalPosition;
        //AddToNoText(NoText,NoTextIndex,PrintExponent,(FORMAT(No * DecimalPosition) + '/' + FORMAT(DecimalPosition)));

        IF CurrencyCode <> '' THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30]);
    begin
        PrintExponent := TRUE;

        WHILE STRLEN(NoText[NoTextIndex] + ' ' + AddText) > MAXSTRLEN(NoText[1]) DO BEGIN
            NoTextIndex := NoTextIndex + 1;
            IF NoTextIndex > ARRAYLEN(NoText) THEN
                ERROR(Text029, AddText);
        END;

        NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;

    [Scope('Cloud')]
    procedure InitTextVariable();
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;

    local procedure GetAmtDecimalPosition(): Decimal;
    var
        Currency: Record Currency;
    begin
        /*IF GenJnlLine."Currency Code" = '' THEN
          Currency.InitRoundingPrecision
        ELSE BEGIN
          Currency.GET(GenJnlLine."Currency Code");
          Currency.TESTFIELD("Amount Rounding Precision");
        END;
        EXIT(1 / Currency."Amount Rounding Precision");*/

    end;
}

