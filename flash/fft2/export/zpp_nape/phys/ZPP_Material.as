package zpp_nape.phys
{
   import nape.phys.Material;
   import nape.shape.ShapeList;
   import zpp_nape.util.ZNPList_ZPP_Shape;
   import zpp_nape.shape.ZPP_Shape;
   import zpp_nape.util.ZNPNode_ZPP_Shape;
   import flash._-2v;
   
   public class ZPP_Material extends Object
   {
      
      public function ZPP_Material()
      {
         if(_-2v._-7E)
         {
            return;
         }
         shapes = new ZNPList_ZPP_Shape();
         elasticity = 0;
         dynamicFriction = 1;
         staticFriction = 2;
         density = 0.001;
         rollingFriction = 0.01;
      }
      
      public static var zpp_pool:ZPP_Material;
      
      public static var WAKE:int;
      
      public static var PROPS:int;
      
      public static var ANGDRAG:int;
      
      public static var ARBITERS:int;
      
      public function wrapper() : Material
      {
         var _loc1_:* = null as ZPP_Material;
         if(outer == null)
         {
            outer = new Material();
            _loc1_ = outer.zpp_inner;
            _loc1_.outer = null;
            _loc1_.next = ZPP_Material.zpp_pool;
            ZPP_Material.zpp_pool = _loc1_;
            outer.zpp_inner = this;
         }
         return outer;
      }
      
      public var wrap_shapes:ShapeList;
      
      public var userData;
      
      public var staticFriction:Number;
      
      public var shapes:ZNPList_ZPP_Shape;
      
      public function set(param1:ZPP_Material) : void
      {
         dynamicFriction = param1.dynamicFriction;
         staticFriction = param1.staticFriction;
         density = param1.density;
         elasticity = param1.elasticity;
         rollingFriction = param1.rollingFriction;
      }
      
      public var rollingFriction:Number;
      
      public var outer:Material;
      
      public var next:ZPP_Material;
      
      public function invalidate(param1:int) : void
      {
         var _loc3_:* = null as ZPP_Shape;
         var _loc2_:ZNPNode_ZPP_Shape = shapes.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            _loc3_.invalidate_material(param1);
            _loc2_ = _loc2_.next;
         }
      }
      
      public var elasticity:Number;
      
      public var dynamicFriction:Number;
      
      public var density:Number;
      
      public function copy() : ZPP_Material
      {
         var _loc1_:ZPP_Material = new ZPP_Material();
         _loc1_.dynamicFriction = dynamicFriction;
         _loc1_.staticFriction = staticFriction;
         _loc1_.density = density;
         _loc1_.elasticity = elasticity;
         _loc1_.rollingFriction = rollingFriction;
         return _loc1_;
      }
   }
}
