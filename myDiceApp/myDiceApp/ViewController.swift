import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var diceImageView2: UIImageView!
	@IBOutlet weak var diceImageView1: UIImageView!
	
	let diceArray: [UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")] //#imageLiteral()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		changeUIImage()
	}

	@IBAction func rollButtonPressed(_ sender: Any) {
		
		changeUIImage()
	}
	func changeUIImage() {
		diceImageView1.image = diceArray.randomElement()
		diceImageView2.image = diceArray.randomElement()
		
	}
	
}

