package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1323:BigInteger;
      
      private var var_610:BigInteger;
      
      private var var_1556:BigInteger;
      
      private var var_1557:BigInteger;
      
      private var var_2142:BigInteger;
      
      private var var_2089:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1323 = param1;
         var_1556 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2142.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1557 = new BigInteger();
         var_1557.fromRadix(param1,param2);
         var_2142 = var_1557.modPow(var_610,var_1323);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_2089.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1323.toString() + ",generator: " + var_1556.toString() + ",secret: " + param1);
         var_610 = new BigInteger();
         var_610.fromRadix(param1,param2);
         var_2089 = var_1556.modPow(var_610,var_1323);
         return true;
      }
   }
}
