package nape.phys
{
   import zpp_nape.util.ZPP_InteractorList;
   
   public class InteractorIterator extends Object
   {
      
      public function InteractorIterator()
      {
      }
      
      public static var zpp_pool:InteractorIterator;
      
      public static function get(param1:InteractorList) : InteractorIterator
      {
         var _loc3_:* = null as InteractorIterator;
         if(InteractorIterator.zpp_pool == null)
         {
            ZPP_InteractorList.internal = true;
            _loc3_ = new InteractorIterator();
            ZPP_InteractorList.internal = false;
         }
         else
         {
            _loc3_ = InteractorIterator.zpp_pool;
            InteractorIterator.zpp_pool = _loc3_.zpp_next;
         }
         if(InteractorIterator.zpp_pool == null)
         {
            _loc2_ = _loc3_;
            _loc2_.zpp_i = 0;
            _loc2_.zpp_inner = param1;
            _loc2_.zpp_critical = false;
            param1.zpp_inner.iterators.add(_loc2_);
            return _loc2_;
         }
         var _loc2_:InteractorIterator = _loc3_;
         _loc2_.zpp_i = 0;
         _loc2_.zpp_inner = param1;
         _loc2_.zpp_critical = false;
         param1.zpp_inner.iterators.add(_loc2_);
         return _loc2_;
      }
      
      public var zpp_next:InteractorIterator;
      
      public var zpp_inner:InteractorList;
      
      public var zpp_i:int;
      
      public var zpp_critical:Boolean;
      
      public function next() : Interactor
      {
         zpp_critical = false;
         var _loc1_:int = zpp_i;
         zpp_i = zpp_i + 1;
         return zpp_inner.at(_loc1_);
      }
      
      public function hasNext() : Boolean
      {
         zpp_inner.zpp_inner.valmod();
         var _loc2_:InteractorList = zpp_inner;
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
         zpp_next = InteractorIterator.zpp_pool;
         InteractorIterator.zpp_pool = this;
         zpp_inner.zpp_inner.iterators.remove(this);
         zpp_inner = null;
         return false;
      }
   }
}
