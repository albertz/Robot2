unit uMainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons,
  StrUtils //Ansi* functions
  ;
  
const
  WORLD_WIDTH = 5; // room count
  WORLD_HEIGHT = 4;
  ROOM_WIDTH = 20; // place count in a room
  ROOM_HEIGHT = 20;
  PICTURE_SIZE = 30; // picture cache size
  
type
  TRoomNum = record // world coord
    X: 1..WORLD_WIDTH;
    Y: 1..WORLD_HEIGHT;
  end;

  TPlaceNum = record // room coord
    X: 1..ROOM_WIDTH;
    Y: 1..ROOM_HEIGHT;
  end;

  TPlaceAbsNum = 1..(ROOM_WIDTH*ROOM_HEIGHT); // abs room-index
  TRoomAbsNum = 1..(WORLD_WIDTH*WORLD_HEIGHT); // abs place-index
  
  TPlace = Integer; // index of TPictureCache

  TRoom = array[TPlaceAbsNum] of TPlace; // a hole room
  TWorld = array[TRoomAbsNum] of TRoom; // a hole world

  TPictureCacheItem = record
    FileName: string;
    Picture: TBitmap;
  end;
  TPictureCache = array of TPictureCacheItem;

  TMoveDirection = (mdLeft, mdRight, mdUp, mdDown);

  { TMainForm }

  TMainForm = class(TForm)
    GamePanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { private declarations }
  public
    // gameplay
    procedure MoveToRoom(dir: TMoveDirection); // goto next room
    procedure MoveToRoom(rnum: TRoomNum); // goto another room
    procedure MoveToPlace(dir: TMoveDirection); // move player
    function GetPlayerPos(): TPlaceNum; // searchs the player; returns (1,1), if not found
    
    // background stuff
    procedure InitGame();
    function GetAbs(rnum: TRoomNum): TRoomAbsNum; // coord -> abs index
    function GetAbs(pnum: TPlaceNum): TPlaceAbsNum; // coord -> abs index
    function GetNumR(absnum: TRoomAbsNum): TRoomNum; // abs index -> coord
    function GetNumP(absnum: TPlaceAbsNum): TPlaceNum; // abs index -> coord
    procedure DrawRoom(); // updates MyRoomPic
    procedure LoadWorld(fname: string); // loads a hole world (sci-file)
    function GetPicture(fname: string): TBitmap; // load picture from cache/disk
    function GetPictureCacheIndex(fname: string): Integer;
    procedure PlaySound(fname: string); // plays wave-file
    function GetPlace(pos: TPlaceNum): string; // returns picture filename
    procedure SetPlace(pos: TPlaceNum; fname: string); // sets picture filename

    MyWorld: TWorld;
    MyRoomNum: TRoomNum; // selected room of my world
    MyRoomPic: record // user view
                 Room: TRoom; // room actually viewed
                 Picture: TBitmap; // paint cache
               end;
    MyPictureCache: TPictureCache; // cache of all graphics in the game
  end;

var
  MainForm: TMainForm;

implementation

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  InitGame();
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to High(MyPictureCache) do
  begin
    MyPictureCache[i].Picture.Free();
  end;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // TODO ...

  case Key of
  37: // left
    MoveToPlace(mdLeft);
  39: // right
    MoveToPlace(mdRight);
  38: // up
    MoveToPlace(mdUp);
  40: // down
    MoveToPlace(mdDown);
  end;

  if ssCtrl in Shift then // cheat keys
  case Key of
  37: // left
    MoveToRoom(mdLeft);
  39: // right
    MoveToRoom(mdRight);
  38: // up
    MoveToRoom(mdUp);
  40: // down
    MoveToRoom(mdDown);
  end;

end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  DrawRoom();
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  //DrawRoom();
end;

// ------------------------------------------------
// gameplay

procedure TMainForm.MoveToRoom(rnum: TRoomNum);
begin
  MyRoomNum := rnum;

  DrawRoom();
end;

