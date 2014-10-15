import Quick
import Nimble
import UIKit
//import Dowwn

class FeedViewControllerSpec: QuickSpec {
    override func spec() {
        var feedViewController:FeedViewController!
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
            let navController:UINavigationController = storyboard.instantiateViewControllerWithIdentifier("NavigationVC") as UINavigationController
            feedViewController = navController.topViewController as? FeedViewController
        }
        
        describe("viewDidLoad") {
            
            beforeEach{
                feedViewController.loadView()
            }
            
            it("loads the table view with one cell") {
                println(feedViewController)
                let tableView = feedViewController.tableView
                var indexPath = NSIndexPath(forRow: 0, inSection: 0)
                var cell = feedViewController.tableView(tableView, cellForRowAtIndexPath: indexPath)
                expect(cell.textLabel?.text).to(equal("This is the title"))
            }
        }
    }
}
