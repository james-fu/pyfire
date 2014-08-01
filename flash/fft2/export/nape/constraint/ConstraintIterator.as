package nape.constraint
{
   import zpp_nape.util.ZPP_ConstraintList;
   
   public class ConstraintIterator extends Object
   {
      
      public function ConstraintIterator()
      {
      }
      
      public static var zpp_pool:ConstraintIterator;
      
      public static function get(param1:ConstraintList) : ConstraintIterator
      {
         var _loc3_:* = null as ConstraintIterator;
         if(ConstraintIterator.zpp_pool == null)
         {
            ZPP_ConstraintList.internal = true;
            _loc3_ = new ConstraintIterator();
            ZPP_ConstraintList.internal = false;
         }
         else
         {
            _loc3_ = ConstraintIterator.zpp_pool;
            ConstraintIterator.zpp_pool = _loc3_.zpp_next;
         }
         if(ConstraintIterator.zpp_pool == null)
         {
            _loc2_ = _loc3_;
            _loc2_.zpp_i = 0;
            _loc2_.zpp_inner = param1;
            _loc2_.zpp_critical = false;
            param1.zpp_inner.iterators.add(_loc2_);
            return _loc2_;
         }
         var _loc2_:ConstraintIterator = _loc3_;
         _loc2_.zpp_i = 0;
         _loc2_.zpp_inner = param1;
         _loc2_.zpp_critical = false;
         param1.zpp_inner.iterators.add(_loc2_);
         return _loc2_;
      }
      
      public var zpp_next:ConstraintIterator;
      
      public var zpp_inner:ConstraintList;
      
      public var zpp_i:int;
      
      public var zpp_critical:Boolean;
      
      public function next() : Constraint
      {
         zpp_critical = false;
         var _loc1_:int = zpp_i;
         zpp_i = zpp_i + 1;
         return zpp_inner.at(_loc1_);
      }
      
      public function hasNext() : Boolean
      {
         zpp_inner.zpp_inner.valmod();
         var _loc2_:ConstraintList = zpp_inner;
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
         zpp_next = ConstraintIterator.zpp_pool;
         ConstraintIterator.zpp_pool = this;
         zpp_inner.zpp_inner.iterators.remove(this);
         zpp_inner = null;
         return false;
      }
   }
}
