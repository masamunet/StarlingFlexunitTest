package views
{
	import a24.tween.Tween24;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class GrowthView extends Sprite
	{
		public function GrowthView()
		{
			super();
			if(MainView.assets){
				init();
			}else{
				MainView.setup(init);
			}
		}
		
		public function init():void
		{
			var w:Number = Starling.current.stage.stageWidth;
			var h:Number = Starling.current.stage.stageHeight;
			var texture:Texture = MainView.assets.getTexture('mamu');
			var iconPivotX:Number = texture.width >> 1;
			var iconPivotY:Number = texture.height >> 1;
			addEventListener(Event.ENTER_FRAME, function(event:Event):void{
				if(numChildren > 500){
					removeChildAt(0);
				}
				var icon:Image = new Image(texture);
				icon.x = Math.random() * w;
				icon.y = Math.random() * h;
				icon.pivotX = iconPivotX;
				icon.pivotY = iconPivotY;
				icon.scaleX = icon.scaleY = 0;
				addChild(icon);
				Tween24.tween(icon, 0.4, Tween24.ease.BackOut).scale(2).play();
			});
		}
	}
}