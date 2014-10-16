import Quick
import Nimble
import UIKit

class FeedTableViewCellSpec: QuickSpec {
    override func spec() {
        
        var cell:FeedTableViewCell!
        
        describe("A Cell") {
    
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
                let navController:UINavigationController = storyboard.instantiateViewControllerWithIdentifier("NavigationVC") as UINavigationController
                let feedViewController = navController.topViewController as FeedViewController
                let view = feedViewController.view
                let tableView = feedViewController.tableView
                let indexPath = NSIndexPath(forRow: 0, inSection: 0)
                cell = feedViewController.tableView(tableView, cellForRowAtIndexPath:indexPath) as FeedTableViewCell
            }
            
            it("Initializes") {
                expect(cell).toNot(beNil())
            }
            
            
            it("Has a name label") {
                let name = "Daniel Rakhamimov"
                cell.nameLabel.text = name
                expect(cell.nameLabel.text) == name
            }
            
            it ("Has an event description label") {
                let description = "is Dowwn to go to the movies at 10"
                cell.descriptionLabel.text = description
                expect(cell.descriptionLabel.text) == description
                
            }
            
        }
    }
}
