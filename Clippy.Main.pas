unit Clippy.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, HGM.Controls.PanelExt,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, System.Generics.Collections;

type
  TAnimateManager = class;

  TAnimate = class
   private
    FStartFrame:Integer;
    FEndFrame:Integer;
    FName: string;
    FManager: TAnimateManager;
    FInterval: Integer;
    procedure SetEndFrame(const Value: Integer);
    procedure SetStartFrame(const Value: Integer);
    procedure SetManager(const Value: TAnimateManager);
    procedure SetName(const Value: string);
    procedure SetInterval(const Value: Integer);
   public
    constructor Create(AManager:TAnimateManager; AName:string; AStartFrame, AEndFrame:Integer; AInterval:Integer = 100);
    property StartFrame:Integer read FStartFrame write SetStartFrame;
    property EndFrame:Integer read FEndFrame write SetEndFrame;
    property Name:string read FName write SetName;
    property Manager:TAnimateManager read FManager write SetManager;
    property Interval:Integer read FInterval write SetInterval;
  end;

  TAnimateManager = class(TList<TAnimate>)
   function GetIdle:TAnimate;
  end;

  TForm9 = class(TForm)
    ImageList1: TImageList;
    DrawPanel1: TDrawPanel;
    TimerAnimate: TTimer;
    Panel1: TPanel;
    ListBox1: TListBox;
    TimerIdle: TTimer;
    procedure DrawPanel1Paint(Sender: TObject);
    procedure TimerAnimateTimer(Sender: TObject);
    procedure DrawPanel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure TimerIdleTimer(Sender: TObject);
  private
    FCurrentFrame:Integer;
    FDoNext:Boolean;
    FCurrentAnimate:TAnimate;
    FEndedAnimate:Boolean;
    FNextAnimate:TAnimate;
    FNeedNextAnimate:Boolean;
    FIdle:TAnimate;

    FKnockKnock:TAnimate;
    FCheck:TAnimate;

    FLookLeft:TAnimate;
    FLookRight:TAnimate;

    FSendMail:TAnimate;
    FAtom:TAnimate;

    FSleepDown:TAnimate;
    FPrint:TAnimate;
    FHide:TAnimate;
    FSave:TAnimate;
    FGestureUp:TAnimate;
    FIdle1_1:TAnimate;
    FDig:TAnimate;
    FLookUpLeft:TAnimate;
    FIdleSideToSide:TAnimate;
    FGoodBye:TAnimate;
    FIdleHeadScratch:TAnimate;
    FLookUpRight:TAnimate;
    FReading:TAnimate;
    FHearing:TAnimate;
    FGetWizardy:TAnimate;
    FIdleFingerTap:TAnimate;
    FGestureLeft:TAnimate;
    FAttention:TAnimate;
    FGestureRight:TAnimate;
    FWriting:TAnimate;
    FIdleSnooze:TAnimate;
    FLookDownRight:TAnimate;
    FGetArtsy:TAnimate;
    FShow:TAnimate;
    FLookDown:TAnimate;
    FSearching:TAnimate;
    FEmptyTrash:TAnimate;
    FGreeting:TAnimate;
    FLookUp:TAnimate;
    FGestureDown:TAnimate;
    FIdleEyeBrowRaise:TAnimate;
    FLookDownLeft:TAnimate;
    FManager: TAnimateManager;


    procedure NextStep;
    procedure EndStep;
    procedure StartAnimate(Animate:TAnimate);
    procedure FStartNextAnimate;
    procedure SetManager(const Value: TAnimateManager);
    { Private declarations }
  public
    property Manager:TAnimateManager read FManager write SetManager;
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.Button4Click(Sender: TObject);
{var Ln:TStringList;
  i, p, w, h, Num, FNum, LNum: Integer;
  s, s2, s3, Anim:string;

function GetW:Integer;
begin
 if w = 0 then Exit(0)
 else Exit(w div 124);
end;

function GetH:Integer;
begin
 if h = 0 then Exit(0)
 else Exit(h div 93);
end;
            }
