package _-07
{
   import fla.win.w_RanOver;
   import flash.events.MouseEvent;
   import flash.events.KeyboardEvent;
   import _-9I._-E7;
   import _-7l._-Ez;
   
   public class _-Bs extends w_RanOver implements _-06
   {
      
      public function _-Bs(param1:Object, param2:_-Cf)
      {
         var _loc6_:* = true;
         if(!(_loc5_ && (_loc3_)))
         {
            super();
            if(_loc5_)
            {
            }
            this._-3t = param2;
            if(!(_loc5_ && (_loc3_)))
            {
               this.alpha = 0;
               if(_loc5_)
               {
               }
               _loc3_ = new _-Ez(this.btn_1);
               if(_loc6_)
               {
                  _loc3_.addListener(MouseEvent.CLICK,this._-9P);
                  if(_loc6_)
                  {
                     _-Ez._-9g(_loc3_);
                     if(_loc6_)
                     {
                        if(this._params.btn1Function != null)
                        {
                           if(_loc6_ || (this))
                           {
                              _loc3_._-32(this._params.btn1Function,this._params.btn1Params);
                           }
                        }
                     }
                  }
               }
               _loc4_ = new _-Ez(this.btn_2);
               _loc4_.addListener(MouseEvent.CLICK,this._-9P);
               if(_loc6_ || (param2))
               {
                  _-Ez._-9g(_loc4_);
                  if(!_loc5_)
                  {
                     if(this._params.btn2Function != null)
                     {
                        if(_loc6_ || (param1))
                        {
                           _loc4_._-32(this._params.btn2Function,this._params.btn2Params);
                           if(_loc5_ && (_loc3_))
                           {
                           }
                           return;
                        }
                     }
                  }
                  this._-L2 = [_loc3_,_loc4_];
                  if(_loc6_)
                  {
                  }
                  return;
               }
               this._-3t._-8d.stage.addEventListener(KeyboardEvent.KEY_DOWN,this._-Aa);
               return;
            }
            this.visible = false;
            _loc3_ = new _-Ez(this.btn_1);
            if(_loc6_)
            {
               _loc3_.addListener(MouseEvent.CLICK,this._-9P);
               if(_loc6_)
               {
                  _-Ez._-9g(_loc3_);
                  if(_loc6_)
                  {
                     if(this._params.btn1Function != null)
                     {
                        if(_loc6_ || (this))
                        {
                           _loc3_._-32(this._params.btn1Function,this._params.btn1Params);
                        }
                     }
                  }
               }
            }
            _loc4_ = new _-Ez(this.btn_2);
            _loc4_.addListener(MouseEvent.CLICK,this._-9P);
            if(_loc6_ || (param2))
            {
               _-Ez._-9g(_loc4_);
               if(!_loc5_)
               {
                  if(this._params.btn2Function != null)
                  {
                     if(_loc6_ || (param1))
                     {
                        _loc4_._-32(this._params.btn2Function,this._params.btn2Params);
                        if(_loc5_ && (_loc3_))
                        {
                        }
                        return;
                     }
                  }
               }
               this._-L2 = [_loc3_,_loc4_];
               if(_loc6_)
               {
               }
               return;
            }
            this._-3t._-8d.stage.addEventListener(KeyboardEvent.KEY_DOWN,this._-Aa);
            return;
         }
         this._params = param1;
         if(!(_loc5_ && (_loc3_)))
         {
            this._-3t = param2;
            if(!(_loc5_ && (_loc3_)))
            {
               this.alpha = 0;
               if(_loc5_)
               {
               }
            }
            this.visible = false;
         }
         var _loc3_:_-Ez = new _-Ez(this.btn_1);
         if(_loc6_)
         {
            _loc3_.addListener(MouseEvent.CLICK,this._-9P);
            if(_loc6_)
            {
               _-Ez._-9g(_loc3_);
               if(_loc6_)
               {
                  if(this._params.btn1Function != null)
                  {
                     if(_loc6_ || (this))
                     {
                        _loc3_._-32(this._params.btn1Function,this._params.btn1Params);
                     }
                  }
               }
            }
         }
         var _loc4_:_-Ez = new _-Ez(this.btn_2);
         _loc4_.addListener(MouseEvent.CLICK,this._-9P);
         if(_loc6_ || (param2))
         {
            _-Ez._-9g(_loc4_);
            if(!_loc5_)
            {
               if(this._params.btn2Function != null)
               {
                  if(_loc6_ || (param1))
                  {
                     _loc4_._-32(this._params.btn2Function,this._params.btn2Params);
                     if(_loc5_ && (_loc3_))
                     {
                     }
                     return;
                  }
               }
            }
            this._-L2 = [_loc3_,_loc4_];
            if(_loc6_)
            {
            }
            return;
         }
         this._-3t._-8d.stage.addEventListener(KeyboardEvent.KEY_DOWN,this._-Aa);
      }
      
      private var _-L2:Array;
      
      private var _params:Object;
      
      private var _-3t:_-Cf;
      
      private function _-9P(param1:MouseEvent) : void
      {
         var _loc2_:* = true;
         var _loc3_:* = false;
         if(_loc2_ || (param1))
         {
            this._-3t._-7v(this);
         }
      }
      
      private function _-Aa(param1:KeyboardEvent) : void
      {
         var _loc3_:* = true;
         if(!_loc2_)
         {
            if(_loc3_ || (param1))
            {
               if(param1.keyCode == 13 || param1.keyCode == 13)
               {
                  if(_loc3_)
                  {
                     this._-3t._-7v(this);
                     if(!(_loc2_ && (this)))
                     {
                        (this._params.btn1Function as Function).apply(null,this._params.btn1Params);
                        if(_loc3_ || (_loc3_))
                        {
                        }
                     }
                  }
               }
               return;
            }
            if(_loc3_ || (param1))
            {
               if(!_loc2_)
               {
                  if(param1.keyCode == 32)
                  {
                     if(_loc3_)
                     {
                        this._-3t._-7v(this);
                        if(!(_loc2_ && (this)))
                        {
                           (this._params.btn1Function as Function).apply(null,this._params.btn1Params);
                           if(_loc3_ || (_loc3_))
                           {
                           }
                        }
                     }
                  }
                  return;
               }
            }
            else
            {
               param1.keyCode == 13;
               if(!_loc2_)
               {
                  if(param1.keyCode == 32)
                  {
                     if(_loc3_)
                     {
                        this._-3t._-7v(this);
                        if(!(_loc2_ && (this)))
                        {
                           (this._params.btn1Function as Function).apply(null,this._params.btn1Params);
                           if(_loc3_ || (_loc3_))
                           {
                           }
                        }
                     }
                  }
                  return;
               }
            }
         }
         if(!_loc2_)
         {
            _-E7._-6Y();
            return;
         }
         _-E7._-6Y();
      }
      
      public function disassemble() : void
      {
         /*
          * Decompilation error
          * Code may be obfuscated
          * Error type: TranslateException
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to error");
      }
   }
}
