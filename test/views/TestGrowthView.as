package test.views
{
	import views.GrowthView;

	public class TestGrowthView extends TestStarlingDisplayObject
	{		
		[Before(async, ui)]
		public function setUp():void
		{
			start();
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test(async, ui, timeout=1500)]
		public function testView():void
		{
			addChild(new GrowthView);
		}
		
	}
}