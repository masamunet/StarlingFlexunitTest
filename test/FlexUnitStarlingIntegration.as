package test
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class FlexUnitStarlingIntegration extends Sprite
	{
		private static var _nativeStage:Stage;
		
		public function FlexUnitStarlingIntegration()
		{
			super();
			if(_nativeStage){
				_clearStage();
			}
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function _clearStage():void
		{
			for(var i:int = 0, l:int = _nativeStage.numChildren; i < l;i++){
				var c:DisplayObject = _nativeStage.getChildAt(i);
				if(c && c is DisplayObject){
					c.visible = false;
				}
			}
		}
		
		private function onAddedToStage(event:starling.events.Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			nativeStage.dispatchEvent(new flash.events.Event(flash.events.Event.COMPLETE));
		}
		
		public static function get nativeStage():Stage
		{
			return _nativeStage;
		}
		
		public static function set nativeStage(value:Stage):void
		{
			_nativeStage = value;
		}
	}
}