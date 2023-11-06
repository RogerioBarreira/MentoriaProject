//
//  ServiceListViewModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 26/10/23.
//

import Foundation

class ServiceListViewModel {
    
    private let worker = Worker()
    private var serviceList: ServiceList?
    
    var numerOfRowServiceList: Int {
        return serviceList?.count ?? 0
    }
    
    func deleteCell(at indexPath: IndexPath) {
        guard var serviceList = self.serviceList else {
            return
        }
        serviceList.remove(at: indexPath.row)
        self.serviceList = serviceList
    }

    func cellForRowServiceList(indexPath: IndexPath) -> ServiceListElement? {
        return serviceList?[indexPath.row]
    }
    
    func requestGetServiceList(completion: @escaping (Bool) -> Void) {
        worker.workerGetServiceList { [weak self] result in
            guard let self = self else { return }
            switch result {
                
            case .success(let service):
                self.serviceList = service
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
    func requestDeleteServiceViewModel(id: Int, completion: @escaping (Bool) -> Void) {
        worker.workerDeleteServiceList(id: id) { result in
            switch result {
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
}
