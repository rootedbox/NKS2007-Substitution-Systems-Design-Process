unit DimensionGraphicsUnit;

interface

uses
  SysUtils,
  //System,
  DimensionsUnit,
  Graphics;

function SpaceToBitmap(SpaceToConvert: TSpace) : TBitmap;
function XYSpaceToBitmap(SpaceToConvert: TSpace; ZSpaceIndex: Integer) : TBitmap;

implementation

type
 TRGB24Bit = packed record
    R, G, B: byte;
 end;

 PRGB24BitArray = ^TRGB24BitArray;
 TRGB24BitArray = packed array[0..MaxInt div SizeOf(TRGB24Bit) - 1] of TRGB24Bit;

var
  InformationOnColor: TRGB24Bit;
  InformationOffColor: TRGB24Bit;

function SpaceToBitmap(SpaceToConvert: TSpace) : TBitmap;
var
  xIndex,
  yIndex,
  zIndex : Integer;
  P : PRGB24BitArray;
begin
  Result := TBitmap.Create;
  Result.PixelFormat := pf24bit;
  Result.Width := SpaceSize;
  Result.Height := SpaceSize * SpaceSize;

  for zIndex := 0 to SpaceSize -1 do
    for yIndex := 0 to SpaceSize -1 do
    begin
      P := Result.ScanLine[yIndex + (SpaceSize * zIndex)];

      for xIndex := 0 to Result.Width -1 do
        if SpaceToConvert.Points[xIndex + 1,yIndex + 1,zIndex + 1] > 0 then
          P[xIndex] := InformationOnColor
        else
          P[xIndex] := InformationOffColor;
    end;
end;

function XYSpaceToBitmap(SpaceToConvert: TSpace; ZSpaceIndex: Integer) : TBitmap;
var
  xIndex,
  yIndex : Integer;
  P : PRGB24BitArray;
begin
  Result := TBitmap.Create;
  Result.PixelFormat := pf24bit;
  Result.Width := SpaceSize;
  Result.Height := SpaceSize;

  for yIndex := 0 to Result.Height -1 do
  begin
    P := Result.ScanLine[yIndex];

    for xIndex := 0 to Result.Width -1 do
      if SpaceToConvert.Points[xIndex + 1,yIndex + 1,ZSpaceIndex] > 0 then
        P[xIndex] := InformationOnColor
      else
        P[xIndex] := InformationOffColor;
  end;
end;

initialization 
  InformationOnColor.R := 255;
  InformationOnColor.G := 255;
  InformationOnColor.B := 255;

  InformationOffColor.R := 0;
  InformationOffColor.G := 0;
  InformationOffColor.B := 0;
end.
