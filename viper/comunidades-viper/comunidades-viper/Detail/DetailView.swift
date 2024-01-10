//
//  DetailView.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/10/24.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {
    @IBOutlet weak var lblInfo: UILabel!

    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: - VIEW <- DATA FROM PRESENTER
extension DetailView: DetailViewProtocol {

    // TODO: implement view Delegate methods
    func showLoading() {
        // Show loading indicator
    }

    func stopLoading() {
        // Stop loading indicator
    }

    func showLabel(with info: String) {
        lblInfo.text = info
    }
}
