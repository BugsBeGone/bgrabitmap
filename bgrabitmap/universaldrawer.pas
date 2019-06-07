unit UniversalDrawer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BGRABitmapTypes, BGRAGraphics, BGRAPen, BGRAArrow;

type

  { TUniversalDrawer }

  TUniversalDrawer = class(TCustomUniversalDrawer)
    class function CheckRectBounds(var x,y,x2,y2: integer; minsize: integer): boolean;

    {** Draws an aliased line from (x1,y1) to (x2,y2) using Bresenham's algorithm.
        ''DrawLastPixel'' specifies if (x2,y2) must be drawn. }
    class procedure DrawLine(ADest: TCustomUniversalBitmap; x1, y1, x2, y2: integer; const ABrush: TUniversalBrush; DrawLastPixel: boolean; AAlpha: Word = 65535); override;
    {** Draws an antialiased line from (x1,y1) to (x2,y2) using an improved version of Bresenham's algorithm
        ''c'' specifies the color. ''DrawLastPixel'' specifies if (x2,y2) must be drawn }
    class procedure DrawLineAntialias(ADest: TCustomUniversalBitmap; x1, y1, x2, y2: integer; const ABrush: TUniversalBrush; DrawLastPixel: boolean; AAlpha: Word = 65535); overload; override;
    {** Draws an antialiased line with two colors ''c1'' and ''c2'' as dashes of length ''dashLen''.
        ''DashPos'' can be used to specify the start dash position and to retrieve the dash position at the end
        of the line, in order to draw a polyline with consistent dashes }
    class procedure DrawLineAntialias(ADest: TCustomUniversalBitmap; x1, y1, x2, y2: integer; const ABrush1, ABrush2: TUniversalBrush; ADashLen: integer; var DashPos: integer; DrawLastPixel: boolean; AAlpha: Word = 65535); override;

    class procedure DrawPolyLine(ADest: TCustomUniversalBitmap; const points: array of TPoint; const ABrush: TUniversalBrush; DrawLastPixel: boolean; AAlpha: Word = 65535); override;
    class procedure DrawPolyLineAntialias(ADest: TCustomUniversalBitmap; const points: array of TPoint; const ABrush: TUniversalBrush; DrawLastPixel: boolean; AAlpha: Word = 65535); overload; override;
    class procedure DrawPolyLineAntialias(ADest: TCustomUniversalBitmap; const points: array of TPoint; const ABrush1, ABrush2: TUniversalBrush; ADashLen: integer; DrawLastPixel: boolean; AAlpha: Word = 65535); overload; override;

    class procedure DrawPolygon(ADest: TCustomUniversalBitmap; const points: array of TPoint; const ABrush: TUniversalBrush; AAlpha: Word = 65535); override;
    class procedure DrawPolygonAntialias(ADest: TCustomUniversalBitmap; const points: array of TPoint; const ABrush: TUniversalBrush; AAlpha: Word = 65535); overload; override;
    class procedure DrawPolygonAntialias(ADest: TCustomUniversalBitmap; const points: array of TPoint; const ABrush1, ABrush2: TUniversalBrush; ADashLen: integer; AAlpha: Word = 65535); overload; override;

    {** Draw the border of a rectangle }
    class procedure Rectangle(ADest: TCustomUniversalBitmap; x, y, x2, y2: integer; const ABrush: TUniversalBrush; AAlpha: Word = 65535); overload; override;
    {** Draw a filled rectangle with a border }
    class procedure Rectangle(ADest: TCustomUniversalBitmap; x, y, x2, y2: integer; const ABorderBrush, AFillBrush: TUniversalBrush; AAlpha: Word = 65535); overload; override;

    class procedure RoundRect(ADest: TCustomUniversalBitmap; X1, Y1, X2, Y2: integer; DX, DY: integer; const ABorderBrush, AFillBrush: TUniversalBrush; AAlpha: Word = 65535); overload; override;
    class procedure RoundRect(ADest: TCustomUniversalBitmap; X1, Y1, X2, Y2: integer; DX, DY: integer; const ABorderBrush: TUniversalBrush; AAlpha: Word = 65535); overload; override;
    class procedure FillRoundRect(ADest: TCustomUniversalBitmap; X1, Y1, X2, Y2: integer; DX, DY: integer; const AFillBrush: TUniversalBrush; AAlpha: Word = 65535); override;

    class procedure FillShape(ADest: TCustomUniversalBitmap; AShape: TBGRACustomFillInfo; AFillMode: TFillMode; ABrush: TUniversalBrush; AAlpha: Word = 65535); override;
    class procedure FillPoly(ADest: TCustomUniversalBitmap; const APoints: array of TPointF; AFillMode: TFillMode; ABrush: TUniversalBrush; APixelCenteredCoordinates: boolean = true; AAlpha: Word = 65535); override;

    // using pen
    class function CreatePenStroker: TBGRACustomPenStroker; override;
    class function CreateArrow: TBGRACustomArrow; override;

    class procedure Ellipse(ADest: TCustomUniversalBitmap; APen: TBGRACustomPenStroker; x, y, rx, ry: single;
        const ABrush: TUniversalBrush; AWidth: single; AAlpha: Word=65535); overload; override;
    class procedure Ellipse(ADest: TCustomUniversalBitmap; APen: TBGRACustomPenStroker; const AOrigin, AXAxis, AYAxis: TPointF;
        const ABrush: TUniversalBrush; AWidth: single; AAlpha: Word=65535); overload; override;
    class procedure EllipseAntialias(ADest: TCustomUniversalBitmap; APen: TBGRACustomPenStroker; x, y, rx, ry: single;
        const ABrush: TUniversalBrush; AWidth: single); overload; override;
    class procedure EllipseAntialias(ADest: TCustomUniversalBitmap; APen: TBGRACustomPenStroker; const AOrigin, AXAxis, AYAxis: TPointF;
        const ABrush: TUniversalBrush; AWidth: single); overload; override;

    class procedure FillRectAntialias(ADest: TCustomUniversalBitmap;
                    x, y, x2, y2: single; const ABrush: TUniversalBrush;
                    APixelCenteredCoordinates: boolean = true); override;
    class procedure FillShapeAntialias(ADest: TCustomUniversalBitmap;
                    AShape: TBGRACustomFillInfo; AFillMode: TFillMode;
                    ABrush: TUniversalBrush); override;
    class procedure FillPolyAntialias(ADest: TCustomUniversalBitmap;
                    const APoints: array of TPointF; AFillMode: TFillMode;
                    ABrush: TUniversalBrush; APixelCenteredCoordinates: boolean); override;
    class procedure FillEllipseAntialias(ADest: TCustomUniversalBitmap;
                    x, y, rx, ry: single; const ABrush: TUniversalBrush); overload; override;
    class procedure FillEllipseAntialias(ADest: TCustomUniversalBitmap;
                    const AOrigin, AXAxis, AYAxis: TPointF; const ABrush: TUniversalBrush); overload; override;

  end;

