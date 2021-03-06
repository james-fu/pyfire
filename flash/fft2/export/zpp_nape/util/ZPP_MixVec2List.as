package zpp_nape.util
{
   import nape.geom.Vec2List;
   import zpp_nape.geom.ZPP_Vec2;
   import nape.geom.Vec2;
   import flash._-2v;
   
   public class ZPP_MixVec2List extends Vec2List
   {
      
      public function ZPP_MixVec2List()
      {
         if(_-2v._-7E)
         {
            return;
         }
         super();
         at_ite = null;
         at_index = 0;
         zip_length = true;
         _length = 0;
      }
      
      public static function get(param1:ZPP_Vec2, param2:Boolean = false) : ZPP_MixVec2List
      {
         var _loc3_:ZPP_MixVec2List = new ZPP_MixVec2List();
         _loc3_.inner = param1;
         _loc3_.zpp_inner.immutable = param2;
         return _loc3_;
      }
      
      override public function zpp_vm() : void
      {
         zpp_inner.validate();
         if(inner.modified)
         {
            zip_length = true;
            _length = 0;
            at_ite = null;
         }
      }
      
      override public function zpp_gl() : int
      {
         var _loc1_:* = null as ZPP_Vec2;
         var _loc2_:* = null as ZPP_Vec2;
         zpp_vm();
         if(zip_length)
         {
            _length = 0;
            _loc1_ = inner.next;
            while(_loc1_ != null)
            {
               _loc2_ = _loc1_;
               _length = _length + 1;
               _loc1_ = _loc1_.next;
            }
            zip_length = false;
         }
         return _length;
      }
      
      public var zip_length:Boolean;
      
      override public function unshift(param1:Vec2) : Boolean
      {
         var _loc3_:* = null as ZPP_Vec2;
         zpp_inner.modify_test();
         zpp_vm();
         var _loc2_:Boolean = zpp_inner.adder != null?zpp_inner.adder(param1):true;
         if(_loc2_)
         {
            if(zpp_inner.reverse_flag)
            {
               _loc3_ = inner.iterator_at(zpp_gl() - 1);
               inner.insert(_loc3_,param1.zpp_inner);
            }
            else
            {
               inner.add(param1.zpp_inner);
            }
            zpp_inner.invalidate();
            if(zpp_inner.post_adder != null)
            {
               zpp_inner.post_adder(param1);
            }
         }
         return _loc2_;
      }
      
      override public function shift() : Vec2
      {
         var _loc2_:* = null as ZPP_Vec2;
         var _loc3_:* = null as Vec2;
         var _loc4_:* = null as ZPP_Vec2;
         zpp_inner.modify_test();
         zpp_vm();
         var _loc1_:ZPP_Vec2 = null;
         if(zpp_inner.reverse_flag)
         {
            if(at_ite != null)
            {
               false;
            }
            if(false)
            {
               at_ite = null;
            }
            _loc2_ = (zpp_gl()) == 1?null:inner.iterator_at((zpp_gl()) - 2);
            _loc1_ = _loc2_ == null?inner.next:_loc2_.next;
            if(_loc1_.outer == null)
            {
               _loc1_.outer = new Vec2();
               _loc4_ = _loc1_.outer.zpp_inner;
               if(_loc4_.outer != null)
               {
                  _loc4_.outer.zpp_inner = null;
                  _loc4_.outer = null;
               }
               _loc4_._isimmutable = null;
               _loc4_._validate = null;
               _loc4_._invalidate = null;
               _loc4_.next = ZPP_Vec2.zpp_pool;
               ZPP_Vec2.zpp_pool = _loc4_;
               _loc1_.outer.zpp_inner = _loc1_;
            }
            _loc3_ = _loc1_.outer;
            if(zpp_inner.subber != null)
            {
               zpp_inner.subber(_loc3_);
            }
            if(!zpp_inner.dontremove)
            {
               inner.erase(_loc2_);
            }
         }
         else
         {
            _loc1_ = inner.next;
            if(_loc1_.outer == null)
            {
               _loc1_.outer = new Vec2();
               _loc2_ = _loc1_.outer.zpp_inner;
               if(_loc2_.outer != null)
               {
                  _loc2_.outer.zpp_inner = null;
                  _loc2_.outer = null;
               }
               _loc2_._isimmutable = null;
               _loc2_._validate = null;
               _loc2_._invalidate = null;
               _loc2_.next = ZPP_Vec2.zpp_pool;
               ZPP_Vec2.zpp_pool = _loc2_;
               _loc1_.outer.zpp_inner = _loc1_;
            }
            _loc3_ = _loc1_.outer;
            if(zpp_inner.subber != null)
            {
               zpp_inner.subber(_loc3_);
            }
            if(!zpp_inner.dontremove)
            {
               inner.pop();
            }
         }
         zpp_inner.invalidate();
         if(_loc1_.outer == null)
         {
            _loc1_.outer = new Vec2();
            _loc2_ = _loc1_.outer.zpp_inner;
            if(_loc2_.outer != null)
            {
               _loc2_.outer.zpp_inner = null;
               _loc2_.outer = null;
            }
            _loc2_._isimmutable = null;
            _loc2_._validate = null;
            _loc2_._invalidate = null;
            _loc2_.next = ZPP_Vec2.zpp_pool;
            ZPP_Vec2.zpp_pool = _loc2_;
            _loc1_.outer.zpp_inner = _loc1_;
         }
         _loc3_ = _loc1_.outer;
         return _loc3_;
      }
      
      override public function remove(param1:Vec2) : Boolean
      {
         var _loc4_:* = null as ZPP_Vec2;
         zpp_inner.modify_test();
         zpp_vm();
         var _loc2_:* = false;
         var _loc3_:ZPP_Vec2 = inner.next;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_;
            if(param1.zpp_inner == _loc4_)
            {
               _loc2_ = true;
               break;
            }
            _loc3_ = _loc3_.next;
         }
         if(_loc2_)
         {
            if(zpp_inner.subber != null)
            {
               zpp_inner.subber(param1);
            }
            if(!zpp_inner.dontremove)
            {
               inner.remove(param1.zpp_inner);
            }
            zpp_inner.invalidate();
         }
         return _loc2_;
      }
      
      override public function push(param1:Vec2) : Boolean
      {
         var _loc3_:* = null as ZPP_Vec2;
         zpp_inner.modify_test();
         zpp_vm();
         var _loc2_:Boolean = zpp_inner.adder != null?zpp_inner.adder(param1):true;
         if(_loc2_)
         {
            if(zpp_inner.reverse_flag)
            {
               inner.add(param1.zpp_inner);
            }
            else
            {
               _loc3_ = inner.iterator_at(zpp_gl() - 1);
               inner.insert(_loc3_,param1.zpp_inner);
            }
            zpp_inner.invalidate();
            if(zpp_inner.post_adder != null)
            {
               zpp_inner.post_adder(param1);
            }
         }
         return _loc2_;
      }
      
      override public function pop() : Vec2
      {
         var _loc2_:* = null as Vec2;
         var _loc3_:* = null as ZPP_Vec2;
         var _loc4_:* = null as ZPP_Vec2;
         zpp_inner.modify_test();
         zpp_vm();
         var _loc1_:ZPP_Vec2 = null;
         if(zpp_inner.reverse_flag)
         {
            _loc1_ = inner.next;
            if(_loc1_.outer == null)
            {
               _loc1_.outer = new Vec2();
               _loc3_ = _loc1_.outer.zpp_inner;
               if(_loc3_.outer != null)
               {
                  _loc3_.outer.zpp_inner = null;
                  _loc3_.outer = null;
               }
               _loc3_._isimmutable = null;
               _loc3_._validate = null;
               _loc3_._invalidate = null;
               _loc3_.next = ZPP_Vec2.zpp_pool;
               ZPP_Vec2.zpp_pool = _loc3_;
               _loc1_.outer.zpp_inner = _loc1_;
            }
            _loc2_ = _loc1_.outer;
            if(zpp_inner.subber != null)
            {
               zpp_inner.subber(_loc2_);
            }
            if(!zpp_inner.dontremove)
            {
               inner.pop();
            }
         }
         else
         {
            if(at_ite != null)
            {
               false;
            }
            if(false)
            {
               at_ite = null;
            }
            _loc3_ = (zpp_gl()) == 1?null:inner.iterator_at((zpp_gl()) - 2);
            _loc1_ = _loc3_ == null?inner.next:_loc3_.next;
            if(_loc1_.outer == null)
            {
               _loc1_.outer = new Vec2();
               _loc4_ = _loc1_.outer.zpp_inner;
               if(_loc4_.outer != null)
               {
                  _loc4_.outer.zpp_inner = null;
                  _loc4_.outer = null;
               }
               _loc4_._isimmutable = null;
               _loc4_._validate = null;
               _loc4_._invalidate = null;
               _loc4_.next = ZPP_Vec2.zpp_pool;
               ZPP_Vec2.zpp_pool = _loc4_;
               _loc1_.outer.zpp_inner = _loc1_;
            }
            _loc2_ = _loc1_.outer;
            if(zpp_inner.subber != null)
            {
               zpp_inner.subber(_loc2_);
            }
            if(!zpp_inner.dontremove)
            {
               inner.erase(_loc3_);
            }
         }
         zpp_inner.invalidate();
         if(_loc1_.outer == null)
         {
            _loc1_.outer = new Vec2();
            _loc3_ = _loc1_.outer.zpp_inner;
            if(_loc3_.outer != null)
            {
               _loc3_.outer.zpp_inner = null;
               _loc3_.outer = null;
            }
            _loc3_._isimmutable = null;
            _loc3_._validate = null;
            _loc3_._invalidate = null;
            _loc3_.next = ZPP_Vec2.zpp_pool;
            ZPP_Vec2.zpp_pool = _loc3_;
            _loc1_.outer.zpp_inner = _loc1_;
         }
         _loc2_ = _loc1_.outer;
         return _loc2_;
      }
      
      public var inner:ZPP_Vec2;
      
      override public function clear() : void
      {
         if(zpp_inner.reverse_flag)
         {
            while(!(empty()))
            {
               pop();
            }
         }
         else
         {
            while(!(empty()))
            {
               shift();
            }
         }
      }
      
      public var at_ite:ZPP_Vec2;
      
      public var at_index:int;
      
      override public function at(param1:int) : Vec2
      {
         var _loc2_:* = null as ZPP_Vec2;
         var _loc3_:* = null as ZPP_Vec2;
         zpp_vm();
         if(zpp_inner.reverse_flag)
         {
            param1 = zpp_gl() - 1 - param1;
         }
         if(param1 >= at_index)
         {
            true;
         }
         if(true)
         {
            at_index = 0;
            at_ite = inner.next;
            _loc2_ = at_ite;
         }
         while(at_index != param1)
         {
            at_index = at_index + 1;
            at_ite = at_ite.next;
            _loc2_ = at_ite;
         }
         _loc2_ = at_ite;
         if(_loc2_.outer == null)
         {
            _loc2_.outer = new Vec2();
            _loc3_ = _loc2_.outer.zpp_inner;
            if(_loc3_.outer != null)
            {
               _loc3_.outer.zpp_inner = null;
               _loc3_.outer = null;
            }
            _loc3_._isimmutable = null;
            _loc3_._validate = null;
            _loc3_._invalidate = null;
            _loc3_.next = ZPP_Vec2.zpp_pool;
            ZPP_Vec2.zpp_pool = _loc3_;
            _loc2_.outer.zpp_inner = _loc2_;
         }
         return _loc2_.outer;
      }
      
      public var _length:int;
   }
}
