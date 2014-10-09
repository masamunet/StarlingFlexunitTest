package views
{
	import a24.tween.Tween24;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class ProtrudeView extends Sprite
	{
		public function ProtrudeView()
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
			var texture:Texture = MainView.assets.getTexture('yae');
			var iconPivotX:Number = texture.width >> 1;
			var iconPivotY:Number = texture.height >> 1;
			addEventListener(Event.ENTER_FRAME, function(event:Event):void{
				if(numChildren > 500){
					removeChildAt(0);
				}
				var icon:Image = new Image(texture);
				icon.x = w >> 1;
				icon.y = h >> 1;
				var toX:Number = Math.random() * w;
				var toY:Number = Math.random() * h;
				var randX:Number = Math.random() * w;
				var randY:Number = Math.random() * h;
				icon.pivotX = iconPivotX;
				icon.pivotY = iconPivotY;
				icon.scaleX = icon.scaleY = 0;
				icon.alpha = 0;
				addChild(icon);
				Tween24.tween(icon, 1, Tween24.ease.BackOut).scale(2).xy(toX, toY).alpha(1).bezier(randX, randY).play();
			});
		}
	}
}