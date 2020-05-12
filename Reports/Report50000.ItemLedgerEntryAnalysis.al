report 50000 "Item Ledger Entry Analysis"
{
    Caption = 'Item Ledger Entry Analysis';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ItemLedgerEntryAnalysis.rdl';
    UseRequestPage = true;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            column(ItemNo_ItemLedgerEntry; "Item Ledger Entry"."Item No.")
            {
                IncludeCaption = true;
            }
            column(PostingDate_ItemLedgerEntry; "Item Ledger Entry"."Posting Date")
            {
                IncludeCaption = true;
            }
            column(EntryType_ItemLedgerEntry; "Item Ledger Entry"."Entry Type")
            {
                IncludeCaption = true;
            }
            column(DocumentNo_ItemLedgerEntry; "Item Ledger Entry"."Document No.")
            {
                IncludeCaption = true;
            }
            column(Description_ItemLedgerEntry; "Item Ledger Entry".Description)
            {
                IncludeCaption = true;
            }
            column(LocationCode_ItemLedgerEntry; "Item Ledger Entry"."Location Code")
            {
                IncludeCaption = true;
            }
            column(Quantity_ItemLedgerEntry; "Item Ledger Entry".Quantity)
            {
                IncludeCaption = true;
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(includeLogo; includeLogo)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(includeLogo; includeLogo)
                    {
                        Caption = 'Include Company Logo';
                    }
                }
            }
        }
        actions
        {
        }
    }
    labels
    {
        PageNo = 'Page';
        BCReportName = 'Item Ledger Entry Analysis';
    }
    var
        CompanyInfo: Record "Company Information";
        includeLogo: Boolean;

    trigger OnPreReport()
    begin
        if includeLogo then begin
            CompanyInfo.Get();
            CompanyInfo.CalcFields(Picture);
        end;
    end;



}