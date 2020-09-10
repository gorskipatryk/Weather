import RxSwift
import UIKit

protocol ControllerOutputProducer: UIViewController {
    var output: Observable<ControllerOutput> { get }
    var disposeBag: DisposeBag { get }
}
