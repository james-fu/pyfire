package zpp_nape.util
{
   import nape.dynamics.ContactIterator;
   
   public class ZNPNode_ContactIterator extends Object
   {
      
      public function ZNPNode_ContactIterator()
      {
      }
      
      public static var zpp_pool:ZNPNode_ContactIterator;
      
      public var next:ZNPNode_ContactIterator;
      
      public var elt:ContactIterator;
   }
}
