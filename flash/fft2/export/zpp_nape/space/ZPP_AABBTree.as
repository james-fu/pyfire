package zpp_nape.space
{
   import zpp_nape.geom.ZPP_AABB;
   import nape.geom.Vec2;
   import nape.geom.AABB;
   import zpp_nape.shape.ZPP_Shape;
   
   public class ZPP_AABBTree extends Object
   {
      
      public function ZPP_AABBTree()
      {
      }
      
      public static var tmpaabb:ZPP_AABB;
      
      public var root:ZPP_AABBNode;
      
      public function removeLeaf(param1:ZPP_AABBNode) : void
      {
         var _loc2_:* = null as ZPP_AABBNode;
         var _loc3_:* = null as ZPP_AABBNode;
         var _loc4_:* = null as ZPP_AABBNode;
         var _loc5_:* = null as ZPP_AABBNode;
         var _loc6_:* = null as ZPP_AABB;
         var _loc7_:* = null as Vec2;
         var _loc8_:* = null as ZPP_AABBNode;
         var _loc9_:* = null as ZPP_AABBNode;
         var _loc10_:* = 0;
         var _loc11_:* = null as ZPP_AABBNode;
         var _loc12_:* = null as ZPP_AABBNode;
         var _loc13_:* = null as ZPP_AABB;
         var _loc14_:* = null as ZPP_AABB;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         if(param1 == root)
         {
            root = null;
            null;
         }
         else
         {
            _loc2_ = param1.parent;
            _loc3_ = _loc2_.parent;
            _loc4_ = _loc2_.child1 == param1?_loc2_.child2:_loc2_.child1;
            if(_loc3_ != null)
            {
               if(_loc3_.child1 == _loc2_)
               {
                  _loc3_.child1 = _loc4_;
               }
               else
               {
                  _loc3_.child2 = _loc4_;
               }
               _loc4_.parent = _loc3_;
               _loc5_ = _loc2_;
               _loc5_.height = -1;
               _loc6_ = _loc5_.aabb;
               if(_loc6_.outer != null)
               {
                  _loc6_.outer.zpp_inner = null;
                  _loc6_.outer = null;
               }
               _loc7_ = null;
               _loc6_.wrap_max = _loc7_;
               _loc6_.wrap_min = _loc7_;
               _loc6_._invalidate = null;
               _loc6_._validate = null;
               _loc6_.next = ZPP_AABB.zpp_pool;
               ZPP_AABB.zpp_pool = _loc6_;
               _loc8_ = null;
               _loc5_.parent = _loc8_;
               _loc8_ = _loc8_;
               _loc5_.child2 = _loc8_;
               _loc5_.child1 = _loc8_;
               _loc5_.next = null;
               _loc5_.snext = null;
               _loc5_.mnext = null;
               _loc5_.next = ZPP_AABBNode.zpp_pool;
               ZPP_AABBNode.zpp_pool = _loc5_;
               _loc5_ = _loc3_;
               while(_loc5_ != null)
               {
                  if(_loc5_.child1 != null)
                  {
                     true;
                  }
                  if(!true)
                  {
                     _loc8_ = _loc5_.child1;
                     _loc9_ = _loc5_.child2;
                     _loc10_ = _loc9_.height - _loc8_.height;
                     if(_loc10_ > 1)
                     {
                        _loc11_ = _loc9_.child1;
                        _loc12_ = _loc9_.child2;
                        _loc9_.child1 = _loc5_;
                        _loc9_.parent = _loc5_.parent;
                        _loc5_.parent = _loc9_;
                        if(_loc9_.parent != null)
                        {
                           if(_loc9_.parent.child1 == _loc5_)
                           {
                              _loc9_.parent.child1 = _loc9_;
                           }
                           else
                           {
                              _loc9_.parent.child2 = _loc9_;
                           }
                        }
                        else
                        {
                           root = _loc9_;
                        }
                        if(_loc11_.height > _loc12_.height)
                        {
                           _loc9_.child2 = _loc11_;
                           _loc5_.child2 = _loc12_;
                           _loc12_.parent = _loc5_;
                           _loc6_ = _loc5_.aabb;
                           _loc13_ = _loc8_.aabb;
                           _loc14_ = _loc12_.aabb;
                           _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                           _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                           _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                           _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                           _loc6_ = _loc9_.aabb;
                           _loc13_ = _loc5_.aabb;
                           _loc14_ = _loc11_.aabb;
                           _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                           _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                           _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                           _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                           _loc15_ = _loc8_.height;
                           _loc16_ = _loc12_.height;
                           _loc5_.height = 1 + (_loc15_ > _loc16_?_loc15_:_loc16_);
                           _loc15_ = _loc5_.height;
                           _loc16_ = _loc11_.height;
                           _loc9_.height = 1 + (_loc15_ > _loc16_?_loc15_:_loc16_);
                        }
                        else
                        {
                           _loc9_.child2 = _loc12_;
                           _loc5_.child2 = _loc11_;
                           _loc11_.parent = _loc5_;
                           _loc6_ = _loc5_.aabb;
                           _loc13_ = _loc8_.aabb;
                           _loc14_ = _loc11_.aabb;
                           _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                           _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                           _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                           _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                           _loc6_ = _loc9_.aabb;
                           _loc13_ = _loc5_.aabb;
                           _loc14_ = _loc12_.aabb;
                           _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                           _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                           _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                           _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                           _loc15_ = _loc8_.height;
                           _loc16_ = _loc11_.height;
                           _loc5_.height = 1 + (_loc15_ > _loc16_?_loc15_:_loc16_);
                           _loc15_ = _loc5_.height;
                           _loc16_ = _loc12_.height;
                           _loc9_.height = 1 + (_loc15_ > _loc16_?_loc15_:_loc16_);
                        }
                     }
                     else if(_loc10_ < -1)
                     {
                        _loc11_ = _loc8_.child1;
                        _loc12_ = _loc8_.child2;
                        _loc8_.child1 = _loc5_;
                        _loc8_.parent = _loc5_.parent;
                        _loc5_.parent = _loc8_;
                        if(_loc8_.parent != null)
                        {
                           if(_loc8_.parent.child1 == _loc5_)
                           {
                              _loc8_.parent.child1 = _loc8_;
                           }
                           else
                           {
                              _loc8_.parent.child2 = _loc8_;
                           }
                        }
                        else
                        {
                           root = _loc8_;
                        }
                        if(_loc11_.height > _loc12_.height)
                        {
                           _loc8_.child2 = _loc11_;
                           _loc5_.child1 = _loc12_;
                           _loc12_.parent = _loc5_;
                           _loc6_ = _loc5_.aabb;
                           _loc13_ = _loc9_.aabb;
                           _loc14_ = _loc12_.aabb;
                           _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                           _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                           _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                           _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                           _loc6_ = _loc8_.aabb;
                           _loc13_ = _loc5_.aabb;
                           _loc14_ = _loc11_.aabb;
                           _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                           _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                           _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                           _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                           _loc15_ = _loc9_.height;
                           _loc16_ = _loc12_.height;
                           _loc5_.height = 1 + (_loc15_ > _loc16_?_loc15_:_loc16_);
                           _loc15_ = _loc5_.height;
                           _loc16_ = _loc11_.height;
                           _loc8_.height = 1 + (_loc15_ > _loc16_?_loc15_:_loc16_);
                        }
                        else
                        {
                           _loc8_.child2 = _loc12_;
                           _loc5_.child1 = _loc11_;
                           _loc11_.parent = _loc5_;
                           _loc6_ = _loc5_.aabb;
                           _loc13_ = _loc9_.aabb;
                           _loc14_ = _loc11_.aabb;
                           _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                           _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                           _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                           _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                           _loc6_ = _loc8_.aabb;
                           _loc13_ = _loc5_.aabb;
                           _loc14_ = _loc12_.aabb;
                           _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                           _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                           _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                           _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                           _loc15_ = _loc9_.height;
                           _loc16_ = _loc11_.height;
                           _loc5_.height = 1 + (_loc15_ > _loc16_?_loc15_:_loc16_);
                           _loc15_ = _loc5_.height;
                           _loc16_ = _loc12_.height;
                           _loc8_.height = 1 + (_loc15_ > _loc16_?_loc15_:_loc16_);
                        }
                     }
                     
                  }
                  if(true)
                  {
                     _loc5_ = _loc5_;
                     _loc8_ = _loc5_.child1;
                     _loc9_ = _loc5_.child2;
                     _loc6_ = _loc5_.aabb;
                     _loc13_ = _loc8_.aabb;
                     _loc14_ = _loc9_.aabb;
                     _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                     _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                     _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                     _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                     _loc10_ = _loc8_.height;
                     _loc15_ = _loc9_.height;
                     _loc5_.height = 1 + (_loc10_ > _loc15_?_loc10_:_loc15_);
                     _loc5_ = _loc5_.parent;
                  }
                  else
                  {
                     _loc5_ = _loc10_ > 1?_loc9_:_loc10_ < -1?_loc8_:_loc5_;
                     _loc8_ = _loc5_.child1;
                     _loc9_ = _loc5_.child2;
                     _loc6_ = _loc5_.aabb;
                     _loc13_ = _loc8_.aabb;
                     _loc14_ = _loc9_.aabb;
                     _loc6_.minx = _loc13_.minx < _loc14_.minx?_loc13_.minx:_loc14_.minx;
                     _loc6_.miny = _loc13_.miny < _loc14_.miny?_loc13_.miny:_loc14_.miny;
                     _loc6_.maxx = _loc13_.maxx > _loc14_.maxx?_loc13_.maxx:_loc14_.maxx;
                     _loc6_.maxy = _loc13_.maxy > _loc14_.maxy?_loc13_.maxy:_loc14_.maxy;
                     _loc10_ = _loc8_.height;
                     _loc15_ = _loc9_.height;
                     _loc5_.height = 1 + (_loc10_ > _loc15_?_loc10_:_loc15_);
                     _loc5_ = _loc5_.parent;
                  }
               }
            }
            else
            {
               root = _loc4_;
               _loc4_.parent = null;
               _loc5_ = _loc2_;
               _loc5_.height = -1;
               _loc6_ = _loc5_.aabb;
               if(_loc6_.outer != null)
               {
                  _loc6_.outer.zpp_inner = null;
                  _loc6_.outer = null;
               }
               _loc7_ = null;
               _loc6_.wrap_max = _loc7_;
               _loc6_.wrap_min = _loc7_;
               _loc6_._invalidate = null;
               _loc6_._validate = null;
               _loc6_.next = ZPP_AABB.zpp_pool;
               ZPP_AABB.zpp_pool = _loc6_;
               _loc8_ = null;
               _loc5_.parent = _loc8_;
               _loc8_ = _loc8_;
               _loc5_.child2 = _loc8_;
               _loc5_.child1 = _loc8_;
               _loc5_.next = null;
               _loc5_.snext = null;
               _loc5_.mnext = null;
               _loc5_.next = ZPP_AABBNode.zpp_pool;
               ZPP_AABBNode.zpp_pool = _loc5_;
            }
         }
      }
      
      public function insertLeaf(param1:ZPP_AABBNode) : void
      {
         var _loc2_:* = null as ZPP_AABB;
         var _loc3_:* = null as ZPP_AABBNode;
         var _loc4_:* = null as ZPP_AABBNode;
         var _loc5_:* = null as ZPP_AABBNode;
         var _loc6_:* = NaN;
         var _loc7_:* = null as ZPP_AABB;
         var _loc8_:* = null as ZPP_AABB;
         var _loc9_:* = NaN;
         var _loc10_:* = NaN;
         var _loc11_:* = NaN;
         var _loc12_:* = NaN;
         var _loc13_:* = NaN;
         var _loc14_:* = NaN;
         var _loc15_:* = NaN;
         var _loc16_:* = null as ZPP_AABBNode;
         var _loc17_:* = null as ZPP_AABBNode;
         var _loc18_:* = null as ZPP_AABBNode;
         var _loc19_:* = 0;
         var _loc20_:* = null as ZPP_AABBNode;
         var _loc21_:* = null as ZPP_AABBNode;
         var _loc22_:* = null as ZPP_AABB;
         var _loc23_:* = 0;
         var _loc24_:* = 0;
         if(root == null)
         {
            root = param1;
            root.parent = null;
         }
         else
         {
            _loc2_ = param1.aabb;
            _loc3_ = root;
            while(_loc3_.child1 != null)
            {
               _loc4_ = _loc3_.child1;
               _loc5_ = _loc3_.child2;
               _loc7_ = _loc3_.aabb;
               _loc6_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2;
               _loc7_ = ZPP_AABBTree.tmpaabb;
               _loc8_ = _loc3_.aabb;
               _loc7_.minx = _loc8_.minx < _loc2_.minx?_loc8_.minx:_loc2_.minx;
               _loc7_.miny = _loc8_.miny < _loc2_.miny?_loc8_.miny:_loc2_.miny;
               _loc7_.maxx = _loc8_.maxx > _loc2_.maxx?_loc8_.maxx:_loc2_.maxx;
               _loc7_.maxy = _loc8_.maxy > _loc2_.maxy?_loc8_.maxy:_loc2_.maxy;
               _loc7_ = ZPP_AABBTree.tmpaabb;
               _loc9_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2;
               _loc10_ = 2 * _loc9_;
               _loc11_ = 2 * (_loc9_ - _loc6_);
               _loc7_ = ZPP_AABBTree.tmpaabb;
               _loc8_ = _loc4_.aabb;
               _loc7_.minx = _loc2_.minx < _loc8_.minx?_loc2_.minx:_loc8_.minx;
               _loc7_.miny = _loc2_.miny < _loc8_.miny?_loc2_.miny:_loc8_.miny;
               _loc7_.maxx = _loc2_.maxx > _loc8_.maxx?_loc2_.maxx:_loc8_.maxx;
               _loc7_.maxy = _loc2_.maxy > _loc8_.maxy?_loc2_.maxy:_loc8_.maxy;
               if(_loc4_.child1 == null)
               {
                  _loc7_ = ZPP_AABBTree.tmpaabb;
               }
               else
               {
                  _loc7_ = _loc4_.aabb;
                  _loc13_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2;
                  _loc7_ = ZPP_AABBTree.tmpaabb;
                  _loc14_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2;
               }
               if(_loc4_.child1 == null)
               {
                  _loc12_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2 + _loc11_;
                  _loc7_ = ZPP_AABBTree.tmpaabb;
                  _loc8_ = _loc5_.aabb;
                  _loc7_.minx = _loc2_.minx < _loc8_.minx?_loc2_.minx:_loc8_.minx;
                  _loc7_.miny = _loc2_.miny < _loc8_.miny?_loc2_.miny:_loc8_.miny;
                  _loc7_.maxx = _loc2_.maxx > _loc8_.maxx?_loc2_.maxx:_loc8_.maxx;
                  _loc7_.maxy = _loc2_.maxy > _loc8_.maxy?_loc2_.maxy:_loc8_.maxy;
                  if(_loc5_.child1 == null)
                  {
                     _loc7_ = ZPP_AABBTree.tmpaabb;
                  }
                  else
                  {
                     _loc7_ = _loc5_.aabb;
                     _loc14_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2;
                     _loc7_ = ZPP_AABBTree.tmpaabb;
                     _loc15_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2;
                  }
                  if(_loc5_.child1 == null)
                  {
                     _loc13_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2 + _loc11_;
                     if(_loc10_ < _loc12_)
                     {
                        false;
                     }
                     if(false)
                     {
                        break;
                     }
                     _loc3_ = _loc12_ < _loc13_?_loc4_:_loc5_;
                  }
                  else
                  {
                     _loc13_ = _loc15_ - _loc14_ + _loc11_;
                     if(_loc10_ < _loc12_)
                     {
                        false;
                     }
                     if(false)
                     {
                        break;
                     }
                     _loc3_ = _loc12_ < _loc13_?_loc4_:_loc5_;
                  }
               }
               else
               {
                  _loc12_ = _loc14_ - _loc13_ + _loc11_;
                  _loc7_ = ZPP_AABBTree.tmpaabb;
                  _loc8_ = _loc5_.aabb;
                  _loc7_.minx = _loc2_.minx < _loc8_.minx?_loc2_.minx:_loc8_.minx;
                  _loc7_.miny = _loc2_.miny < _loc8_.miny?_loc2_.miny:_loc8_.miny;
                  _loc7_.maxx = _loc2_.maxx > _loc8_.maxx?_loc2_.maxx:_loc8_.maxx;
                  _loc7_.maxy = _loc2_.maxy > _loc8_.maxy?_loc2_.maxy:_loc8_.maxy;
                  if(_loc5_.child1 == null)
                  {
                     _loc7_ = ZPP_AABBTree.tmpaabb;
                  }
                  else
                  {
                     _loc7_ = _loc5_.aabb;
                     _loc14_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2;
                     _loc7_ = ZPP_AABBTree.tmpaabb;
                     _loc15_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2;
                  }
                  if(_loc5_.child1 == null)
                  {
                     _loc13_ = (_loc7_.maxx - _loc7_.minx + (_loc7_.maxy - _loc7_.miny)) * 2 + _loc11_;
                     if(_loc10_ < _loc12_)
                     {
                        false;
                     }
                     if(false)
                     {
                        break;
                     }
                     _loc3_ = _loc12_ < _loc13_?_loc4_:_loc5_;
                  }
                  else
                  {
                     _loc13_ = _loc15_ - _loc14_ + _loc11_;
                     if(_loc10_ < _loc12_)
                     {
                        false;
                     }
                     if(false)
                     {
                        break;
                     }
                     _loc3_ = _loc12_ < _loc13_?_loc4_:_loc5_;
                  }
               }
            }
            _loc4_ = _loc3_;
            _loc5_ = _loc4_.parent;
            if(ZPP_AABBNode.zpp_pool == null)
            {
               _loc16_ = new ZPP_AABBNode();
            }
            else
            {
               _loc16_ = ZPP_AABBNode.zpp_pool;
               ZPP_AABBNode.zpp_pool = _loc16_.next;
               _loc16_.next = null;
            }
            if(ZPP_AABB.zpp_pool == null)
            {
               _loc16_.aabb = new ZPP_AABB();
            }
            else
            {
               _loc16_.aabb = ZPP_AABB.zpp_pool;
               ZPP_AABB.zpp_pool = _loc16_.aabb.next;
               _loc16_.aabb.next = null;
            }
            null;
            _loc16_.moved = false;
            _loc16_.synced = false;
            _loc16_.first_sync = false;
            _loc16_.parent = _loc5_;
            _loc7_ = _loc16_.aabb;
            _loc8_ = _loc4_.aabb;
            _loc7_.minx = _loc2_.minx < _loc8_.minx?_loc2_.minx:_loc8_.minx;
            _loc7_.miny = _loc2_.miny < _loc8_.miny?_loc2_.miny:_loc8_.miny;
            _loc7_.maxx = _loc2_.maxx > _loc8_.maxx?_loc2_.maxx:_loc8_.maxx;
            _loc7_.maxy = _loc2_.maxy > _loc8_.maxy?_loc2_.maxy:_loc8_.maxy;
            _loc16_.height = _loc4_.height + 1;
            if(_loc5_ != null)
            {
               if(_loc5_.child1 == _loc4_)
               {
                  _loc5_.child1 = _loc16_;
               }
               else
               {
                  _loc5_.child2 = _loc16_;
               }
               _loc16_.child1 = _loc4_;
               _loc16_.child2 = param1;
               _loc4_.parent = _loc16_;
               param1.parent = _loc16_;
            }
            else
            {
               _loc16_.child1 = _loc4_;
               _loc16_.child2 = param1;
               _loc4_.parent = _loc16_;
               param1.parent = _loc16_;
               root = _loc16_;
            }
            _loc3_ = param1.parent;
            while(_loc3_ != null)
            {
               if(_loc3_.child1 != null)
               {
                  true;
               }
               if(!true)
               {
                  _loc17_ = _loc3_.child1;
                  _loc18_ = _loc3_.child2;
                  _loc19_ = _loc18_.height - _loc17_.height;
                  if(_loc19_ > 1)
                  {
                     _loc20_ = _loc18_.child1;
                     _loc21_ = _loc18_.child2;
                     _loc18_.child1 = _loc3_;
                     _loc18_.parent = _loc3_.parent;
                     _loc3_.parent = _loc18_;
                     if(_loc18_.parent != null)
                     {
                        if(_loc18_.parent.child1 == _loc3_)
                        {
                           _loc18_.parent.child1 = _loc18_;
                        }
                        else
                        {
                           _loc18_.parent.child2 = _loc18_;
                        }
                     }
                     else
                     {
                        root = _loc18_;
                     }
                     if(_loc20_.height > _loc21_.height)
                     {
                        _loc18_.child2 = _loc20_;
                        _loc3_.child2 = _loc21_;
                        _loc21_.parent = _loc3_;
                        _loc7_ = _loc3_.aabb;
                        _loc8_ = _loc17_.aabb;
                        _loc22_ = _loc21_.aabb;
                        _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                        _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                        _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                        _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                        _loc7_ = _loc18_.aabb;
                        _loc8_ = _loc3_.aabb;
                        _loc22_ = _loc20_.aabb;
                        _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                        _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                        _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                        _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                        _loc23_ = _loc17_.height;
                        _loc24_ = _loc21_.height;
                        _loc3_.height = 1 + (_loc23_ > _loc24_?_loc23_:_loc24_);
                        _loc23_ = _loc3_.height;
                        _loc24_ = _loc20_.height;
                        _loc18_.height = 1 + (_loc23_ > _loc24_?_loc23_:_loc24_);
                     }
                     else
                     {
                        _loc18_.child2 = _loc21_;
                        _loc3_.child2 = _loc20_;
                        _loc20_.parent = _loc3_;
                        _loc7_ = _loc3_.aabb;
                        _loc8_ = _loc17_.aabb;
                        _loc22_ = _loc20_.aabb;
                        _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                        _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                        _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                        _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                        _loc7_ = _loc18_.aabb;
                        _loc8_ = _loc3_.aabb;
                        _loc22_ = _loc21_.aabb;
                        _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                        _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                        _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                        _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                        _loc23_ = _loc17_.height;
                        _loc24_ = _loc20_.height;
                        _loc3_.height = 1 + (_loc23_ > _loc24_?_loc23_:_loc24_);
                        _loc23_ = _loc3_.height;
                        _loc24_ = _loc21_.height;
                        _loc18_.height = 1 + (_loc23_ > _loc24_?_loc23_:_loc24_);
                     }
                  }
                  else if(_loc19_ < -1)
                  {
                     _loc20_ = _loc17_.child1;
                     _loc21_ = _loc17_.child2;
                     _loc17_.child1 = _loc3_;
                     _loc17_.parent = _loc3_.parent;
                     _loc3_.parent = _loc17_;
                     if(_loc17_.parent != null)
                     {
                        if(_loc17_.parent.child1 == _loc3_)
                        {
                           _loc17_.parent.child1 = _loc17_;
                        }
                        else
                        {
                           _loc17_.parent.child2 = _loc17_;
                        }
                     }
                     else
                     {
                        root = _loc17_;
                     }
                     if(_loc20_.height > _loc21_.height)
                     {
                        _loc17_.child2 = _loc20_;
                        _loc3_.child1 = _loc21_;
                        _loc21_.parent = _loc3_;
                        _loc7_ = _loc3_.aabb;
                        _loc8_ = _loc18_.aabb;
                        _loc22_ = _loc21_.aabb;
                        _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                        _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                        _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                        _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                        _loc7_ = _loc17_.aabb;
                        _loc8_ = _loc3_.aabb;
                        _loc22_ = _loc20_.aabb;
                        _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                        _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                        _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                        _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                        _loc23_ = _loc18_.height;
                        _loc24_ = _loc21_.height;
                        _loc3_.height = 1 + (_loc23_ > _loc24_?_loc23_:_loc24_);
                        _loc23_ = _loc3_.height;
                        _loc24_ = _loc20_.height;
                        _loc17_.height = 1 + (_loc23_ > _loc24_?_loc23_:_loc24_);
                     }
                     else
                     {
                        _loc17_.child2 = _loc21_;
                        _loc3_.child1 = _loc20_;
                        _loc20_.parent = _loc3_;
                        _loc7_ = _loc3_.aabb;
                        _loc8_ = _loc18_.aabb;
                        _loc22_ = _loc20_.aabb;
                        _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                        _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                        _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                        _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                        _loc7_ = _loc17_.aabb;
                        _loc8_ = _loc3_.aabb;
                        _loc22_ = _loc21_.aabb;
                        _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                        _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                        _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                        _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                        _loc23_ = _loc18_.height;
                        _loc24_ = _loc20_.height;
                        _loc3_.height = 1 + (_loc23_ > _loc24_?_loc23_:_loc24_);
                        _loc23_ = _loc3_.height;
                        _loc24_ = _loc21_.height;
                        _loc17_.height = 1 + (_loc23_ > _loc24_?_loc23_:_loc24_);
                     }
                  }
                  
               }
               if(true)
               {
                  _loc3_ = _loc3_;
                  _loc17_ = _loc3_.child1;
                  _loc18_ = _loc3_.child2;
                  _loc19_ = _loc17_.height;
                  _loc23_ = _loc18_.height;
                  _loc3_.height = 1 + (_loc19_ > _loc23_?_loc19_:_loc23_);
                  _loc7_ = _loc3_.aabb;
                  _loc8_ = _loc17_.aabb;
                  _loc22_ = _loc18_.aabb;
                  _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                  _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                  _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                  _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                  _loc3_ = _loc3_.parent;
               }
               else
               {
                  _loc3_ = _loc19_ > 1?_loc18_:_loc19_ < -1?_loc17_:_loc3_;
                  _loc17_ = _loc3_.child1;
                  _loc18_ = _loc3_.child2;
                  _loc19_ = _loc17_.height;
                  _loc23_ = _loc18_.height;
                  _loc3_.height = 1 + (_loc19_ > _loc23_?_loc19_:_loc23_);
                  _loc7_ = _loc3_.aabb;
                  _loc8_ = _loc17_.aabb;
                  _loc22_ = _loc18_.aabb;
                  _loc7_.minx = _loc8_.minx < _loc22_.minx?_loc8_.minx:_loc22_.minx;
                  _loc7_.miny = _loc8_.miny < _loc22_.miny?_loc8_.miny:_loc22_.miny;
                  _loc7_.maxx = _loc8_.maxx > _loc22_.maxx?_loc8_.maxx:_loc22_.maxx;
                  _loc7_.maxy = _loc8_.maxy > _loc22_.maxy?_loc8_.maxy:_loc22_.maxy;
                  _loc3_ = _loc3_.parent;
               }
            }
         }
      }
      
      public function clear() : void
      {
         var _loc2_:* = null as ZPP_AABBNode;
         var _loc3_:* = null as ZPP_AABBNode;
         var _loc4_:* = null as ZPP_AABB;
         var _loc5_:* = null as Vec2;
         var _loc6_:* = null as ZPP_AABBNode;
         if(root == null)
         {
            return;
         }
         var _loc1_:ZPP_AABBNode = null;
         root.next = _loc1_;
         _loc1_ = root;
         while(_loc1_ != null)
         {
            _loc3_ = _loc1_;
            _loc1_ = _loc3_.next;
            _loc3_.next = null;
            _loc2_ = _loc3_;
            if(_loc2_.child1 == null)
            {
               _loc2_.shape.node = null;
               _loc2_.shape.removedFromSpace();
               _loc2_.shape = null;
            }
            else
            {
               if(_loc2_.child1 != null)
               {
                  _loc2_.child1.next = _loc1_;
                  _loc1_ = _loc2_.child1;
               }
               if(_loc2_.child2 != null)
               {
                  _loc2_.child2.next = _loc1_;
                  _loc1_ = _loc2_.child2;
               }
            }
            _loc3_ = _loc2_;
            _loc3_.height = -1;
            _loc4_ = _loc3_.aabb;
            if(_loc4_.outer != null)
            {
               _loc4_.outer.zpp_inner = null;
               _loc4_.outer = null;
            }
            _loc5_ = null;
            _loc4_.wrap_max = _loc5_;
            _loc4_.wrap_min = _loc5_;
            _loc4_._invalidate = null;
            _loc4_._validate = null;
            _loc4_.next = ZPP_AABB.zpp_pool;
            ZPP_AABB.zpp_pool = _loc4_;
            _loc6_ = null;
            _loc3_.parent = _loc6_;
            _loc6_ = _loc6_;
            _loc3_.child2 = _loc6_;
            _loc3_.child1 = _loc6_;
            _loc3_.next = null;
            _loc3_.snext = null;
            _loc3_.mnext = null;
            _loc3_.next = ZPP_AABBNode.zpp_pool;
            ZPP_AABBNode.zpp_pool = _loc3_;
         }
         root = null;
      }
   }
}
