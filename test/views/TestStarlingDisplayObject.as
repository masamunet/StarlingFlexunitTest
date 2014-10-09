package test.views
{
	import flash.events.Event;
	
	import org.flexunit.async.Async;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.display.Stage;
	
	import test.FlexUnitStarlingIntegration;

	public class TestStarlingDisplayObject
	{
		protected var _starling:Starling;
		
		public function start():void
		{
			_starling = new Starling(FlexUnitStarlingIntegration, FlexUnitStarlingIntegration.nativeStage);
			Async.proceedOnEvent(this, FlexUnitStarlingIntegration.nativeStage, Event.COMPLETE, 15500);
			_starling.nativeStage.frameRate = 60;
			_starling.enableErrorChecking = false;
			_starling.simulateMultitouch = true;
			_starling.supportHighResolutions = true;
			_starling.start();
			_starling.showStats = true;
			Starling.current.showStatsAt('left', 'top', 2);
		}
		
		public function stop():void
		{
			_starling.stop();
			_starling.dispose();
			_starling = null;
		}
		
		public function addChild(view:DisplayObject, isFit:Boolean = false):void
		{
			(Starling.current.root as Sprite).addChild(view);
			if(isFit){
				fit(view);
			}
		}
		
		public function fit(view:DisplayObject):void
		{
			var stage:Stage = Starling.current.stage;
			var root:DisplayObject = Starling.current.root;
			if(stage.stageHeight > stage.stageWidth){
				if(!long(view)){
					view.rotation = 90 * Math.PI / 180;
					view.x = view.width;
				}
			}else{
				if(long(view)){
					view.rotation = -90 * Math.PI / 180;
					view.y = view.height;
				}
			}
			root.width = stage.stageWidth
			root.scaleY = root.scaleX;
			if(root.height > stage.stageHeight){
				root.height = stage.stageHeight;
				root.scaleX = root.scaleY;
			}
		}
		
		public function long(view:DisplayObject):Boolean
		{
			return (view.height > view.width);
		}
	}
}