package zpp_nape.util
{
   import nape.geom.RayResultIterator;
   
   public class ZNPNode_RayResultIterator extends Object
   {
      
      public function ZNPNode_RayResultIterator()
      {
      }
      
      public static var zpp_pool:ZNPNode_RayResultIterator;
      
      public var next:ZNPNode_RayResultIterator;
      
      public var elt:RayResultIterator;
   }
}