implementation

uses BGRAPolygon, BGRAPolygonAliased, BGRAPath, BGRAFillInfo;

{ TUniversalDrawer }

class function TUniversalDrawer.CheckRectBounds(
  var x, y, x2, y2: integer; minsize: integer): boolean;
var
  temp: integer;
begin
  //swap coordinates if needed
  if (x > x2) then
  begin
    temp := x;
    x    := x2;
    x2   := temp;
  end;
  if (y > y2) then
  begin
    temp := y;
    y    := y2;
    y2   := temp;
  end;
  result := (x2 - x > minsize) and (y2 - y > minsize);
end;

class procedure TUniversalDrawer.DrawLine(ADest: TCustomUniversalBitmap; x1,
  y1, x2, y2: integer; const ABrush: TUniversalBrush; DrawLastPixel: boolean;
  AAlpha: Word);
type
  TDrawPixelProc = procedure(x,y: Int32or64; const ABrush: TUniversalBrush; AAlpha: Word = 65535) of object;
var
  Y, X: integer;
  DX, DY, SX, SY, E: integer;
  drawPixelProc: TDrawPixelProc;
begin
  if ABrush.DoesNothing or (AAlpha= 0) then exit;
  if (Y1 = Y2) then
  begin
    if (X1 = X2) then
    begin
      if DrawLastPixel then ADest.DrawPixel(X1, Y1, ABrush, AAlpha);
    end else
    begin
      if not DrawLastPixel then
      begin
        if X2 > X1 then dec(X2) else inc(X2);
      end;
      ADest.HorizLine(X1,Y1,X2, ABrush, AAlpha);
    end;
    Exit;
  end else
  if (X1 = X2) then
  begin
    if not DrawLastPixel then
    begin
      if Y2 > Y1 then dec(Y2) else inc(Y2);
    end;
    ADest.VertLine(X1,Y1,Y2, ABrush, AAlpha);
    Exit;
  end;

  DX := X2 - X1;
  DY := Y2 - Y1;

  if DX < 0 then
  begin
    SX := -1;
    DX := -DX;
  end
  else SX := 1;

  if DY < 0 then
  begin
    SY := -1;
    DY := -DY;
  end
  else SY := 1;

  DX := DX shl 1;
  DY := DY shl 1;

  drawPixelProc := @ADest.DrawPixel;
  X := X1;
  Y := Y1;
  if DX > DY then
  begin
    E := DY - DX shr 1;

    while X <> X2 do
    begin
      drawPixelProc(X, Y, ABrush, AAlpha);
      if E >= 0 then
      begin
        Inc(Y, SY);
        Dec(E, DX);
      end;
      Inc(X, SX);
      Inc(E, DY);
    end;
  end
  else
  begin
    E := DX - DY shr 1;

    while Y <> Y2 do
    begin
      drawPixelProc(X, Y, ABrush, AAlpha);
      if E >= 0 then
      begin
        Inc(X, SX);
        Dec(E, DY);
      end;
      Inc(Y, SY);
      Inc(E, DX);
    end;
  end;

  if DrawLastPixel then
    drawPixelProc(X2, Y2, ABrush, AAlpha);
