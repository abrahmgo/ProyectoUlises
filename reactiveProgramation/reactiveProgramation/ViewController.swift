//
//  ViewController.swift
//  reactiveProgramation
//
//  Created by Andrés Bonilla Gómez on 21/03/22.
//

import UIKit
import Combine
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    // Combine
    var balance: PassthroughSubject<Int, Error> = PassthroughSubject<Int, Error>()
    var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    // RxSwift
    var rxBalance: PublishSubject<Int> = PublishSubject<Int>()
    var rxError: PublishSubject<BalanceError> = PublishSubject<BalanceError>()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNotification()
        subscribeBalance()
        subscribeRx()
    }
    
    func createNotification() {
        // nos suscribimos a eventos de sistema operativo
        // UIScene.willDeactivateNotification
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(willResignActive),
                                               name: UIScene.willDeactivateNotification,
                                               object: nil)
    }
    
    @objc func willResignActive() {
        print("evento emitido")
    }
    
    @IBAction func sendCombineEvent(_ sender: Any) {
        // evento satisfactorio
        balance.send(23)
        
        // evento de error
//        balance.send(completion: .failure(BalanceError.unknown))
    }
    
    @IBAction func sencRxEvent(_ sender: Any) {
        // satisfactorio
//        rxBalance.onNext(213)
        
        // error
        rxError.onNext(BalanceError.withoutFounds)
    }
    
    func subscribeBalance() {
        // subscripcion a balance
        balance.sink { result in
            switch result {
            case .failure(let error):
                print(error)
            case .finished:
                print("termino emision del evento")
            }
        } receiveValue: { balance in
            print(balance)
            print("recibi el balance de Combine")
        }.store(in: &cancellable)
    }
    
    func subscribeRx() {
        rxBalance.subscribe { balance in
            print(balance)
            print("recibi el balance de Rxswift")
        }.disposed(by: disposeBag)
        
        rxError.subscribe { balanceError in
            switch balanceError {
            case .withoutFounds:
                print("no tienes fondos")
            case .unavailable:
                print("el servidor fallo, intenta mas tarde")
            case .unknown:
                print("no sabemos que paso LOL")
            }
        } onError: { _ in } onCompleted: { } onDisposed: {
        }.disposed(by: disposeBag)
    }
}

enum BalanceError: Error {
    case withoutFounds
    case unavailable
    case unknown
}
