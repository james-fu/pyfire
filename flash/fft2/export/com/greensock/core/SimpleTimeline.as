package com.greensock.core
{
   public class SimpleTimeline extends Animation
   {
      
      public function SimpleTimeline(param1:Object = null)
      {
         super(0,param1);
         this.autoRemoveChildren = this.smoothChildTiming = true;
      }
      
      public function _remove(param1:Animation, param2:Boolean = false) : *
      {
         if(param1.timeline == this)
         {
            if(!param2)
            {
               param1._enabled(false,true);
            }
            param1.timeline = null;
            if(param1._prev)
            {
               param1._prev._next = param1._next;
            }
            else if(_first === param1)
            {
               _first = param1._next;
            }
            
            if(param1._next)
            {
               param1._next._prev = param1._prev;
            }
            else if(_last === param1)
            {
               _last = param1._prev;
            }
            
            if(_timeline)
            {
               _uncache(true);
            }
         }
         return this;
      }
      
      public function rawTime() : Number
      {
         return _totalTime;
      }
      
      public var _first:Animation;
      
      public var autoRemoveChildren:Boolean;
      
      public var _last:Animation;
      
      override public function render(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:Animation = null;
         var _loc4_:Animation = _first;
         _totalTime = _time = _rawPrevTime = param1;
         while(_loc4_)
         {
            _loc5_ = _loc4_._next;
            if((_loc4_._active) || param1 >= _loc4_._startTime && !_loc4_._paused)
            {
               if(!_loc4_._reversed)
               {
                  _loc4_.render((param1 - _loc4_._startTime) * _loc4_._timeScale,param2,false);
               }
               else
               {
                  _loc4_.render((!_loc4_._dirty?_loc4_._totalDuration:_loc4_.totalDuration()) - (param1 - _loc4_._startTime) * _loc4_._timeScale,param2,false);
               }
            }
            _loc4_ = _loc5_;
         }
      }
      
      public var smoothChildTiming:Boolean;
      
      public function insert(param1:*, param2:* = 0) : *
      {
         var _loc4_:* = NaN;
         param1._startTime = Number(param2 || 0) + param1._delay;
         if(param1._paused)
         {
            if(this != param1._timeline)
            {
               param1._pauseTime = param1._startTime + (rawTime() - param1._startTime) / param1._timeScale;
            }
         }
         if(param1.timeline)
         {
            param1.timeline._remove(param1,true);
         }
         param1.timeline = param1._timeline = this;
         if(param1._gc)
         {
            param1._enabled(true,true);
         }
         var _loc3_:Animation = _last;
         if(_sortChildren)
         {
            _loc4_ = param1._startTime;
            while((_loc3_) && _loc3_._startTime > _loc4_)
            {
               _loc3_ = _loc3_._prev;
            }
         }
         if(_loc3_)
         {
            param1._next = _loc3_._next;
            _loc3_._next = Animation(param1);
         }
         else
         {
            param1._next = _first;
            _first = Animation(param1);
         }
         if(param1._next)
         {
            param1._next._prev = param1;
         }
         else
         {
            _last = Animation(param1);
         }
         param1._prev = _loc3_;
         if(_timeline)
         {
            _uncache(true);
         }
         return this;
      }
      
      public var _sortChildren:Boolean;
   }
}