end;

class procedure TUniversalDrawer.DrawLineAntialias(ADest: TCustomUniversalBitmap;
  x1, y1, x2, y2: integer; const ABrush: TUniversalBrush;
  DrawLastPixel: boolean; AAlpha: Word = 65535);
var
  Y, X:  integer;
  DX, DY, SX, SY, E: integer;
  curAlpha: Word;
begin
  if ABrush.DoesNothing or (AAlpha= 0) then exit;
  if (Y1 = Y2) and (X1 = X2) then
  begin
    if DrawLastPixel then
      ADest.DrawPixel(X1, Y1, ABrush, AAlpha);
    Exit;
  end;

  DX := X2 - X1;
  DY := Y2 - Y1;

  if DX < 0 then
  begin
    SX := -1;
    DX := -DX;
  end
  else
    SX := 1;

  if DY < 0 then
  begin
    SY := -1;
    DY := -DY;
  end
  else
    SY := 1;

  DX := DX shl 1;
  DY := DY shl 1;

  X := X1;
  Y := Y1;

  if DX > DY then
  begin
    E := 0;

    while X <> X2 do
    begin
      curAlpha := AAlpha * E div DX;
      ADest.DrawPixel(X, Y, ABrush, AAlpha - curAlpha);
      ADest.DrawPixel(X, Y + SY, ABrush, curAlpha);
      Inc(E, DY);
      if E >= DX then
      begin
        Inc(Y, SY);
        Dec(E, DX);
      end;
      Inc(X, SX);
    end;
  end
  else
  begin
    E := 0;

    while Y <> Y2 do
    begin
      curAlpha := AAlpha * E div DY;
      ADest.DrawPixel(X, Y, ABrush, AAlpha - curAlpha);
      ADest.DrawPixel(X + SX, Y, ABrush, curAlpha);
      Inc(E, DX);
      if E >= DY then
      begin
        Inc(X, SX);
        Dec(E, DY);
      end;
      Inc(Y, SY);
    end;
  end;
  if DrawLastPixel then
    ADest.DrawPixel(X2, Y2, ABrush, AAlpha);
