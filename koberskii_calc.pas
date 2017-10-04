unit koberskii_calc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ActnList, Clipbrd;

type

  { TForm1 }

  TForm1 = class(TForm)
    copy_buf: TAction;
    paste_buf: TAction;
    nine: TAction;
    minus: TAction;
    three: TAction;
    four: TAction;
    five: TAction;
    six: TAction;
    seven: TAction;
    eight: TAction;
    div_but_capt: TAction;
    multiply: TAction;
    backspace_capt: TAction;
    comma: TAction;
    zero: TAction;
    one: TAction;
    two: TAction;
    eq: TAction;
    plus: TAction;
    KeyCapture: TActionList;
    m_scr: TLabel;
    sign_scr: TLabel;
    two_but: TButton;
    one_but: TButton;
    minus_but: TButton;
    six_but: TButton;
    five_but: TButton;
    four_but: TButton;
    multi_but: TButton;
    nien_but: TButton;
    eight_but: TButton;
    seven_but: TButton;
    Backspace_but: TButton;
    c_but: TButton;
    ce_but: TButton;
    div_but: TButton;
    reverse_but: TButton;
    sq_but: TButton;
    sqrt_but: TButton;
    percent_but: TButton;
    mc_but: TButton;
    mr_but: TButton;
    mp_but: TButton;
    mm_but: TButton;
    ms_but: TButton;
    eq_but: TButton;
    res_scr: TLabel;
    temp_scr: TLabel;
    comma_but: TButton;
    zero_but: TButton;
    neg_but: TButton;
    plus_but: TButton;
    three_but: TButton;
    procedure copy_bufExecute(Sender: TObject);
    procedure eightExecute(Sender: TObject);
    procedure fiveExecute(Sender: TObject);
    procedure backspace_captExecute(Sender: TObject);
    procedure div_but_captExecute(Sender: TObject);
    procedure eqExecute(Sender: TObject);
    procedure Backspace_butClick(Sender: TObject);
    procedure ce_butClick(Sender: TObject);
    procedure c_butClick(Sender: TObject);
    procedure div_butClick(Sender: TObject);
    procedure eight_butClick(Sender: TObject);
    procedure eq_butClick(Sender: TObject);
    procedure five_butClick(Sender: TObject);
    procedure fourExecute(Sender: TObject);
    procedure four_butClick(Sender: TObject);
    procedure mc_butClick(Sender: TObject);
    procedure minusExecute(Sender: TObject);
    procedure minus_butClick(Sender: TObject);
    procedure mm_butClick(Sender: TObject);
    procedure mp_butClick(Sender: TObject);
    procedure mr_butClick(Sender: TObject);
    procedure ms_butClick(Sender: TObject);
    procedure multiplyExecute(Sender: TObject);
    procedure multi_butClick(Sender: TObject);
    procedure neg_butClick(Sender: TObject);
    procedure nien_butClick(Sender: TObject);
    procedure nineExecute(Sender: TObject);
    procedure oneExecute(Sender: TObject);
    procedure one_butClick(Sender: TObject);
    procedure paste_bufExecute(Sender: TObject);
    procedure percent_butClick(Sender: TObject);
    procedure plusExecute(Sender: TObject);
    procedure plus_butClick(Sender: TObject);
    procedure reverse_butClick(Sender: TObject);
    procedure sevenExecute(Sender: TObject);
    procedure seven_butClick(Sender: TObject);
    procedure sixExecute(Sender: TObject);
    procedure six_butClick(Sender: TObject);
    procedure sqrt_butClick(Sender: TObject);
    procedure sq_butClick(Sender: TObject);
    procedure threeExecute(Sender: TObject);
    procedure three_butClick(Sender: TObject);
    procedure twoExecute(Sender: TObject);
    procedure two_butClick(Sender: TObject);
    procedure commaExecute(Sender: TObject);
    procedure comma_butClick(Sender: TObject);
    procedure zeroExecute(Sender: TObject);
    procedure zero_butClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  i:integer;
  main_str,temp_str,last_sign: string;
  temp_float,temp, last_float, main_float, mem: extended;
  pressed,zap_flag,e_flag,pressed_eq: boolean;


implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.one_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0))) and (e_flag = false)  then begin
  main_str:= main_str + '1';
  main_float :=  StrToFloat(main_str);
  res_scr.caption := main_str;
  pressed := true;
  end;
  e_flag := false;
end;

procedure TForm1.paste_bufExecute(Sender: TObject);
begin
      main_str := Clipboard.AsText;
      main_float := strtofloat(main_str);
      res_scr.caption := main_str;
      pressed := true;
      pressed_eq := false;
      if temp_scr.caption = '' then begin
         temp_float := 0;
         temp_str := '';
         last_float := 0;
         last_sign := '';
      end;
end;

procedure TForm1.percent_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
  if pressed_eq = false then begin
     //убрать комментарий для имитации windows (3,+,3,=,% res = 0.36)
    if pressed { and (main_str <> '')}  then begin
      main_float := temp_float/100*main_float;
      main_str := floattostr(main_float);
      res_scr.caption := main_str;
      if main_str = '0' then main_str := '';
    end else
      main_float := temp_float/100*temp_float;
      main_str := floattostr(main_float);
      res_scr.caption := main_str;
      if main_str = '0' then main_str := '';
      pressed := true

  end else begin
      main_float := 0;
      main_str := '';
      res_scr.caption := '0';
      pressed := true
  end;
  except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.plusExecute(Sender: TObject);
begin
   plus_but.Click;
end;

procedure TForm1.plus_butClick(Sender: TObject);
begin
  temp_scr.caption := floattostr(temp_float);
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
  if pressed then
     begin

       case sign_scr.caption of
       '+' :
        begin
           temp_float += main_float;

           temp_str := floattostr(temp_float);
           temp_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '+';
           main_str:='';
           main_float:= 0;
           res_scr.caption := temp_scr.caption;
           pressed := false;
        end;
      '' :
        begin
           if (main_str = '') and (res_scr.caption <> '0') and (temp_scr.caption <> '') then else
           temp_float := main_float;

           temp_str := floattostr(temp_float);
           temp_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '+';
           main_str:='';
           main_float:= 0;
           res_scr.caption := temp_scr.caption;
           pressed := false;
        end;
       '-' :
        begin
            temp_float -= main_float;

            temp_str := floattostr(temp_float);
            temp_scr.caption := temp_str;
            last_sign := sign_scr.caption; sign_scr.caption := '+';
            main_str:='';
            main_float:= 0;
            res_scr.caption := temp_scr.caption;
            pressed := false;
        end;
       '÷' :
         begin
             temp_float /= main_float;

             temp_str := floattostr(temp_float);
             temp_scr.caption := temp_str;
             last_sign := sign_scr.caption; sign_scr.caption := '+';
             main_str:='';
             main_float:= 0;
             res_scr.caption := temp_scr.caption;
             pressed := false;
         end;
       '×' :
         begin
             temp_float *= main_float;

             temp_str := floattostr(temp_float);
             temp_scr.caption := temp_str;
             last_sign := sign_scr.caption; sign_scr.caption := '+';
             main_str:='';
             main_float:= 0;
             res_scr.caption := temp_scr.caption;
             pressed := false;
         end;
      end;

     end else begin
         last_sign := sign_scr.caption; sign_scr.caption := '+';
       end;
      except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.minus_butClick(Sender: TObject);
begin
  temp_scr.caption := floattostr(temp_float);
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
  if pressed then
     begin

       case sign_scr.caption of
       '+' :
        begin
           temp_float += main_float;

           temp_str := floattostr(temp_float);
           temp_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '-';
           main_str:='';
           main_float:= 0;
           res_scr.caption := temp_scr.caption;
           pressed := false;
        end;
      '' :
        begin
            if (main_str = '') and (res_scr.caption <> '0') and (temp_scr.caption <> '') then else
           temp_float := main_float;

           temp_str := floattostr(temp_float);
           temp_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '-';
           main_str:='';
           main_float:= 0;
           res_scr.caption := temp_scr.caption;
           pressed := false;
        end;
       '-' :
        begin
            temp_float -= main_float;

            temp_str := floattostr(temp_float);
            temp_scr.caption := temp_str;
            last_sign := sign_scr.caption; sign_scr.caption := '-';
            main_str:='';
            main_float:= 0;
            res_scr.caption := temp_scr.caption;
            pressed := false;
        end;
       '÷' :
         begin
             temp_float /= main_float;

             temp_str := floattostr(temp_float);
             temp_scr.caption := temp_str;
             last_sign := sign_scr.caption; sign_scr.caption := '-';
             main_str:='';
             main_float:= 0;
             res_scr.caption := temp_scr.caption;
             pressed := false;
         end;
       '×' :
         begin
             temp_float *= main_float;

             temp_str := floattostr(temp_float);
             temp_scr.caption := temp_str;
             last_sign := sign_scr.caption; sign_scr.caption := '-';
             main_str:='';
             main_float:= 0;
             res_scr.caption := temp_scr.caption;
             pressed := false;
         end;
      end;

     end else begin
         last_sign := sign_scr.caption; sign_scr.caption := '-';
       end;
      except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.multi_butClick(Sender: TObject);
