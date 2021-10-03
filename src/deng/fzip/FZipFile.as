package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_667:int = 8;
      
      public static const const_1591:int = 10;
      
      public static const const_1340:int = 6;
      
      private static var var_1021:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1224:int = 0;
      
      public static const const_1502:int = 1;
      
      public static const const_1510:int = 2;
      
      public static const const_1488:int = 3;
      
      public static const const_1604:int = 4;
      
      public static const const_1501:int = 5;
      
      public static const const_1518:int = 9;
      
      public static const const_1521:int = 7;
       
      
      private var var_175:uint = 0;
      
      private var var_1022:uint = 0;
      
      private var var_707:Date;
      
      private var var_1957:int = -1;
      
      private var parseFunc:Function;
      
      private var var_499:Boolean = false;
      
      private var var_2319:int = -1;
      
      private var var_1230:uint = 0;
      
      private var var_1956:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_840:uint;
      
      private var var_20:ByteArray;
      
      private var var_706:uint;
      
      private var var_1490:Boolean = false;
      
      private var var_2320:int = -1;
      
      private var var_1488:String = "2.0";
      
      private var var_174:Boolean = false;
      
      private var var_1955:Boolean = false;
      
      private var var_350:String;
      
      private var var_581:uint = 0;
      
      private var var_1231:int = 0;
      
      private var var_411:String = "";
      
      private var var_705:int = 8;
      
      private var var_1489:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_350 = param1;
         _extraFields = new Dictionary();
         var_20 = new ByteArray();
         var_20.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_581;
      }
      
      public function set filename(param1:String) : void
      {
         var_411 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_174 && false)
         {
            var_20.position = 0;
            if(var_1021)
            {
               var_20.uncompress.apply(var_20,["deflate"]);
            }
            else
            {
               var_20.uncompress();
            }
            var_20.position = 0;
            var_174 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_411;
      }
      
      public function get date() : Date
      {
         return var_707;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1489)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_175 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_175)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1488;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_174)
         {
            uncompress();
         }
         var_20.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_20.readUTFBytes(var_20.bytesAvailable);
         }
         else
         {
            _loc3_ = var_20.readMultiByte(var_20.bytesAvailable,param2);
         }
         var_20.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_705 === const_667 && !var_1490)
         {
            if(var_1021)
            {
               param1.readBytes(var_20,0,var_175);
            }
            else
            {
               if(!var_499)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_20.writeByte(120);
               _loc2_ = uint(~var_1957 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_20.writeByte(_loc2_);
               param1.readBytes(var_20,2,var_175);
               var_20.position = var_20.length;
               var_20.writeUnsignedInt(var_840);
            }
            var_174 = true;
         }
         else
         {
            if(var_705 != const_1224)
            {
               throw new Error("Compression method " + var_705 + " is not supported.");
            }
            param1.readBytes(var_20,0,var_175);
            var_174 = false;
         }
         var_20.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1022 + var_1230 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_20.length = 0;
         var_20.position = 0;
         var_174 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_20.writeUTFBytes(param1);
            }
            else
            {
               var_20.writeMultiByte(param1,param2);
            }
            var_706 = ChecksumUtil.CRC32(var_20);
            var_499 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_707 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1231 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1231 << 8 | 20);
         param1.writeShort(var_350 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_667);
         var _loc5_:Date = var_707 != null ? var_707 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_706);
         param1.writeUnsignedInt(var_175);
         param1.writeUnsignedInt(var_581);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_350 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_411);
         }
         else
         {
            _loc8_.writeMultiByte(var_411,var_350);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_499)
            {
               _loc16_ = var_174;
               if(_loc16_)
               {
                  uncompress();
               }
               var_840 = ChecksumUtil.Adler32(var_20,0,var_20.length);
               var_499 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_840);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_350 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_1956);
            }
            else
            {
               _loc8_.writeMultiByte(var_1956,var_350);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_175 > 0)
         {
            if(var_1021)
            {
               _loc13_ = 0;
               param1.writeBytes(var_20,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_20,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_175;
      }
      
      protected function compress() : void
      {
         if(!var_174)
         {
            if(false)
            {
               var_20.position = 0;
               var_581 = var_20.length;
               if(var_1021)
               {
                  var_20.compress.apply(var_20,["deflate"]);
                  var_175 = var_20.length;
               }
               else
               {
                  var_20.compress();
                  var_175 = -6;
               }
               var_20.position = 0;
               var_174 = true;
            }
            else
            {
               var_175 = 0;
               var_581 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1022 + var_1230)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_350 == "utf-8")
         {
            var_411 = param1.readUTFBytes(var_1022);
         }
         else
         {
            var_411 = param1.readMultiByte(var_1022,var_350);
         }
         var _loc2_:uint = var_1230;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_411 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_840 = param1.readUnsignedInt();
               var_499 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1231 = _loc2_ >> 8;
         var_1488 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_705 = param1.readUnsignedShort();
         var_1490 = (_loc3_ & 1) !== 0;
         var_1489 = (_loc3_ & 8) !== 0;
         var_1955 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_350 = "utf-8";
         }
         if(var_705 === const_1340)
         {
            var_2320 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2319 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_705 === const_667)
         {
            var_1957 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_707 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_706 = param1.readUnsignedInt();
         var_175 = param1.readUnsignedInt();
         var_581 = param1.readUnsignedInt();
         var_1022 = param1.readUnsignedShort();
         var_1230 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_20,0,param1.length);
            var_706 = ChecksumUtil.CRC32(var_20);
            var_499 = false;
         }
         else
         {
            var_20.length = 0;
            var_20.position = 0;
            var_174 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_411 + "\n  date:" + var_707 + "\n  sizeCompressed:" + var_175 + "\n  sizeUncompressed:" + var_581 + "\n  versionHost:" + var_1231 + "\n  versionNumber:" + var_1488 + "\n  compressionMethod:" + var_705 + "\n  encrypted:" + var_1490 + "\n  hasDataDescriptor:" + var_1489 + "\n  hasCompressedPatchedData:" + var_1955 + "\n  filenameEncoding:" + var_350 + "\n  crc32:" + var_706.toString(16) + "\n  adler32:" + var_840.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_174)
         {
            uncompress();
         }
         return var_20;
      }
   }
}
