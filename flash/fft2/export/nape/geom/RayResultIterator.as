package nape.geom
{
   import zpp_nape.util.ZPP_RayResultList;
   
   public class RayResultIterator extends Object
   {
      
      public function RayResultIterator()
      {
      }
      
      public static var zpp_pool:RayResultIterator;
      
      public static function get(param1:RayResultList) : RayResultIterator
      {
         var _loc3_:* = null as RayResultIterator;
         if(RayResultIterator.zpp_pool == null)
         {
            ZPP_RayResultList.internal = true;
            _loc3_ = new RayResultIterator();
            ZPP_RayResultList.internal = false;
         }
         else
         {
            _loc3_ = RayResultIterator.zpp_pool;
            RayResultIterator.zpp_pool = _loc3_.zpp_next;
         }
         if(RayResultIterator.zpp_pool == null)
         {
            _loc2_ = _loc3_;
            _loc2_.zpp_i = 0;
            _loc2_.zpp_inner = param1;
            _loc2_.zpp_critical = false;
            param1.zpp_inner.iterators.add(_loc2_);
            return _loc2_;
         }
         var _loc2_:RayResultIterator = _loc3_;
         _loc2_.zpp_i = 0;
         _loc2_.zpp_inner = param1;
         _loc2_.zpp_critical = false;
         param1.zpp_inner.iterators.add(_loc2_);
         return _loc2_;
      }
      
      public var zpp_next:RayResultIterator;
      
      public var zpp_inner:RayResultList;
      
      public var zpp_i:int;
      
      public var zpp_critical:Boolean;
      
      public function next() : RayResult
      {
         zpp_critical = false;
         var _loc1_:int = zpp_i;
         zpp_i = zpp_i + 1;
         return zpp_inner.at(_loc1_);
      }
      
      public function hasNext() : Boolean
      {
         zpp_inner.zpp_inner.valmod();
         var _loc2_:RayResultList = zpp_inner;
         _loc2_.zpp_inner.valmod();
         if(_loc2_.zpp_inner.zip_length)
         {
            _loc2_.zpp_inner.zip_length = false;
            _loc2_.zpp_inner.user_length = _loc2_.zpp_inner.inner.length;
         }
         var _loc1_:int = _loc2_.zpp_inner.user_length;
         zpp_critical = true;
         if(zpp_i < _loc1_)
         {
            return true;
         }
         zpp_next = RayResultIterator.zpp_pool;
         RayResultIterator.zpp_pool = this;
         zpp_inner.zpp_inner.iterators.remove(this);
         zpp_inner = null;
         return false;
      }
   }
}