begin
  temp_scr.caption := floattostr(temp_float);
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
  if pressed then
     begin

       case sign_scr.caption of
       '+' :
        begin
           temp_float += main_float;

           temp_str := floattostr(temp_float);
           temp_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '×';
           main_str:='';
           main_float:= 0;
           res_scr.caption := temp_scr.caption;
           pressed := false;
        end;
      '' :
        begin
            if (main_str = '') and (res_scr.caption <> '0') and (temp_scr.caption <> '') then else
           temp_float := main_float;

           temp_str := floattostr(temp_float);
           temp_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '×';
           main_str:='';
           main_float:= 0;
           res_scr.caption := temp_scr.caption;
           pressed := false;
        end;
       '-' :
        begin
            temp_float -= main_float;

            temp_str := floattostr(temp_float);
            temp_scr.caption := temp_str;
            last_sign := sign_scr.caption; sign_scr.caption := '×';
            main_str:='';
            main_float:= 0;
            res_scr.caption := temp_scr.caption;
            pressed := false;
        end;
       '÷' :
         begin
             temp_float /= main_float;

             temp_str := floattostr(temp_float);
             temp_scr.caption := temp_str;
             last_sign := sign_scr.caption; sign_scr.caption := '×';
             main_str:='';
             main_float:= 0;
             res_scr.caption := temp_scr.caption;
             pressed := false;
         end;
       '×' :
         begin
             temp_float *= main_float;

             temp_str := floattostr(temp_float);
             temp_scr.caption := temp_str;
             last_sign := sign_scr.caption; sign_scr.caption := '×';
             main_str:='';
             main_float:= 0;
             res_scr.caption := temp_scr.caption;
             pressed := false;
         end;
      end;

     end else begin
         last_sign := sign_scr.caption; sign_scr.caption := '×';
       end;
      except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.div_butClick(Sender: TObject);
begin
  temp_scr.caption := floattostr(temp_float);
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
    if pressed then
     begin

       case sign_scr.caption of
       '+' :
        begin
           temp_float += main_float;

           temp_str := floattostr(temp_float);
           temp_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '÷';
           main_str:='';
           main_float:= 0;
           res_scr.caption := temp_scr.caption;
           pressed := false;
        end;
      '' :
        begin
            if (main_str = '') and (res_scr.caption <> '0') and (temp_scr.caption <> '') then else
           temp_float := main_float;

           temp_str := floattostr(temp_float);
           temp_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '÷';
           main_str:='';
           main_float:= 0;
           res_scr.caption := temp_scr.caption;
           pressed := false;
        end;
       '-' :
        begin
            temp_float -= main_float;

            temp_str := floattostr(temp_float);
            temp_scr.caption := temp_str;
            last_sign := sign_scr.caption; sign_scr.caption := '÷';
            main_str:='';
            main_float:= 0;
            res_scr.caption := temp_scr.caption;
            pressed := false;
        end;
       '÷' :
         begin
             temp_float /= main_float;

             temp_str := floattostr(temp_float);
             temp_scr.caption := temp_str;
             last_sign := sign_scr.caption; sign_scr.caption := '÷';
             main_str:='';
             main_float:= 0;
             res_scr.caption := temp_scr.caption;
             pressed := false;
         end;
       '×' :
         begin
             temp_float *= main_float;

             temp_str := floattostr(temp_float);
             temp_scr.caption := temp_str;
             last_sign := sign_scr.caption; sign_scr.caption := '÷';
             main_str:='';
             main_float:= 0;
             res_scr.caption := temp_scr.caption;
             pressed := false;
         end;
      end;

     end else begin
         last_sign := sign_scr.caption; sign_scr.caption := '÷';
       end;
      except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.reverse_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
    if pressed and (main_str <> '') then begin
    main_float := 1/main_float;
    main_str := floattostr(main_float);
    res_scr.caption :=main_str;
    if main_str = '0' then main_str := '';
  end else
    main_float := 1/temp_float;
    main_str := floattostr(main_float);
    res_scr.caption :=main_str;
    if main_str = '0' then main_str := '';
    pressed := true;
     except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.sevenExecute(Sender: TObject);
