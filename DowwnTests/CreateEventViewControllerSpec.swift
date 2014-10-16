import Quick
import Nimble
import UIKit


class CreateEventViewControllerSpec: QuickSpec {
    override func spec() {
        
        var viewController:CreateEventViewController!
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
         viewController = storyboard.instantiateViewControllerWithIdentifier("CreateEventVC") as CreateEventViewController
        }
        
        describe("viewDidLoad") {
            
            beforeEach {
                let view = viewController.view
            }
            
            it("is an instance of UIViewController") {
                
                expect(viewController).to(beAnInstanceOf(CreateEventViewController))
            }
        }
    }
}
