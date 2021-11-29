//
//  PictureDetailAPI.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

struct PictureDetailAPI {
    func getPictureDetail(completion: @escaping (PictureDetail?, ServiceError?) -> ()) {
        let request = PictureDetailAPIRequestHandler().pictureDetailRequest()
        APIManager.shared.loadAPIRequest(requestData: request) { (model: PictureDetail?, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}
