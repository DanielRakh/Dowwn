import Quick
import Nimble
import UIKit
//import Dowwn

class FeedViewControllerSpec: QuickSpec {
    override func spec() {
        
        var viewController:FeedViewController!
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
            let navController:UINavigationController = storyboard.instantiateViewControllerWithIdentifier("NavigationVC") as UINavigationController
            viewController = navController.topViewController as? FeedViewController
        }
        
        describe("viewDidLoad") {
            
            beforeEach{
                let view = viewController.view
            }
            
            it("loads the table view with one cell") {
                let tableView = viewController.tableView
                var indexPath = NSIndexPath(forRow: 0, inSection: 0)
                var cell = viewController.tableView(tableView, cellForRowAtIndexPath: indexPath) as FeedTableViewCell
                expect(cell).to(beAnInstanceOf(FeedTableViewCell))
            }
        }
    }
}
