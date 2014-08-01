package zpp_nape.geom
{
   public class ZPP_MarchPair extends Object
   {
      
      public function ZPP_MarchPair()
      {
      }
      
      public static var zpp_pool:ZPP_MarchPair;
      
      public var spanr:ZPP_MarchSpan;
      
      public var span2:ZPP_MarchSpan;
      
      public var span1:ZPP_MarchSpan;
      
      public var pr:ZPP_GeomVert;
      
      public var pd:ZPP_GeomVert;
      
      public var p2:ZPP_GeomVert;
      
      public var p1:ZPP_GeomVert;
      
      public var okeyr:int;
      
      public var okey2:int;
      
      public var okey1:int;
      
      public var next:ZPP_MarchPair;
      
      public var keyr:int;
      
      public var key2:int;
      
      public var key1:int;
      
      public function free() : void
      {
         var _loc1_:ZPP_GeomVert = null;
         pd = _loc1_;
         _loc1_ = _loc1_;
         pr = _loc1_;
         _loc1_ = _loc1_;
         p2 = _loc1_;
         p1 = _loc1_;
         var _loc2_:ZPP_MarchSpan = null;
         spanr = _loc2_;
         _loc2_ = _loc2_;
         span2 = _loc2_;
         span1 = _loc2_;
      }
      
      public function alloc() : void
      {
      }
   }
}
