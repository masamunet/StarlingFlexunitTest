package models
{
	import starling.display.Sprite;
	
	import views.GrowthView;
	import views.ProtrudeView;

	public class MainModel
	{
		private var _scenes:Vector.<Sprite>;
		private var _currentScene:int;
		
		public function MainModel()
		{
			init();
		}
		
		public function init():void
		{
			_scenes = Vector.<Sprite>([
				new GrowthView, new ProtrudeView
			]);
		}
		
		public function get current():Sprite
		{
			return _scenes[_currentScene];
		}
		
		public function next():void
		{
			_currentScene++;
			if(_currentScene >= _scenes.length){
				_currentScene = 0;
			}
		}
	}
}