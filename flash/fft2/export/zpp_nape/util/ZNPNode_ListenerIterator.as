package zpp_nape.util
{
   import nape.callbacks.ListenerIterator;
   
   public class ZNPNode_ListenerIterator extends Object
   {
      
      public function ZNPNode_ListenerIterator()
      {
      }
      
      public static var zpp_pool:ZNPNode_ListenerIterator;
      
      public var next:ZNPNode_ListenerIterator;
      
      public var elt:ListenerIterator;
   }
}
