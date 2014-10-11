package views
{
	import flash.filesystem.File;
	
	import controllers.MainController;
	
	import models.MainModel;
	
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	
	public class MainView extends Sprite
	{
		public static var assets:AssetManager;
		public function MainView()
		{
			super();
			setup(init);
		}
		
		public static function setup(callback:Function):void
		{
			assets = new AssetManager();
			assets.enqueue(File.applicationDirectory.resolvePath('assets/src/mamu.png'));
			assets.enqueue(File.applicationDirectory.resolvePath('assets/src/yae.png'));
			assets.loadQueue(function(ratio:Number):void{
				if(ratio >= 1){
					callback();
				}
			});
		}
		
		public function init():void
		{
			_setup();
		}
		
		private function _setup():void
		{
			new MainController(this, new MainModel);
		}
	}
}