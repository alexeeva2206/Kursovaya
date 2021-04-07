unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Jpeg, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    procedure ApplicOnMessage(var Msg: TMsg; var Handled: Boolean);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }

procedure TForm1.ApplicOnMessage(var Msg: TMsg; var Handled: Boolean);
var
  Koord: TPoint;
begin
  if Msg.message = WM_LBUTTONDOWN then
  begin
    Label1.Caption := 'Щелкнули левой кнопкой';
    Koord := Msg.pt;
    Label2.Caption := IntToStr(Koord.X) + '  ' + IntToStr(Koord.Y);
  end;

  if Msg.message = WM_MOUSEWHEEL then
  begin
    if Msg.wParam > 0 then
    begin
      Image1.Width := Image1.Width + 7;
      Image1.Height := Image1.Height + 7;
    end
    else
    begin
      Image1.Width := Image1.Width - 7;
      Image1.Height := Image1.Height - 7;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Application.OnMessage := ApplicOnMessage;
end;

procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  Koord: TPoint;
begin
  Caption := Caption + IntToStr(WheelDelta);
{
  if Msg.message = WM_LBUTTONDOWN then
  begin
    Label1.Caption := 'Щелкнули левой кнопкой';
    Koord := Msg.pt;
    Label2.Caption := IntToStr(Koord.X) + '  ' + IntToStr(Koord.Y);
  end;
}
//  if Msg.message = WM_MOUSEWHEEL then
  begin
//   if Msg.wParam > 0 then
    begin
      Image1.Width := Image1.Width + WheelDelta;
      Image1.Height := Image1.Height + WheelDelta;
    end;
//    else
    begin
      Image1.Width := Image1.Width + WheelDelta;
      Image1.Height := Image1.Height + WheelDelta;
    end;
  end;
end;

end.