procedure TMainForm.MoveToRoom(dir: TMoveDirection);
begin
  case dir of
  mdLeft:
    if MyRoomNum.X > 1 then MyRoomNum.X := MyRoomNum.X - 1;
  mdRight:
    if MyRoomNum.X < WORLD_WIDTH then MyRoomNum.X := MyRoomNum.X + 1;
  mdUp:
    if MyRoomNum.Y > 1 then MyRoomNum.Y := MyRoomNum.Y - 1;
  mdDown:
    if MyRoomNum.Y < WORLD_HEIGHT then MyRoomNum.Y := MyRoomNum.Y + 1;
  end;

  DrawRoom();
end;

function TMainForm.GetPlayerPos(): TPlaceNum;
var
  i: Integer;
begin
  GetPlayerPos.X := 1;
  GetPlayerPos.Y := 1;
  for i := 1 to ROOM_WIDTH*ROOM_HEIGHT do
  begin
    if GetPlace(GetNumP(i)) = 'figur.bmp' then
    begin
      GetPlayerPos := GetNumP(i);
      exit;
    end;
  end;
end;

procedure TMainForm.MoveToPlace(dir: TMoveDirection);
var
  figurpos: TPlaceNum;
  i: Integer;
begin
  figurpos := GetPlayerPos();
  if (figurpos.X = 1) and (figurpos.Y = 1) then exit; // not found
  
  // TODO ...
  
  DrawRoom();
end;

// ------------------------------------------------
// stuff in background to make it work well

procedure TMainForm.InitGame(); // start here
var
  tmp: TBitmap;
  rnum: TRoomNum;
  i: Integer;
begin
  // reset MyRoomPic
  for i := 1 to ROOM_WIDTH*ROOM_HEIGHT do
  begin
    MyRoomPic.Room[i] := -1;
  end;
  MyRoomPic.Picture := TBitmap.Create();
  MyRoomPic.Picture.Width := PICTURE_SIZE*ROOM_WIDTH;
  MyRoomPic.Picture.Height := PICTURE_SIZE*ROOM_HEIGHT;

  // load my world
  LoadWorld('robot.sce');
  rnum.X := 1; rnum.Y := 1;
  MoveToRoom(rnum);
end;

function TMainForm.GetPlace(pos: TPlaceNum): string;
begin
  // TODO: check range error
  GetPlace := MyPictureCache[MyWorld[GetAbs(MyRoomNum)][GetAbs(pos)]].FileName;
end;

procedure TMainForm.SetPlace(pos: TPlaceNum; fname: string);
begin
  // TODO: check range error
  MyWorld[GetAbs(MyRoomNum)][GetAbs(pos)] := GetPictureCacheIndex(fname);
end;

function TMainForm.GetAbs(rnum: TRoomNum): TRoomAbsNum;
begin
  GetAbs := (rnum.Y-1)*WORLD_WIDTH + rnum.X;
end;

function TMainForm.GetAbs(pnum: TPlaceNum): TPlaceAbsNum;
begin
  GetAbs := (pnum.Y-1)*ROOM_WIDTH + pnum.X;
end;

function TMainForm.GetNumR(absnum: TRoomAbsNum): TRoomNum;
begin
  GetNumR.X := (absnum-1) mod WORLD_WIDTH + 1;
  GetNumR.Y := (absnum-1) div WORLD_WIDTH + 1;
end;

function TMainForm.GetNumP(absnum: TPlaceAbsNum): TPlaceNum;
begin
  GetNumP.X := (absnum-1) mod ROOM_WIDTH + 1;
  GetNumP.Y := (absnum-1) div ROOM_WIDTH + 1;
end;

procedure TMainForm.DrawRoom();
var
  i: Integer;
  pic: TBitmap;
  fname: string;
  r: TRoom;