begin
  seven_but.Click;
end;

procedure TForm1.mm_butClick(Sender: TObject);
begin
  try
   if pressed and (main_str <> '')  then begin
    m_scr.caption := 'M';
    mem -= main_float;
  end else begin
    m_scr.caption := 'M';
    mem -= temp_float;
  end;
   except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.mp_butClick(Sender: TObject);
begin
  try
  if pressed and (main_str <> '') then begin
    m_scr.caption := 'M';
    mem += main_float;
  end else begin
    m_scr.caption := 'M';
    mem += temp_float;
  end;
   except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.mr_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
  if m_scr.caption <> '' then begin
    main_float := mem;
    main_str := floattostr(main_float);
    res_scr.caption := main_str;
    if main_str = '0' then main_str := '';
    pressed := true;
  end;
   except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.ms_butClick(Sender: TObject);
begin
  try
   if pressed and (main_str <> '')  then begin
    m_scr.caption := 'M';
    mem := main_float;
  end else begin
    m_scr.caption := 'M';
    mem := temp_float;
  end;
   except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.multiplyExecute(Sender: TObject);
begin
  multi_but.Click;
end;

procedure TForm1.seven_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0)))  and (e_flag = false) then begin
  main_str:= main_str + '7';
  main_float :=  StrToFloat(main_str);
  res_scr.caption := main_str;
  pressed := true;
  end;
  e_flag := false;
end;

procedure TForm1.sixExecute(Sender: TObject);
begin
  six_but.Click;
end;

procedure TForm1.five_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0)))  and (e_flag = false) then begin
  main_str:= main_str + '5';
  main_float :=  StrToFloat(main_str);
  res_scr.caption := main_str;
  pressed := true;
  end;
  e_flag := false;
end;

procedure TForm1.fourExecute(Sender: TObject);
begin
  four_but.Click;
end;

procedure TForm1.eight_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0)))  and (e_flag = false) then begin
  main_str:= main_str + '8';
  main_float :=  StrToFloat(main_str);
  res_scr.caption := main_str;
  pressed := true;
  end;
  e_flag := false;
end;

procedure TForm1.eq_butClick(Sender: TObject);
begin
  try

       case sign_scr.caption of
       '+' :
        begin
          if pressed and (main_str <> '')  then begin
             temp_float += main_float; last_float := main_float;
           end else begin
             last_float := temp_float; temp_float += temp_float;
           end;
           temp_str := floattostr(temp_float);
           res_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '';
           temp_scr.caption := '';
           main_str:='';
           main_float:= 0;
           pressed := true;
        end;
      '' :
        begin if pressed_eq then begin
                  case last_sign of
              '+' :
               begin
                  temp_float += last_float;
                  temp_str := floattostr(temp_float);
                  res_scr.caption := temp_str;
                  main_str:='';
                  main_float:= 0;
                  pressed := false;

               end;
              '-' :
               begin
                  temp_float -= last_float;
                   temp_str := floattostr(temp_float);
                   res_scr.caption := temp_str;
                   main_str:='';
                   main_float:= 0;
                   pressed := false;

               end;
              '÷' :
                begin
                    temp_float /= last_float;
                    temp_str := floattostr(temp_float);
                    res_scr.caption := temp_str;
                    main_str:='';
                    main_float:= 0;
                    pressed := false;

                end;
              '×' :
                begin
                    temp_float *= last_float;
                    temp_str := floattostr(temp_float);
                    res_scr.caption := temp_str;
                    main_str:='';
                    main_float:= 0;
                    pressed := false;

                end;
             end;
           end;
        end;
       '-' :
        begin
          if pressed and (main_str <> '')  then begin
             temp_float -= main_float; last_float := main_float;
           end else begin
             last_float := temp_float; temp_float -= temp_float;
           end;
           temp_str := floattostr(temp_float);
           res_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '';
           temp_scr.caption := '';
           main_str:='';
           main_float:= 0;
           pressed := true;
        end;
       '÷' :
         begin
          if pressed and (main_str <> '')  then begin
             temp_float /= main_float; last_float := main_float;
           end else begin
             last_float := temp_float; temp_float /= temp_float;
           end;
           temp_str := floattostr(temp_float);
           res_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '';
           temp_scr.caption := '';
           main_str:='';
           main_float:= 0;
           pressed := true;
        end;
       '×' :
         begin
           if pressed and (main_str <> '')  then begin
             temp_float *= main_float; last_float := main_float;
           end else begin
             last_float := temp_float; temp_float *= temp_float;
           end;
           temp_str := floattostr(temp_float);
           res_scr.caption := temp_str;
           last_sign := sign_scr.caption; sign_scr.caption := '';
           temp_scr.caption := '';
           main_str:='';
           main_float:= 0;
           pressed := true;
        end;
      end;

     except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
            pressed_eq := true;
