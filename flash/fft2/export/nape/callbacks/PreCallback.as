package nape.callbacks
{
   import nape.dynamics.Arbiter;
   import nape.phys.Interactor;
   import flash._-2v;
   
   public class PreCallback extends Callback
   {
      
      public function PreCallback()
      {
         if(_-2v._-7E)
         {
            return;
         }
         super();
      }
      
      override public function toString() : String
      {
         var _loc1_:String = "Cb:PRE:";
         _loc1_ = _loc1_ + (":" + zpp_inner.int1.outer_i.toString() + "/" + zpp_inner.int2.outer_i.toString());
         _loc1_ = _loc1_ + (" : " + zpp_inner.pre_arbiter.wrapper().toString());
         _loc1_ = _loc1_ + (" : listnener: " + _-C2.string(zpp_inner.listener.outer));
         return _loc1_;
      }
      
      public function get swapped() : Boolean
      {
         return zpp_inner.pre_swapped;
      }
      
      public function get int2() : Interactor
      {
         return zpp_inner.int2.outer_i;
      }
      
      public function get int1() : Interactor
      {
         return zpp_inner.int1.outer_i;
      }
      
      public function get arbiter() : Arbiter
      {
         return zpp_inner.pre_arbiter.wrapper();
      }
   }
}