end;

class procedure TUniversalDrawer.DrawLineAntialias(ADest: TCustomUniversalBitmap;
  x1, y1, x2, y2: integer; const ABrush1, ABrush2: TUniversalBrush;
  ADashLen: integer; var DashPos: integer; DrawLastPixel: boolean;
  AAlpha: Word = 65535);
var
  Y, X:  integer;
  DX, DY, SX, SY, E: integer;
  curAlpha: Word;
  curBrush: PUniversalBrush;
begin
  if (ABrush1.DoesNothing and ABrush2.DoesNothing) and (AAlpha= 0) then exit;
  if ADashLen<=0 then ADashLen := 1;

  DashPos := PositiveMod(DashPos,ADashLen+ADashLen);
  if DashPos < ADashLen then
  curBrush := @ABrush1
  else curBrush := @ABrush2;

  if (Y1 = Y2) and (X1 = X2) then
  begin
    if DrawLastPixel then
      ADest.DrawPixel(X1, Y1, curBrush^, AAlpha);
    Exit;
  end;

  DX := X2 - X1;
  DY := Y2 - Y1;

  if DX < 0 then
  begin
    SX := -1;
    DX := -DX;
  end
  else
    SX := 1;

  if DY < 0 then
  begin
    SY := -1;
    DY := -DY;
  end
  else
    SY := 1;

  DX := DX shl 1;
  DY := DY shl 1;

  X := X1;
  Y := Y1;

  if DX > DY then
  begin
    E := 0;

    while X <> X2 do
    begin
      curAlpha := AAlpha * E div DX;
      ADest.DrawPixel(X, Y, curBrush^, AAlpha - curAlpha);
      ADest.DrawPixel(X, Y + SY, curBrush^, curAlpha);
      Inc(E, DY);
      if E >= DX then
      begin
        Inc(Y, SY);
        Dec(E, DX);
      end;
      Inc(X, SX);

      Inc(DashPos);
      if DashPos = ADashLen then
        curBrush := @ABrush2
      else
      if DashPos = ADashLen + ADashLen then
      begin
        curBrush := @ABrush1;
        DashPos := 0;
      end;
    end;
  end
  else
  begin
    E := 0;

    while Y <> Y2 do
    begin
      curAlpha := AAlpha * E div DY;
      ADest.DrawPixel(X, Y, curBrush^, AAlpha - curAlpha);
      ADest.DrawPixel(X + SX, Y, curBrush^, curAlpha);
      Inc(E, DX);
      if E >= DY then
      begin
        Inc(X, SX);
        Dec(E, DY);
      end;
      Inc(Y, SY);

      Inc(DashPos);
      if DashPos = ADashLen then
        curBrush := @ABrush2
      else
      if DashPos = ADashLen + ADashLen then
      begin
        curBrush := @ABrush1;
        DashPos := 0;
      end;
    end;
  end;
  if DrawLastPixel then
  begin
    ADest.DrawPixel(X2, Y2, curBrush^, AAlpha);
    inc(DashPos);
    if DashPos = ADashLen + ADashLen then DashPos := 0;
  end;
end;

class procedure TUniversalDrawer.DrawPolyLine(ADest: TCustomUniversalBitmap;
  const points: array of TPoint; const ABrush: TUniversalBrush;
  DrawLastPixel: boolean; AAlpha: Word);
