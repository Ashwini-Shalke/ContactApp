import UIKit

class calculate {
    
    let number = 10
    typealias Compliation = (Int) -> Void
    
    
    init(){
        self.doAdd { result in
            print(result)
        }
    }
    
    func doAdd(handler: Compliation ) {
        let result = number * number
        handler(result)
    }
    
}

calculate()