begin
  for i := 1 to ROOM_WIDTH*ROOM_HEIGHT do
  begin
    // only make updates
    if MyWorld[GetAbs(MyRoomNum)][i] <> MyRoomPic.Room[i] then
    begin
      pic := MyPictureCache[MyWorld[GetAbs(MyRoomNum)][i]].Picture;
      MyRoomPic.Picture.Canvas.Draw(
                                    (GetNumP(i).X-1)*PICTURE_SIZE,
                                    (GetNumP(i).Y-1)*PICTURE_SIZE,
                                    pic
                                    );
      MyRoomPic.Room[i] := MyWorld[GetAbs(MyRoomNum)][i];
      WriteLn('DrawRoom: update: ' +
              '(' + IntToStr(GetNumP(i).X) + ',' +
                    IntToStr(GetNumP(i).Y) + ')' +
               ' to: ' + IntToStr(MyRoomPic.Room[i]));
    end;
  end;

  // draw the hole area to screen (to the GamePanel)
  GamePanel.Canvas.CopyRect(
                            Rect(0,0,GamePanel.ClientWidth,GamePanel.ClientHeight),
                            MyRoomPic.Picture.Canvas,
                            Rect(0,0,MyRoomPic.Picture.Width,MyRoomPic.Picture.Height)
                            );
end;

function TMainForm.GetPictureCacheIndex(fname: string): Integer;
var
  i: Integer;
begin
  for i := 0 to High(MyPictureCache) do
  begin
    if(MyPictureCache[i].FileName = fname) then // found it!
    begin
      GetPictureCacheIndex := i;
      exit;
    end;
  end;
  GetPictureCacheIndex := -1;
end;

function TMainForm.GetPicture(fname: string): TBitmap;
var
  i: Integer;
  tmp: TBitmap;
begin
  // look in my cache, if the file is there
  i := GetPictureCacheIndex(fname);
  if i >= 0 then
  begin
    GetPicture := MyPictureCache[i].Picture;
    exit;
  end;

  // load the file
  tmp := TBitmap.Create();
  tmp.TransparentColor := TColor(1); // it's a hack; i hope, i never used this color
  tmp.Transparent := false; // this doesn't seems to work very well
  tmp.LoadFromFile(fname);

  // resize it
  GetPicture := TBitmap.Create();
  GetPicture.Width := PICTURE_SIZE;
  GetPicture.Height := PICTURE_SIZE;
  GetPicture.Canvas.CopyRect(
                             Rect(0,0,PICTURE_SIZE,PICTURE_SIZE),
                             tmp.Canvas,
                             Rect(0,0,tmp.Width,tmp.Height)
                             );
  tmp.Free(); // we don't need it anymore

  // put it in the cache
  SetLength(MyPictureCache, Length(MyPictureCache) + 1);
  MyPictureCache[High(MyPictureCache)].FileName := fname;
  MyPictureCache[High(MyPictureCache)].Picture := GetPicture;
end;

procedure TMainForm.PlaySound(fname: string);
begin
  // TODO: play the file
end;

procedure TMainForm.LoadWorld(fname: string);
var
  f: TextFile;
  tmp: string;
  roomnum: TRoomAbsNum;
  placenum: TPlaceAbsNum;
  i: Integer;
begin
  { file content:
  :RAUM1
  bild1.bmp
  bild2.bmp
    ...
  :RAUM2
    ...
  :RAUM20
    ...
  }

  AssignFile(f, fname); // open file
  try
    Reset(f); // go to the beginning

    while not EOF(f) do
    begin
      ReadLn(f, tmp);
      tmp := Trim(tmp);
      if tmp <> '' then
      begin
        if AnsiStartsStr(':RAUM', UpperCase(tmp)) then // new room
        begin
          roomnum := StrToInt(AnsiRightStr(tmp, Length(tmp) - 5));
          placenum := 1;
        end
        else
        begin // next place
          i := GetPictureCacheIndex(tmp);
          if i < 0 then // not there yet
          begin
            GetPicture(tmp); // loads it ( => and put it in the cache)
            i := High(MyPictureCache); // not very fine, but works
          end;
          //WriteLn('LoadWorld: ' + IntToStr(roomnum) + ',' +
          //        IntToStr(placenum) + ' (' + IntToStr(i) + ') ' + tmp);
          MyWorld[roomnum][placenum] := i;
          if placenum < ROOM_WIDTH*ROOM_HEIGHT then placenum := placenum + 1;
        end;
      end;
    end;

  finally
    CloseFile(f);
  end;
end;

initialization
  {$I umainform.lrs}

end.