var i,start: integer;
begin
  if ABrush.DoesNothing then exit;
  start := 0;
  for i := 0 to high(points) do
  if IsEmptyPoint(points[i]) then start := i+1 else
  begin
    if (i = high(points)) or IsEmptyPoint(points[i+1]) then
    begin
      if (i = start) and DrawLastPixel then ADest.DrawPixel(points[i].x,points[i].y, ABrush,AAlpha);
    end else
      DrawLine(ADest, points[i].x,points[i].Y,points[i+1].x,points[i+1].y, ABrush,
        DrawLastPixel and ((i=high(points)-1) or IsEmptyPoint(points[i+2])), AAlpha);
  end;
end;

class procedure TUniversalDrawer.DrawPolyLineAntialias(
  ADest: TCustomUniversalBitmap; const points: array of TPoint;
  const ABrush: TUniversalBrush; DrawLastPixel: boolean; AAlpha: Word);
var i,start: integer;
begin
  if ABrush.DoesNothing then exit;
  start := 0;
  for i := 0 to high(points) do
  if IsEmptyPoint(points[i]) then start := i+1 else
  begin
    if (i = high(points)) or IsEmptyPoint(points[i+1]) then
    begin
      if (i = start) and DrawLastPixel then ADest.DrawPixel(points[i].x,points[i].y, ABrush,AAlpha);
    end else
      DrawLineAntialias(ADest, points[i].x,points[i].Y,points[i+1].x,points[i+1].y, ABrush,
        DrawLastPixel and ((i=high(points)-1) or IsEmptyPoint(points[i+2])), AAlpha);
  end;
end;

class procedure TUniversalDrawer.DrawPolyLineAntialias(
  ADest: TCustomUniversalBitmap; const points: array of TPoint; const ABrush1,
  ABrush2: TUniversalBrush; ADashLen: integer; DrawLastPixel: boolean;
  AAlpha: Word);
var i,start, dashPos: integer;
begin
  if ABrush1.DoesNothing and ABrush2.DoesNothing then exit;
  start := 0;
  dashPos := 0;
  for i := 0 to high(points) do
  if IsEmptyPoint(points[i]) then start := i+1 else
  begin
    if (i = high(points)) or IsEmptyPoint(points[i+1]) then
    begin
      if (i = start) and DrawLastPixel then
      begin
        if dashPos < ADashLen then
          ADest.DrawPixel(points[i].x,points[i].y, ABrush1,AAlpha)
        else
          ADest.DrawPixel(points[i].x,points[i].y, ABrush2,AAlpha);
        inc(dashPos);
        if dashPos = ADashLen*2 then dashPos := 0;
      end;
    end else
      DrawLineAntialias(ADest, points[i].x,points[i].Y,points[i+1].x,points[i+1].y,
        ABrush1,ABrush2,ADashLen,dashPos,
        DrawLastPixel and ((i=high(points)-1) or IsEmptyPoint(points[i+2])), AAlpha);
  end;
end;

class procedure TUniversalDrawer.DrawPolygon(ADest: TCustomUniversalBitmap;
  const points: array of TPoint; const ABrush: TUniversalBrush; AAlpha: Word);
var i,start: integer;
begin
  if ABrush.DoesNothing then exit;
  start := 0;
  for i := 0 to high(points) do
  if IsEmptyPoint(points[i]) then start := i+1 else
  begin
    if (i = high(points)) or IsEmptyPoint(points[i+1]) then
    begin
      if i = start then ADest.DrawPixel(points[i].x,points[i].y, ABrush,AAlpha)
      else if (i > start) then
        DrawLine(ADest, points[i].x,points[i].Y,points[start].x,points[start].y, ABrush, false, AAlpha);
    end else
      DrawLine(ADest, points[i].x,points[i].Y,points[i+1].x,points[i+1].y, ABrush, false, AAlpha);
  end;