end;

procedure TForm1.Backspace_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 17) and (main_str = res_scr.caption))  and (e_flag = false) then begin
  if ((length(main_str) = 2) and (main_float <= 0)) or ((length(main_str) < 2) and (main_float >= 0)) then
     begin
      main_str := '';
      main_float := 0;
      res_scr.caption := '0';
  end
  else
  begin
        delete(main_str,length(main_str),1) ;
        main_float :=  StrToFloat(main_str);
        res_scr.caption := main_str;
     end;

  end;
  e_flag := false;
end;

procedure TForm1.eqExecute(Sender: TObject);
begin
  eq_but.Click;
end;

procedure TForm1.div_but_captExecute(Sender: TObject);
begin
   div_but.Click;
end;

procedure TForm1.backspace_captExecute(Sender: TObject);
begin
  backspace_but.Click;
end;

procedure TForm1.fiveExecute(Sender: TObject);
begin
  five_but.Click;
end;

procedure TForm1.eightExecute(Sender: TObject);
begin
  eight_but.Click;
end;

procedure TForm1.copy_bufExecute(Sender: TObject);
begin
  if pressed and (main_str <> '') then
      Clipboard.AsText := main_str
  else
      Clipboard.AsText := temp_str
end;

procedure TForm1.ce_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
     main_str := '';
     main_float := 0;
     res_scr.caption := '0';

       pressed := true;
end;

procedure TForm1.c_butClick(Sender: TObject);
begin
     pressed_eq := false;  last_sign := '' ; last_float := 0;
     last_sign := sign_scr.caption; sign_scr.caption := '';
     main_str := '';
     main_float := 0;
     res_scr.caption := '0';
     temp_str := '';
     temp_float := 0;
     temp_scr.caption := '';
     pressed := true;
     e_flag :=false;
end;

procedure TForm1.four_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0)))  and (e_flag = false)  then begin
  main_str:= main_str + '4';
  main_float :=  StrToFloat(main_str);
  res_scr.caption := main_str;
  pressed := true;
  end;
  e_flag := false;
end;

procedure TForm1.mc_butClick(Sender: TObject);
begin
  m_scr.caption := '';
  mem := 0;
end;

procedure TForm1.minusExecute(Sender: TObject);
begin
  minus_but.Click;
end;

procedure TForm1.neg_butClick(Sender: TObject);
var null_count:integer;
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
  null_count := 0;
  zap_flag := false;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = ',') then zap_flag := true;
    if (main_str[i] = '0') and (zap_flag = true) then null_count +=1;
    if (main_str[i] <>'0') then null_count :=0;
  end;

  if (res_scr.caption <> '0') then begin
  if (main_float = 0) then begin
  main_float :=  temp_float * (-1);
  main_str := floattostr(main_float);
  res_scr.caption := main_str;
    pressed := true;
  end
  else begin
  main_float :=  main_float * (-1);
  main_str := floattostr(main_float);
  res_scr.caption := main_str;
    pressed := true;
  end;
  if zap_flag then begin
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if (e_flag = false) then begin
  comma_butClick(Sender);
  for i:= 1 to null_count do begin
     main_str:= main_str + '0';
     main_float :=  StrToFloat(main_str);
     res_scr.caption := main_str;
     end;

  end;
  end;
  end;
   zap_flag := false;
  e_flag := false;
   except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.nien_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0))) and (e_flag = false) then begin
  main_str:= main_str + '9';
  main_float :=  StrToFloat(main_str);
  res_scr.caption := main_str;
  pressed := true;
  end;
  e_flag := false;
