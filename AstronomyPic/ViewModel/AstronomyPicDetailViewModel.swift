//
//  AstronomyPicDetailViewModel.swift
//  AstronomyPic
//
//  Created by user on 28/11/21.
//

import Foundation

class AstronomyPicDetailViewModel {
    var apiResponse:((ServiceError?) ->Void)?
    var pictureDetail:PictureDetail?
    
    init() {
        setUpViewModel()
    }
    
    func setUpViewModel() {
        
        if let detail = getStoredPictureDetail(), let date = detail.date  {
            if compareDate(date1: Date(), date2: date.getFormattedDate(fromFormat: DateFormat.YearMonthDay.rawValue)) {
                //Already API called today once
                self.pictureDetail = detail
                setAPIResponse(nil)
            } else  {
                if Reachability.isConnectedToNetwork(){
                    //Sync detail again if date is not matching
                    deletePicDetail(detail)
                    self.getPictureDetail()
                } else {
                    //Phone is not connected to the internet, Show previous detail
                    self.pictureDetail = detail
                    setAPIResponse(ServiceError(httpStatus: 12163, message: Constants.networkErrorMessageToLoadPreviousDetail))
                }
            }
        } else {
            if Reachability.isConnectedToNetwork(){
                //For first time Sync detail
                getPictureDetail()
            } else {
                //First Phone is not connected to the internet, Show network error message
                self.pictureDetail = nil
                setAPIResponse(ServiceError(httpStatus: 12163, message: Constants.networkErrorMessage))
            }
        }
        
        func setAPIResponse(_ error: ServiceError?) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.apiResponse?(error)
            }
        }
    }
    
    func compareDate(date1:Date, date2:Date) -> Bool {
        let order = NSCalendar.current.compare(date1, to: date2, toGranularity: .day)
        switch order {
        case .orderedSame:
            return true
        default:
            return false
        }
    }
    
    /// PictureDetail API call
    func getPictureDetail() {
        PictureDetailAPI().getPictureDetail(completion: { [weak self] pictureDetail, error in
            guard let self = self else { return }
            self.pictureDetail = pictureDetail
            self.createPicDetail(self.pictureDetail)
            self.apiResponse?(error)
        })
    }
    
    /// Fetch PictureDetail
    /// - Returns: PictureDetail
    func getStoredPictureDetail() -> PictureDetail? {
        let context = CoreDataStack.shared.managedObjectContext
        do  {
            let details:[PictureDetail] = try context.fetch(PictureDetail.fetchRequest())
            return details.first ?? nil
        } catch (let error) {
            print("fetch error --\(error)")
        }
        return nil
    }
    
    /// createPicDetail - save
    /// - Parameter detail: PictureDetail
    func createPicDetail(_ detail: PictureDetail?) {
        guard let detail = detail else { return }
        let context = CoreDataStack.shared.managedObjectContext
        let newItem = PictureDetail(context: context)
        newItem.title = detail.title
        newItem.explanation = detail.explanation
        newItem.date = detail.date
        newItem.url = detail.url
        newItem.pictureImage = detail.pictureImage
        CoreDataStack.shared.saveWorkingContext(context: context)
    }
    
    
    /// deletePicDetail
    /// - Parameter detail: PictureDetail
    func deletePicDetail(_ detail: PictureDetail) {
        let context = CoreDataStack.shared.managedObjectContext
        context.delete(detail)
        CoreDataStack.shared.saveWorkingContext(context: context)
    }
}