begin      {
 Ln:=TStringList.Create;
 Ln.LoadFromFile('C:\Users\Геннадий\Desktop\clippy.js-master\agents\Clippy\agent.txt');
 Memo1.Clear;
 Num:=-1;
 FNum:=-1;
 LNum:=-1;
 for i:= 0 to Ln.Count-1 do
  begin
   p:=Pos('[[', Ln[i]);
   if p > 0 then              //3348 3162
    begin
     s:=Copy(Ln[i], p+2, Pos(']]', Ln[i])-(p+2));
     s2:=Copy(s, Pos(',', s)+2, 10);
     s:=Copy(s, 1, Pos(',', s)-1);

     if TryStrToInt(s, w) and TryStrToInt(s2, h) then
      begin
       if (3348 div 124) * GetH + GetW <> 0 then
        begin
         Num:=(3348 div 124) * GetH + GetW;

        end;
       if (FNum = -1) then FNum:=Num;
      end;

    end
   else
    begin
     if Num <> -1 then Anim:=s3;
     if Ln[i] <> '' then if Ln[i][1] = '"' then s3:=StringReplace(StringReplace(Ln[i], '": ', '', [rfReplaceAll]), '"', '', [rfReplaceAll]);
     if Num = -1 then Continue
     else LNum:=Num;
    end;
   if LNum <> -1 then
    begin
     Num:=-1;
     Memo1.Lines.Add('F'+Anim+':=TAnimate.Create(Manager, '''+Anim+''','+IntToStr(FNum)+', '+IntToStr(LNum)+');');
     //Memo2.Lines.Add('F'+Anim+':TAnimate;');
     FNum:=-1;
     LNum:=-1;
    end;
  end;
 Ln.Free;   }
end;

procedure TForm9.DrawPanel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 SendMessage(Handle, WM_SYSCOMMAND, 61458, 0);
end;

procedure TForm9.DrawPanel1Paint(Sender: TObject);
begin
 with DrawPanel1.Canvas do
  begin
   Brush.Color:=clFuchsia;
   FillRect(DrawPanel1.ClientRect);

   ImageList1.Draw(DrawPanel1.Canvas, 0, 0, FCurrentFrame, True);
  end;
end;

procedure TForm9.EndStep;
begin
 FDoNext:=False;
 FEndedAnimate:=True;
 if FNeedNextAnimate then FStartNextAnimate
 else StartAnimate(FIdle);
end;

procedure TForm9.FormCreate(Sender: TObject);
var
  i: Integer;
begin
 FDoNext:=False;
 FEndedAnimate:=True;
 FManager:=TAnimateManager.Create;

  FKnockKnock:=TAnimate.Create(Manager, 'KnockKnock',199, 217);
  FCheck:=TAnimate.Create(Manager, 'Check',1, 19);
  FLookLeft:=TAnimate.Create(Manager, 'LookLeft',194, 198);
  FLookRight:=TAnimate.Create(Manager, 'LookRight',434, 438);

  FLookDown:=TAnimate.Create(Manager, 'LookDown',23, 26);
  FLookUp:=TAnimate.Create(Manager, 'LookUp',851, 855);

  FLookUpLeft:=TAnimate.Create(Manager, 'LookUpLeft',218, 222);
  FLookUpRight:=TAnimate.Create(Manager, 'LookUpRight',439, 443);

  FLookDownRight:=TAnimate.Create(Manager, 'LookDownRight',897, 901);
  FLookDownLeft:=TAnimate.Create(Manager, 'LookDownLeft',700, 704);

  FSendMail:=TAnimate.Create(Manager, 'SendMail',361, 420);
  FAtom:=TAnimate.Create(Manager, 'Atom',28, 62);
  FSleepDown:=TAnimate.Create(Manager, 'SleepDown',66, 136);
  FPrint:=TAnimate.Create(Manager, 'Print',137, 193);
  FSave:=TAnimate.Create(Manager, 'Save',268, 306);
  FDig:=TAnimate.Create(Manager, 'Dig',307, 342);
  FHearing:=TAnimate.Create(Manager, 'Hearing',343, 360);
  FAttention:=TAnimate.Create(Manager, 'Attention',522, 544);
  FSearching:=TAnimate.Create(Manager, 'Searching',737, 791);
  FEmptyTrash:=TAnimate.Create(Manager, 'EmptyTrash',792, 822);
  FGetArtsy:=TAnimate.Create(Manager, 'GetArtsy',705, 717);

  FIdle1_1:=TAnimate.Create(Manager, 'Idle1_1',233, 236);
  FIdleEyeBrowRaise:=TAnimate.Create(Manager, 'IdleEyeBrowRaise',63, 65);
  FIdleSideToSide:=TAnimate.Create(Manager, 'IdleSideToSide',233, 267);
  FIdleHeadScratch:=TAnimate.Create(Manager, 'IdleHeadScratch',718, 736);
  FIdleFingerTap:=TAnimate.Create(Manager, 'IdleFingerTap',888, 896);
  FIdleSnooze:=TAnimate.Create(Manager, 'IdleSnooze',614, 699);

  FGestureUp:=TAnimate.Create(Manager, 'GestureUp',223, 232);
  FGestureDown:=TAnimate.Create(Manager, 'GestureDown',421, 433);
  FGestureRight:=TAnimate.Create(Manager, 'GestureRight',511, 521);
  FGestureLeft:=TAnimate.Create(Manager, 'GestureLeft',545, 554);

  FGoodBye:=TAnimate.Create(Manager, 'GoodBye',856, 887);
  FGreeting:=TAnimate.Create(Manager, 'Greeting',823, 850);

  FReading:=TAnimate.Create(Manager, 'Reading',444, 496);
  FWriting:=TAnimate.Create(Manager, 'Writing',555, 613);

  FShow:=TAnimate.Create(Manager, 'Show',22, 20);
  FHide:=TAnimate.Create(Manager, 'Hide',20, 22);


  FIdle:=TAnimate.Create(Manager, 'Idle',233, 233);

  for i:= 0 to Manager.Count - 1 do
   ListBox1.Items.Add(Manager[i].Name);
 StartAnimate(FIdle);
end;

procedure TForm9.FStartNextAnimate;
begin
 FNeedNextAnimate:=False;
 FEndedAnimate:=False;
 FCurrentAnimate:=FNextAnimate;
 TimerAnimate.Interval:=FCurrentAnimate.Interval;
 FCurrentFrame:=FCurrentAnimate.StartFrame;
end;

procedure TForm9.ListBox1DblClick(Sender: TObject);
begin
 StartAnimate(Manager[ListBox1.ItemIndex]);
end;

procedure TForm9.TimerAnimateTimer(Sender: TObject);
begin
 NextStep;
end;

procedure TForm9.TimerIdleTimer(Sender: TObject);
begin
 TimerIdle.Enabled:=False;
 StartAnimate(Manager.GetIdle);
end;

procedure TForm9.NextStep;
begin
 //if not FDoNext then Exit;
 if not Assigned(FCurrentAnimate) then Exit;
 if FCurrentAnimate = FIdle then
  begin
   TimerIdle.Enabled:=True;
  end
 else
  begin
   TimerIdle.Enabled:=False;
  end;
 if FCurrentAnimate.StartFrame > FCurrentAnimate.EndFrame then
  begin
   Dec(FCurrentFrame);
   if FCurrentFrame < FCurrentAnimate.EndFrame then
    begin
     EndStep;
    end;
  end
 else
  begin
   Inc(FCurrentFrame);
   if FCurrentFrame > FCurrentAnimate.EndFrame then
    begin
     EndStep;
    end;
  end;


 DrawPanel1.Repaint;
end;

procedure TForm9.SetManager(const Value: TAnimateManager);
begin
 FManager := Value;
end;

procedure TForm9.StartAnimate(Animate: TAnimate);
begin
 FNextAnimate:=Animate;
 FNeedNextAnimate:=True;
 if FEndedAnimate then FStartNextAnimate;
end;

{ TAnimate }

constructor TAnimate.Create(AManager:TAnimateManager; AName:string; AStartFrame, AEndFrame: Integer; AInterval:Integer);
begin
 inherited Create;
 FStartFrame:=AStartFrame;
 FEndFrame:=AEndFrame;
 FManager:=AManager;
 FName:=AName;
 FInterval:=AInterval;
 if Assigned(FManager) then FManager.Add(Self)
end;

procedure TAnimate.SetEndFrame(const Value: Integer);
begin
  FEndFrame := Value;
end;

procedure TAnimate.SetInterval(const Value: Integer);
begin
  FInterval := Value;
end;

procedure TAnimate.SetManager(const Value: TAnimateManager);
begin
  FManager := Value;
end;

procedure TAnimate.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TAnimate.SetStartFrame(const Value: Integer);
begin
  FStartFrame := Value;
end;

{ TAnimateManager }

function TAnimateManager.GetIdle: TAnimate;
var i:Integer;
begin
 repeat
  i:=Random(Count-1);
 until Pos('Idle', Items[i].Name) > 0;
 Result:=Items[i];
end;

end.
