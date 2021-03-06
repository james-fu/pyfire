package zpp_nape.phys
{
   import zpp_nape.space.ZPP_CallbackSet;
   import zpp_nape.util.ZNPList_ZPP_CallbackSet;
   import zpp_nape.util.ZNPNode_ZPP_CallbackSet;
   import zpp_nape.callbacks.ZPP_InteractionListener;
   import zpp_nape.callbacks.ZPP_Callback;
   import zpp_nape.callbacks.ZPP_OptionType;
   import zpp_nape.util.ZNPList_ZPP_CbType;
   import nape.callbacks.CbType;
   import zpp_nape.space.ZPP_Space;
   import zpp_nape.callbacks.ZPP_CbType;
   import zpp_nape.shape.ZPP_Shape;
   import nape.callbacks.CbTypeList;
   import zpp_nape.util.ZPP_CbTypeList;
   import zpp_nape.dynamics.ZPP_InteractionGroup;
   import nape.phys.Interactor;
   import zpp_nape.util.ZNPNode_ZPP_CbType;
   import zpp_nape.callbacks.ZPP_CbSet;
   import flash._-2v;
   import zpp_nape.ZPP_ID;
   
   public class ZPP_Interactor extends Object
   {
      
      public function ZPP_Interactor()
      {
         if(_-2v._-7E)
         {
            return;
         }
         id = ZPP_ID.Interactor();
         cbsets = new ZNPList_ZPP_CallbackSet();
         cbTypes = new ZNPList_ZPP_CbType();
      }
      
      public static function get(param1:ZPP_Interactor, param2:ZPP_Interactor) : ZPP_CallbackSet
      {
         var _loc8_:* = null as ZPP_CallbackSet;
         var _loc3_:int = param1.id < param2.id?param1.id:param2.id;
         var _loc4_:int = param1.id < param2.id?param2.id:param1.id;
         var _loc5_:ZNPList_ZPP_CallbackSet = param1.cbsets.length < param2.cbsets.length?param1.cbsets:param2.cbsets;
         var _loc6_:ZPP_CallbackSet = null;
         var _loc7_:ZNPNode_ZPP_CallbackSet = _loc5_.head;
         while(_loc7_ != null)
         {
            _loc8_ = _loc7_.elt;
            if(_loc8_.id == _loc3_)
            {
               false;
            }
            if(false)
            {
               _loc6_ = _loc8_;
               break;
            }
            _loc7_ = _loc7_.next;
         }
         return _loc6_;
      }
      
      public static function int_callback(param1:ZPP_CallbackSet, param2:ZPP_InteractionListener, param3:ZPP_Callback) : void
      {
         var _loc6_:* = null as ZPP_OptionType;
         var _loc7_:* = null as ZNPList_ZPP_CbType;
         var _loc4_:ZPP_Interactor = param1.int1;
         var _loc5_:ZPP_Interactor = param1.int2;
         _loc6_ = param2.options1;
         _loc7_ = _loc4_.cbTypes;
         if(_loc6_.nonemptyintersection(_loc7_,_loc6_.includes))
         {
            false;
         }
         if(false)
         {
            false;
            _loc6_ = param2.options2;
            _loc7_ = _loc5_.cbTypes;
            if(_loc6_.nonemptyintersection(_loc7_,_loc6_.includes))
            {
               false;
            }
         }
         if(false)
         {
            param3.int1 = _loc4_;
            param3.int2 = _loc5_;
         }
         else
         {
            param3.int1 = _loc5_;
            param3.int2 = _loc4_;
         }
      }
      
      public function wrap_cbTypes_subber(param1:CbType) : void
      {
         var _loc3_:* = null as ZPP_Space;
         var _loc2_:ZPP_CbType = param1.zpp_inner;
         if(cbTypes.has(_loc2_))
         {
            _loc3_ = ishape != null?ishape.body == null?null:ishape.body.space:ibody != null?ibody.space:icompound.space;
            if(_loc3_ != null)
            {
               dealloc_cbSet();
               _loc2_.interactors.remove(this);
            }
            cbTypes.remove(_loc2_);
            if(_loc3_ != null)
            {
               alloc_cbSet();
               wake();
            }
         }
      }
      
      public function wrap_cbTypes_adder(param1:CbType) : Boolean
      {
         insert_cbtype(param1.zpp_inner);
         return false;
      }
      
      public var wrap_cbTypes:CbTypeList;
      
      public function wake() : void
      {
         var _loc1_:* = null as ZPP_Body;
         if(ishape != null)
         {
            _loc1_ = ishape.body;
            if(_loc1_ != null)
            {
               false;
            }
            if(false)
            {
               _loc1_.space.non_inlined_wake(_loc1_);
            }
            true;
         }
         else if(ibody != null)
         {
            if(ibody.space != null)
            {
               ibody.space.non_inlined_wake(ibody);
            }
            else
            {
               false;
            }
         }
         else
         {
            if(icompound.space != null)
            {
               icompound.space.wakeCompound(icompound);
            }
            true;
         }
         
      }
      
      public var userData;
      
      public function setupcbTypes() : void
      {
         wrap_cbTypes = ZPP_CbTypeList.get(cbTypes);
         wrap_cbTypes.zpp_inner.adder = wrap_cbTypes_adder;
         wrap_cbTypes.zpp_inner.subber = wrap_cbTypes_subber;
         wrap_cbTypes.zpp_inner.dontremove = true;
      }
      
      public function setGroup(param1:ZPP_InteractionGroup) : void
      {
         var _loc2_:* = false;
         var _loc3_:* = 0;
         if(group != param1)
         {
            _loc2_ = !((ishape != null?ishape.body == null?null:ishape.body.space:ibody != null?ibody.space:icompound.space) == null);
            if(_loc2_)
            {
               false;
            }
            if(false)
            {
               _loc3_ = -1;
               group.interactors.remove(this);
            }
            group = param1;
            if(_loc2_)
            {
               false;
            }
            if(false)
            {
               param1.interactors.add(this);
            }
            if(_loc2_)
            {
               if(ishape != null)
               {
                  ishape.body.wake();
               }
               else if(ibody != null)
               {
                  ibody.wake();
               }
               else
               {
                  icompound.wake();
               }
               
            }
         }
      }
      
      public var outer_i:nape.phys.Interactor;
      
      public var ishape:ZPP_Shape;
      
      public function insert_cbtype(param1:ZPP_CbType) : void
      {
         var _loc2_:* = null as ZPP_Space;
         var _loc3_:* = null as ZNPNode_ZPP_CbType;
         var _loc4_:* = null as ZNPNode_ZPP_CbType;
         var _loc5_:* = null as ZPP_CbType;
         var _loc6_:* = null as ZNPList_ZPP_CbType;
         var _loc7_:* = null as ZNPNode_ZPP_CbType;
         var _loc8_:* = false;
         if(!cbTypes.has(param1))
         {
            _loc2_ = ishape != null?ishape.body == null?null:ishape.body.space:ibody != null?ibody.space:icompound.space;
            if(_loc2_ != null)
            {
               dealloc_cbSet();
               param1.interactors.add(this);
            }
            _loc3_ = null;
            _loc4_ = cbTypes.head;
            while(_loc4_ != null)
            {
               _loc5_ = _loc4_.elt;
               if(param1.id < _loc5_.id)
               {
                  break;
               }
               _loc3_ = _loc4_;
               _loc4_ = _loc4_.next;
            }
            _loc6_ = cbTypes;
            if(ZNPNode_ZPP_CbType.zpp_pool == null)
            {
               _loc7_ = new ZNPNode_ZPP_CbType();
            }
            else
            {
               _loc7_ = ZNPNode_ZPP_CbType.zpp_pool;
               ZNPNode_ZPP_CbType.zpp_pool = _loc7_.next;
               _loc7_.next = null;
            }
            null;
            _loc7_.elt = param1;
            _loc4_ = _loc7_;
            if(_loc3_ == null)
            {
               _loc4_.next = _loc6_.head;
               _loc6_.head = _loc4_;
            }
            else
            {
               _loc4_.next = _loc3_.next;
               _loc3_.next = _loc4_;
            }
            _loc8_ = true;
            _loc6_.modified = _loc8_;
            _loc6_.pushmod = _loc8_;
            _loc6_.length = _loc6_.length + 1;
            _loc4_;
            if(_loc2_ != null)
            {
               alloc_cbSet();
               wake();
            }
         }
      }
      
      public function immutable_midstep(param1:String) : void
      {
         if(ibody != null)
         {
            ibody.__immutable_midstep(param1);
         }
         else if(ishape != null)
         {
            ishape.__immutable_midstep(param1);
         }
         else
         {
            icompound.__imutable_midstep(param1);
         }
         
      }
      
      public var id:int;
      
      public var icompound:ZPP_Compound;
      
      public var ibody:ZPP_Body;
      
      public var group:ZPP_InteractionGroup;
      
      public function dealloc_cbSet() : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = null as ZPP_CbSet;
         var _loc4_:* = null as ZPP_CbType;
         var _loc1_:ZPP_Space = ishape != null?ishape.body == null?null:ishape.body.space:ibody != null?ibody.space:icompound.space;
         if(cbSet != null)
         {
            cbSet.interactors.remove(this);
            _loc1_.nullInteractorType(this);
            _loc2_ = cbSet.count - 1;
            cbSet.count = _loc2_;
            if(_loc2_ == 0)
            {
               _loc1_.cbsets.remove(cbSet);
               _loc3_ = cbSet;
               _loc3_.listeners.clear();
               _loc3_.zip_listeners = true;
               _loc3_.bodylisteners.clear();
               _loc3_.zip_bodylisteners = true;
               _loc3_.conlisteners.clear();
               _loc3_.zip_conlisteners = true;
               while(_loc3_.cbTypes.head != null)
               {
                  _loc4_ = _loc3_.cbTypes.pop_unsafe();
                  _loc4_.cbsets.remove(_loc3_);
               }
               null;
               _loc3_.next = ZPP_CbSet.zpp_pool;
               ZPP_CbSet.zpp_pool = _loc3_;
            }
            cbSet = null;
         }
      }
      
      public function copyto(param1:nape.phys.Interactor) : void
      {
         var _loc4_:* = null as CbType;
         param1.zpp_inner_i.group = group;
         var _loc2_:Interactor = outer_i;
         if(_loc2_.zpp_inner_i.wrap_cbTypes == null)
         {
            _loc2_.zpp_inner_i.setupcbTypes();
         }
         var _loc3_:* = _loc2_.zpp_inner_i.wrap_cbTypes.iterator();
         while(_loc3_.hasNext())
         {
            _loc4_ = _loc3_.next();
            if(param1.zpp_inner_i.wrap_cbTypes == null)
            {
               param1.zpp_inner_i.setupcbTypes();
            }
            param1.zpp_inner_i.wrap_cbTypes.add(_loc4_);
         }
      }
      
      public var cbsets:ZNPList_ZPP_CallbackSet;
      
      public var cbTypes:ZNPList_ZPP_CbType;
      
      public var cbSet:ZPP_CbSet;
      
      public function alloc_cbSet() : void
      {
         var _loc1_:ZPP_Space = ishape != null?ishape.body == null?null:ishape.body.space:ibody != null?ibody.space:icompound.space;
         var _loc2_:ZPP_CbSet = _loc1_.cbsets.get(cbTypes);
         cbSet = _loc2_;
         if(_loc2_ != null)
         {
            cbSet.count = cbSet.count + 1;
            cbSet.interactors.add(this);
            cbSet.validate();
            _loc1_.freshInteractorType(this);
         }
      }
      
      public function __iremovedFromSpace() : void
      {
         var _loc1_:* = 0;
         var _loc3_:* = null as ZPP_CbType;
         if(group != null)
         {
            _loc1_ = -1;
            group.interactors.remove(this);
         }
         var _loc2_:ZNPNode_ZPP_CbType = cbTypes.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            _loc3_.interactors.remove(this);
            _loc2_ = _loc2_.next;
         }
         dealloc_cbSet();
      }
      
      public function __iaddedToSpace() : void
      {
         var _loc2_:* = null as ZPP_CbType;
         if(group != null)
         {
            group.interactors.add(this);
         }
         var _loc1_:ZNPNode_ZPP_CbType = cbTypes.head;
         while(_loc1_ != null)
         {
            _loc2_ = _loc1_.elt;
            _loc2_.interactors.add(this);
            _loc1_ = _loc1_.next;
         }
         alloc_cbSet();
      }
   }
}
