package
{
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	import views.MainView;
	
	public class StarlingTest extends Sprite
	{
		private var _starling:Starling;
		
		public function StarlingTest()
		{
			super();
			
			if(stage){
				addEventListener(Event.ADDED_TO_STAGE, _init);
			}else{
				_init();
			}
		}
		
		private function _init(event:Event = null):void
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			stage.addEventListener(Event.DEACTIVATE, _onDeactive);
			
			// autoOrients をサポート
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_startup();
		}
		
		private function _startup():void
		{
			var viewport:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			_starling = new Starling(MainView, stage, viewport);
			_starling.stage.stageWidth = viewport.width;
			_starling.stage.stageHeight = viewport.height;
			_starling.nativeStage.frameRate = 60;
			_starling.enableErrorChecking = false;
			_starling.simulateMultitouch = true;
			_starling.supportHighResolutions = true;
			_starling.start();
			
			_starling.showStats = true;
//			Starling.current.showStatsAt('left', 'top', 2);
		}
		
		private function _onDeactive(event:Event):void
		{
//			NativeApplication.nativeApplication.exit();
		}
	}
}