end;

class procedure TUniversalDrawer.DrawPolygonAntialias(
  ADest: TCustomUniversalBitmap; const points: array of TPoint;
  const ABrush: TUniversalBrush; AAlpha: Word);
var i,start: integer;
begin
  if ABrush.DoesNothing then exit;
  start := 0;
  for i := 0 to high(points) do
  if IsEmptyPoint(points[i]) then start := i+1 else
  begin
    if (i = high(points)) or IsEmptyPoint(points[i+1]) then
    begin
      if i = start then ADest.DrawPixel(points[i].x,points[i].y, ABrush,AAlpha)
      else if (i > start) then
        DrawLineAntialias(ADest, points[i].x,points[i].Y,points[start].x,points[start].y, ABrush, false, AAlpha);
    end else
      DrawLineAntialias(ADest, points[i].x,points[i].Y,points[i+1].x,points[i+1].y, ABrush, false, AAlpha);
  end;
end;

class procedure TUniversalDrawer.DrawPolygonAntialias(
  ADest: TCustomUniversalBitmap; const points: array of TPoint; const ABrush1,
  ABrush2: TUniversalBrush; ADashLen: integer; AAlpha: Word);
var i,start, dashPos: integer;
begin
  if ABrush1.DoesNothing and ABrush2.DoesNothing then exit;
  start := 0;
  dashPos := 0;
  for i := 0 to high(points) do
  if IsEmptyPoint(points[i]) then start := i+1 else
  begin
    if (i = high(points)) or IsEmptyPoint(points[i+1]) then
    begin
      if i = start then
      begin
        if dashPos < ADashLen then
          ADest.DrawPixel(points[i].x,points[i].y, ABrush1,AAlpha)
        else
          ADest.DrawPixel(points[i].x,points[i].y, ABrush2,AAlpha);
        inc(dashPos);
        if dashPos = ADashLen*2 then dashPos := 0;
      end
      else if (i > start) then
        DrawLineAntialias(ADest, points[i].x,points[i].Y,points[start].x,points[start].y,
                          ABrush1,ABrush2,ADashLen,dashPos, false, AAlpha);
    end else
      DrawLineAntialias(ADest, points[i].x,points[i].Y,points[i+1].x,points[i+1].y,
                        ABrush1,ABrush2,ADashLen,dashPos, false, AAlpha);
  end;
end;

class procedure TUniversalDrawer.Rectangle(ADest: TCustomUniversalBitmap; x, y, x2, y2: integer;
  const ABrush: TUniversalBrush; AAlpha: Word);
begin
  if not CheckRectBounds({%H-}x,{%H-}y,{%H-}x2,{%H-}y2,1) or ABrush.DoesNothing then exit;
  ADest.HorizLine(x, y, x2-1, ABrush, AAlpha);
  if y2-y > 2 then
  begin
    ADest.VertLine(x, y+1, y2-2, ABrush, AAlpha);
    ADest.VertLine(x2-1, y+1, y2-2, ABrush, AAlpha);
  end;
  ADest.HorizLine(x, y2-1, x2-1, ABrush, AAlpha);
end;

class procedure TUniversalDrawer.Rectangle(ADest: TCustomUniversalBitmap; x, y, x2, y2: integer;
  const ABorderBrush, AFillBrush: TUniversalBrush; AAlpha: Word);
begin
  if not CheckRectBounds({%H-}x,{%H-}y,{%H-}x2,{%H-}y2,1) then exit;
  Rectangle(ADest, x, y, x2, y2, ABorderBrush, AAlpha);
  ADest.FillRect(x+1, y+1, x2-1, y2-1, AFillBrush, AAlpha);
end;

class procedure TUniversalDrawer.RoundRect(ADest: TCustomUniversalBitmap; X1, Y1, X2, Y2: integer; DX, DY: integer;
  const ABorderBrush, AFillBrush: TUniversalBrush; AAlpha: Word);
