pageextension 50110 "Item Card Picture Extension" extends "Item Card"
{
    actions
    {
        addlast(Functions)
        {
            action(ImportItemPicture)
            {
                Caption = 'Import Item Picture';
                ApplicationArea = All;
                Image = Import;
                ToolTip = 'Import Item Picture';
                trigger OnAction()
                var
                    ImageManagement: Codeunit "Image Management";
                begin
                    ImageManagement.ImportItemPicture(Rec);
                end;
            }
        }
    }
}