 unit Unit1;

 interface

 uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls;

 type
   TForm1 = class(TForm)
     Label1: TLabel;
     Button1: TButton;
     procedure Button1Click(Sender: TObject);
   private
     { private declarations }
   public
     { public declarations }
   end;

 var
   Form1: TForm1;

 implementation

 {$R *.dfm}

 procedure TForm1.Button1Click(Sender: TObject);
 begin
   Label1.Caption := 'Hello world';
 end;

 end.
