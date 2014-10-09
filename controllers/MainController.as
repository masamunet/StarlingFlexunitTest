package controllers
{
	import models.MainModel;
	
	import starling.core.Starling;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import views.GrowthView;
	import views.MainView;

	public class MainController
	{
		private var _view:MainView;
		private var _model:MainModel;
		
		public function MainController(view:MainView, model:MainModel)
		{
			_view = view;
			_model = model;
			init();
		}
		
		public function init():void
		{
			_view.addChild(_model.current);
			Starling.current.stage.addEventListener(TouchEvent.TOUCH, function(event:TouchEvent):void{
				var end:Touch = event.getTouch(Starling.current.stage, TouchPhase.ENDED);
				if(end){
					changeView();
				}
			});
		}
		
		public function changeView():void
		{
			_view.removeChildren();
			_model.next();
			_view.addChild(_model.current);
		}
	}
}