package tink.sql;

using tink.CoreApi;

interface DatabaseInfo {
  function tableNames():Iterable<String>;
  function tableInfo(name:String):TableInfo;
}

interface TableInfo {
  function getName():String;
  function getColumns():Iterable<Column>;
  function columnNames():Iterable<String>;
  function getKeys():Iterable<Key>;
}

typedef Column = {
  name:String,
  nullable:Bool,
  type:DataType
}

enum Key {
  Primary(fields:Array<String>);
  Unique(name:String, fields:Array<String>);
  Index(name:String, fields:Array<String>);
}

enum DataType {
  DBool(?byDefault:Bool);
  DInt(bits:Int, signed:Bool, autoIncrement:Bool, ?byDefault:Int);
  DFloat(bits:Int, ?byDefault:Float);
  DString(maxLength:Int, ?byDefault:String);
  DText(size:TextSize, ?byDefault:String);
  DBlob(maxLength:Int, ?byDefault:haxe.io.Bytes);
  DDateTime(?byDefault:Date);
  DPoint(?byDefault:geojson.Point);
  DMultiPolygon(?byDefault:geojson.MultiPolygon);
  DUnknown(type:String, ?byDefault:Any);
}

enum TextSize {
  Tiny;
  Default;
  Medium;
  Long;
}