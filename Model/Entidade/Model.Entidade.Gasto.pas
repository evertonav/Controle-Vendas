﻿unit Model.Entidade.Gasto;

interface

Uses
  Model.DAO.Interfaces;

type
  TEntidadeGasto = class
  private
    [weak]
    FModelDAOGasto: IModelDAOInterface<TEntidadeGasto>;

    FCodigo: Integer;
    FValor: Double;
    FTipoGasto: Integer;
    FData: TDate;
  public
    constructor Create(pModelDAOGasto: IModelDAOInterface<TEntidadeGasto>);
    destructor Destroy; override;

    function Codigo(const pValor: Integer): TEntidadeGasto; overload;
    function Codigo: Integer; overload;

    function Data(const pValor: TDate): TEntidadeGasto; overload;
    function Data: TDate; overload;

    function Valor(const pValor: Double): TEntidadeGasto; overload;
    function Valor: Double; overload;

    function Tipo(const pValor: Integer): TEntidadeGasto; overload;
    function Tipo: Integer; overload;

    function ModelDAOGasto: IModelDAOInterface<TEntidadeGasto>;
  end;

implementation

Uses
  System.SysUtils,
  System.DateUtils,
  FMX.DialogService,
  FireDAC.Stan.Param,
  Controller.Utils;

{ TGasto }

function TEntidadeGasto.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TEntidadeGasto.Codigo(const pValor: Integer): TEntidadeGasto;
begin
  FCodigo := pValor;

  Result := Self;
end;

constructor TEntidadeGasto.Create(
  pModelDAOGasto: IModelDAOInterface<TEntidadeGasto>);
begin
  FModelDAOGasto := pModelDAOGasto;
end;

function TEntidadeGasto.Data: TDate;
begin
  Result := FData;
end;

destructor TEntidadeGasto.Destroy;
begin

end;

function TEntidadeGasto.ModelDAOGasto: IModelDAOInterface<TEntidadeGasto>;
begin
  Result := FModelDAOGasto;
end;

function TEntidadeGasto.Data(const pValor: TDate): TEntidadeGasto;
begin
  FData := pValor;

  Result := Self;
end;

function TEntidadeGasto.Tipo(const pValor: Integer): TEntidadeGasto;
begin
  FTipoGasto := pValor;

  Result := Self;
end;

function TEntidadeGasto.Tipo: Integer;
begin
  Result := FTipoGasto;
end;

function TEntidadeGasto.Valor: Double;
begin
  Result := FValor;
end;

function TEntidadeGasto.Valor(const pValor: Double): TEntidadeGasto;
begin
  if pValor <= 0 then
    raise Exception.Create('Digite um valor válido!');

  FValor := pValor;

  Result := Self;
end;

end.