end;

procedure TForm1.nineExecute(Sender: TObject);
begin
  nien_but.Click;
end;

procedure TForm1.oneExecute(Sender: TObject);
begin
  one_but.Click;
end;

procedure TForm1.six_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0))) and (e_flag = false) then begin
  main_str:= main_str + '6';
  main_float :=  StrToFloat(main_str);
  res_scr.caption := main_str;
  pressed := true;
  end;
  e_flag := false;
end;

procedure TForm1.sqrt_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
  if pressed and (main_str <> '')  then begin
    main_float := sqrt(main_float);
    main_str := floattostr(main_float);
    res_scr.caption :=main_str;
    if main_str = '0' then main_str := '';
  end else
    main_float := sqrt(temp_float);
    main_str := floattostr(main_float);
    res_scr.caption :=main_str;
    if main_str = '0' then main_str := '';
    pressed := true
     except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.sq_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
   if pressed and (main_str <> '')  then begin
    main_float := sqr(main_float);
    main_str := floattostr(main_float);
    res_scr.caption :=main_str;
    if main_str = '0' then main_str := '';
  end else
    main_float := sqr(temp_float);
    main_str := floattostr(main_float);
    res_scr.caption :=main_str;
    if main_str = '0' then main_str := '';
    pressed := true;
     except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.threeExecute(Sender: TObject);
begin
  three_but.Click;
end;

procedure TForm1.three_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0))) and (e_flag = false) then begin
  main_str:= main_str + '3';
  main_float :=  StrToFloat(main_str);
  res_scr.caption := main_str;
  pressed := true;
  end;
  e_flag := false;
end;

procedure TForm1.twoExecute(Sender: TObject);
begin
  two_but.Click;
end;

procedure TForm1.two_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0))) and (e_flag = false) then begin
  main_str:= main_str + '2';
  main_float :=  StrToFloat(main_str);
  res_scr.caption := main_str;
  pressed := true;
  end;
  e_flag := false;
end;

procedure TForm1.commaExecute(Sender: TObject);
begin
  comma_but.Click;
end;

procedure TForm1.comma_butClick(Sender: TObject);
var zap_fl:boolean;
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  try
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  zap_fl := false;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = ',') then zap_fl := true;
  end;
  if (zap_fl = false) and (e_flag = false) then begin
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0))) and (length(main_str) > 0) and (main_str[length(main_str)] <> ',') then begin
  main_str:= main_str + ',';
  res_scr.caption := main_str;
  pressed := true;
  end else if length(main_str) = 0 then
     main_str := '0,';
     res_scr.caption := main_str;
     pressed := true;
  end;
  e_flag := false;
   except
    on E : Exception do begin
      res_scr.caption := ' Error : '+E.Message;
      temp_scr.caption := '';
      last_sign := sign_scr.caption; sign_scr.caption := '';
      temp_float := 0;
      temp_str := '';
    end;
  end;
end;

procedure TForm1.zeroExecute(Sender: TObject);
begin
  zero_but.Click;
end;

procedure TForm1.zero_butClick(Sender: TObject);
begin
  pressed_eq := false;  last_sign := '' ; last_float := 0;
  for i := 1 to length(main_str) do begin
    if (main_str[i] = 'E') then e_flag := true;
  end;
  if ((length(main_str) < 15) or ((length(main_str) < 16) and (main_float < 0))) and (e_flag = false) then begin
  if (main_str <> '0') and (main_str <> '') then begin
     main_str:= main_str + '0';
     main_float :=  StrToFloat(main_str);
     res_scr.caption := main_str;
  end else if (main_float = 0) and (res_scr.caption <> '0') then begin
     main_str:= '0';
     res_scr.caption := main_str;
   end;
  pressed := true;
    end;
  e_flag := false;
end;

    begin
      pressed := true;
    end.
end.