begin
  BGRAPolygonAliased.BGRARoundRectAliased(ADest, X1,Y1,X2,Y2,DX,DY,ABorderBrush,AFillBrush,AAlpha);
end;

class procedure TUniversalDrawer.RoundRect(ADest: TCustomUniversalBitmap; X1, Y1, X2, Y2: integer; DX, DY: integer;
  const ABorderBrush: TUniversalBrush; AAlpha: Word);
begin
  BGRAPolygonAliased.BGRARoundRectAliased(ADest, X1,Y1,X2,Y2,DX,DY,ABorderBrush,ABorderBrush,AAlpha,false,true);
end;

class procedure TUniversalDrawer.FillRoundRect(ADest: TCustomUniversalBitmap; X1, Y1, X2, Y2: integer; DX,
  DY: integer; const AFillBrush: TUniversalBrush; AAlpha: Word);
begin
  BGRAPolygonAliased.BGRARoundRectAliased(ADest, X1,Y1,X2,Y2,DX,DY,AFillBrush,AFillBrush,AAlpha);
end;

class procedure TUniversalDrawer.FillShape(ADest: TCustomUniversalBitmap;
  AShape: TBGRACustomFillInfo; AFillMode: TFillMode; ABrush: TUniversalBrush;
  AAlpha: Word);
begin
  BGRAPolygon.FillShapeAliased(ADest, AShape, ABrush, AAlpha, AFillMode = fmWinding);
end;

class procedure TUniversalDrawer.FillPoly(ADest: TCustomUniversalBitmap;
  const APoints: array of TPointF; AFillMode: TFillMode;
  ABrush: TUniversalBrush; APixelCenteredCoordinates: boolean; AAlpha: Word);
begin
  BGRAPolygon.FillPolyAliased(ADest, APoints, ABrush, AAlpha, AFillMode = fmWinding, APixelCenteredCoordinates);
end;

class function TUniversalDrawer.CreatePenStroker: TBGRACustomPenStroker;
begin
  result := TBGRAPenStroker.Create;
end;

class function TUniversalDrawer.CreateArrow: TBGRACustomArrow;
begin
  result := TBGRAArrow.Create;
end;

class procedure TUniversalDrawer.Ellipse(ADest: TCustomUniversalBitmap;
  APen: TBGRACustomPenStroker; x, y,rx, ry: single;
  const ABrush: TUniversalBrush; AWidth: single; AAlpha: Word);
begin
  if (APen.Style = psClear) or (AWidth = 0) then exit;
  if (APen.Style = psSolid) then
    BGRAPolygon.BorderEllipse(ADest, x, y, rx, ry, AWidth, ABrush, AAlpha)
  else
  begin
    if ABrush.DoesNothing then exit;
    FillPoly(ADest, APen.ComputePolygon(BGRAPath.ComputeEllipse(x,y,rx,ry),AWidth),
             ADest.FillMode, ABrush, true, AAlpha);
  end;
end;

class procedure TUniversalDrawer.Ellipse(ADest: TCustomUniversalBitmap;
  APen: TBGRACustomPenStroker; const AOrigin, AXAxis, AYAxis: TPointF;
  const ABrush: TUniversalBrush; AWidth: single; AAlpha: Word);
begin
  if (APen.Style = psClear) or (AWidth = 0) or ABrush.DoesNothing then exit;
  FillPoly(ADest, APen.ComputePolygon(BGRAPath.ComputeEllipse(AOrigin, AXAxis, AYAxis), AWidth),
           ADest.FillMode, ABrush, true, AAlpha);
end;

class procedure TUniversalDrawer.EllipseAntialias(
  ADest: TCustomUniversalBitmap; APen: TBGRACustomPenStroker;
  x, y, rx, ry: single; const ABrush: TUniversalBrush; AWidth: single);
