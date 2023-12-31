unit SDIMAIN;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, StdActns,
  ActnList, ToolWin, SysUtils, IniFiles;

type
  TSDIAppForm = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SDIAppForm: TSDIAppForm;

type
  TMAME_START = Function(): Integer; stdcall;
  TMAME_STOP = Function(): Integer; stdcall;
  TMAME_COPYDATA = Function(id: Integer; name: PChar): Integer; stdcall;
  TMAME_UPDATESTATE = Function(id: Integer; state: Integer): Integer; stdcall;
  TMAME_MAMEOUTPUT = Function(name: PChar; value: Integer): Integer; stdcall;

var
  output_hash: THashedStringList;
  mame_start_ptr: TMAME_START;
  mame_stop_ptr: TMAME_STOP;
  mame_copydata_ptr: TMAME_COPYDATA;
  mame_updatestate_ptr: TMAME_UPDATESTATE;
  mame_output_ptr: TMAME_OUTPUT;

Function init_mame(clientid: Integer; name: String; start: TMAME_START; stop: TMAME_STOP; copydata: TMAME_COPYDATA; updatestate: TMAME_UPDATESTATE; mameoutput: TMAME_MAMEOUTPUT): Integer; stdcall; external 'Mame32.dll';
Function close_mame(): Integer; stdcall; external 'Mame.dll';
Function map_id_to_outname(id: Integer): PChar; stdcall; external 'Mame.dll';

Function mame_start(): Integer; stdcall;
Function mame_stop(): Integer; stdcall;
Function mame_copydata(id: Integer; name: PChar): Integer; stdcall;
Function mame_updatestate(id: Integer; state: Integer): Integer; stdcall;
Function mame_output(name: PChar; value: Integer): Integer; stdcall;
Function get_name_from_id(id: Integer): String;

implementation

{$R *.dfm}

Function mame_start(): Integer; stdcall;
Begin
  output_hash.Clear;

  SDIAppForm.Memo1.Lines.Add('mame_start');

  mame_start := 1;
End;

Function mame_stop(): Integer; stdcall;
Begin
  SDIAppForm.Memo1.Lines.Add('mame_stop');

  mame_stop := 1;
End;

Function mame_copydata(id: Integer; name: PChar): Integer; stdcall;
Begin
  SDIAppForm.Memo1.Lines.Add('id '+ IntToStr(id) + ' = '''+ name+ '''');

  mame_copydata := 1;
End;

Function mame_updatestate(id: Integer; state: Integer): Integer; stdcall;
var
  name: String;
Begin
  name := get_name_from_id(id);

  SDIAppForm.Memo1.Lines.Add('update_state: id='+ IntToStr(id) + ' ('+ name+ ') state=' + IntToStr(state));

  mame_updatestate := 1;
End;

Function mame_output(name: PChar; value: Integer): Integer; stdcall;
==
Begin
  SDIAppForm.Memo1.Lines.Add('update_state: name='+ name + ' value=' + IntToStr(value));

  mame_output := 1;
End;

Function get_name_from_id(id: Integer): String;
var
  name: String;
  index: Integer;
Begin
  index := output_hash.IndexOfObject(TObject(id));
  if index = -1 then
  begin
    name := map_id_to_outname(id);
    output_hash.AddObject(name, TObject(id));
  end
  else begin
    name := String(output_hash[index]);
  end;
  get_name_from_id := name;
End;

procedure TSDIAppForm.FormShow(Sender: TObject);
begin
  output_hash := THashedStringList.Create;
  mame_start_ptr := @mame_start;
  mame_stop_ptr := @mame_stop;
  mame_copydata_ptr := @mame_copydata;
  mame_updatestate_ptr := @mame_updatestate;
  mame_output_ptr := @mame_output;

  init_mame(1, 'test', mame_start_ptr, mame_stop_ptr, mame_copydata_ptr, mame_updatestate_ptr, mame_output_ptr);
end;

end.
