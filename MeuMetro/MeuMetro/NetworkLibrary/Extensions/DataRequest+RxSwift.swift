//
//  DataRequest+RxSwift.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 30/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import Foundation
import RxSwift
import CodableAlamofire
import Alamofire

extension DataRequest {
    
    // MARK: - Single
    func asSingle(scheduler: ImmediateSchedulerType? = nil) -> Single<String> {
        return single(responseBlock: { observer in
            self.responseString(completionHandler: { response in
                RequestManager.requestReceived(response: response, observer: observer)
            })
        })
    }
    
    func asSingle<T: Decodable>(scheduler: ImmediateSchedulerType? = nil) -> Single<T> {
        return single(responseBlock: { observer in
            self.responseDecodableObject(decoder: RequestManager.config.decoder, completionHandler: { (response: DataResponse<T>) in
                RequestManager.requestReceived(response: response, observer: observer)
            })
        })
    }
    
    // MARK: - Completable
    func asCompletable(scheduler: ImmediateSchedulerType? = nil) -> Completable {
        let single: Single<String> = asSingle(scheduler: scheduler)
        return single.ignoreElements()
    }
    
    // MARK: - Private methods
    private func single<T>(scheduler: ImmediateSchedulerType? = nil, responseBlock: @escaping ( @escaping(SingleEvent<T>) -> Void ) -> Void) -> Single<T> {
        return Single.create(subscribe: { observer -> Disposable in
            responseBlock(observer)
            return Disposables.create {
                self.cancel()
            }
        })
    }
    
}
