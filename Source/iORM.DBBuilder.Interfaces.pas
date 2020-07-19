unit iORM.DBBuilder.Interfaces;

interface

uses
  System.Generics.Collections, iORM.Context.Table.Interfaces, iORM.Context.Properties.Interfaces, System.Classes,
  iORM.Context.Map.Interfaces, iORM.Attributes;

type

  TioDBBuilderStatus = (dbsClean, dbsAlter, dbsCreate);

  IioDBBuilderSchemaFK = interface
    ['{1F653F52-570B-4381-930D-FB3945025DA2}']
    function Name: String;
    function ReferenceTableName: String;
    function ReferenceFieldName: String;
    function DependentTableName: String;
    function DependentFieldName: String;
  end;

  IioDBBuilderSchemaField = interface
    ['{D06F09FD-7252-46E3-A955-E6C2A3095E77}']
    function FieldName: String;
    function GetProperty: IioContextProperty;
    function PrimaryKey: Boolean;
    function NotNull: Boolean;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  TioDBBuilderSchemaFields = TDictionary<String, IioDBBuilderSchemaField>;
  TioDBBuilderSchemaIndexes = TioIndexList;
  TioDBBuilderSchemaForeignKeys = TDictionary<String, IioDBBuilderSchemaFK>;

  IioDBBuilderSchemaTable = interface
    ['{2AFBE991-7E33-42DB-892E-01F8C98A5B8F}']
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty);
    procedure AddIndex(const AIndexAttr: ioIndex);
    function FieldList: TioDBBuilderSchemaFields;
    function ForeignKeys: TioDBBuilderSchemaForeignKeys;
//    function IDField: IioDBBuilderSchemaField;
    function Indexes: TioDBBuilderSchemaIndexes;
    function PrimaryKeyField: IioDBBuilderSchemaField;
    function TableName: String;
    // IsClassFromField
    procedure SetIsClassFromField(const AValue: Boolean);
    function GetIsClassFromField: Boolean;
    property IsClassFromField: Boolean read GetIsClassFromField write SetIsClassFromField;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  TioDBBuilderSchemaTables = TDictionary<String, IioDBBuilderSchemaTable>;

  IioDBBuilderSchema = interface
    ['{1AEDB134-1ECB-490E-A53A-973BEDE509E5}']
    function ConnectionDefName: String;
    function DatabaseFileName: String;
    function ErrorMsg: String;
    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String): IioDBBuilderSchemaTable;
    function SqlScript: TStringList;
    function SqlScriptEmpty: Boolean;
    function Warnings: TStringList;
    function WarningsEmpty: Boolean;
    function Tables: TioDBBuilderSchemaTables;
    // DBExists
    function GetDBExists: Boolean;
    procedure SetDBExists(const Value: Boolean);
    property DBExists: Boolean read GetDBExists write SetDBExists;
  end;

  IioDBBuilderStrategyIndex = interface
    ['{F72823BF-2611-439B-A8A3-D0427E017133}']
  end;

  IioDBBuilderStrategyFK = interface
    ['{936AFB28-FAFE-4A8C-AD97-3A9994D3A598}']
  end;

  IioDBBuilderStrategyField = interface
    ['{FBD4F76B-FF89-4CE3-A673-E6963E08257B}']
  end;

  IioDBBuilderStrategyTable = interface
    ['{7F5DEC8D-F22B-4F53-8C6F-2A829FDB6ED4}']
  end;

  IioDBBuilderStrategyDB = interface
    ['{EA9C37F2-705C-4C9D-969B-75D2E97605B5}']
  end;

  IioDBBuilderSqlGenerator = interface
    ['{9B5DE886-BE08-4422-9D6C-A92ABF948CD9}']
  end;

implementation

end.