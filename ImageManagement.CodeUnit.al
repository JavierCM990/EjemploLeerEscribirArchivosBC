codeunit 50110 "Image Management"
{
    trigger OnRun()
    begin

    end;

    procedure ImportItemPicture(Item: Record Item)
    var
        PicInStream: InStream;
        FromFileName: Text;
        OverrideImageQst: Label 'The existing picture will be replaced. Continue?';
    begin
        with Item do begin
            if Picture.Count() > 0 then
                if not Confirm(OverrideImageQst) then
                    exit;

            if File.UploadIntoStream('Import', '', 'All Files (*.*)|*.*',
                                    FromFileName, PicInStream) then begin
                Clear(Picture);
                Picture.ImportStream(PicInStream, FromFileName);
                Modify(true);
            end;
        end;
    end;
}