begin
  if (APen.Style = psClear) or (AWidth = 0) then exit;
  if (APen.Style = psSolid) then
    BGRAPolygon.BorderEllipseAntialias(ADest, x, y, rx, ry, AWidth, ABrush)
  else
  begin
    if ABrush.DoesNothing then exit;
    FillPolyAntialias(ADest, APen.ComputePolygon(BGRAPath.ComputeEllipse(x,y,rx,ry),AWidth),
             ADest.FillMode, ABrush, true);
  end;
end;

class procedure TUniversalDrawer.EllipseAntialias(
  ADest: TCustomUniversalBitmap; APen: TBGRACustomPenStroker; const AOrigin,
  AXAxis, AYAxis: TPointF; const ABrush: TUniversalBrush; AWidth: single);
begin
  if (APen.Style = psClear) or (AWidth = 0) or ABrush.DoesNothing then exit;
  FillPolyAntialias(ADest, APen.ComputePolygon(BGRAPath.ComputeEllipse(AOrigin, AXAxis, AYAxis), AWidth),
           ADest.FillMode, ABrush, true);
end;

class procedure TUniversalDrawer.FillRectAntialias(
  ADest: TCustomUniversalBitmap; x, y, x2, y2: single;
  const ABrush: TUniversalBrush; APixelCenteredCoordinates: boolean);
var
  fi: TFillRectangleInfo;
begin
  if ABrush.DoesNothing then exit;
  fi := TFillRectangleInfo.Create(x,y,x2,y2,APixelCenteredCoordinates);
  FillShapeAntialias(ADest, fi, fmAlternate, ABrush);
end;

class procedure TUniversalDrawer.FillShapeAntialias(
  ADest: TCustomUniversalBitmap; AShape: TBGRACustomFillInfo;
  AFillMode: TFillMode; ABrush: TUniversalBrush);
begin
  BGRAPolygon.FillShapeAntialias(ADest, AShape, ABrush, AFillMode = fmWinding);
end;

class procedure TUniversalDrawer.FillPolyAntialias(
  ADest: TCustomUniversalBitmap; const APoints: array of TPointF;
  AFillMode: TFillMode; ABrush: TUniversalBrush;
  APixelCenteredCoordinates: boolean);
begin
  BGRAPolygon.FillPolyAntialias(ADest, APoints, ABrush,
    AFillMode = fmWinding, APixelCenteredCoordinates);
end;

class procedure TUniversalDrawer.FillEllipseAntialias(
  ADest: TCustomUniversalBitmap; x, y, rx, ry: single;
  const ABrush: TUniversalBrush);
begin
  BGRAPolygon.FillEllipseAntialias(ADest, x, y, rx, ry, ABrush);
end;

class procedure TUniversalDrawer.FillEllipseAntialias(
  ADest: TCustomUniversalBitmap; const AOrigin, AXAxis, AYAxis: TPointF;
  const ABrush: TUniversalBrush);
var
  pts: array of TPointF;
begin
  if (AOrigin.y = AXAxis.y) and (AOrigin.x = AYAxis.x) then
    FillEllipseAntialias(ADest, AOrigin.x,AOrigin.y,
      abs(AXAxis.x-AOrigin.x),abs(AYAxis.y-AOrigin.y), ABrush)
  else
  if (AOrigin.x = AXAxis.x) and (AOrigin.y = AYAxis.y) then
    FillEllipseAntialias(ADest, AOrigin.x,AOrigin.y,
      abs(AYAxis.x-AOrigin.x),abs(AXAxis.y-AOrigin.y), ABrush)
  else
  begin
    if ABrush.DoesNothing then exit;
    pts := BGRAPath.ComputeEllipse(AOrigin,AXAxis,AYAxis);
    FillPolyAntialias(ADest, pts, fmAlternate, ABrush, true);
  end;
end;

initialization

  UniDrawerClass := TUniversalDrawer;

end.

