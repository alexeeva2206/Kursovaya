unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

 const WM_MyMessage = WM_USER;
type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
  procedure WMMyMessage(var Message:TMessage);message WM_MyMessage;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.WMMyMessage(var Message: TMessage);
begin
MessageDlg('�������� ��������� WM_MyMessage' +#10#13+'� ����������� '
+#10#13+IntToStr(Message.wParam)+' '
+IntToStr(Message.LParam) ,mtInformation, [mbOk],0);
Form1.Height:=Message.wParam;
Form1.Width:=Message.LParam;
end;

end.
