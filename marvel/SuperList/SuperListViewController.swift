//
//  SuperListViewController.swift
//  marvel
//
//  Created by Jose A. Herran on 09/10/2017.
//  Copyright © 2017 Jose A. Herran. All rights reserved.
//

import UIKit

class SuperListViewController: UIViewController, SuperListPresenterOutput, UITableViewDelegate, UITableViewDataSource {

    var presenter: SuperListPresenter?
    var superListArray: [SuperResult] = []
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        presenter?.getSuperList()
        configView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configView() {
        title = Bundle.main.infoDictionary![kCFBundleNameKey as String] as? String
        loadingIndicator.startAnimating()
        let cell = UINib(nibName: "SuperListTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: SuperListTableViewCell.cellIdentifier())
    }

    // MARK: - SuperListPresenterOutput
    func superList(result: [SuperResult]) {
        superListArray = result
        DispatchQueue.main.async {
        self.tableView.reloadData()
        self.loadingIndicator.stopAnimating()
        }
    }
    
    func superError(error: String?) {
        let alert = UIAlertController(title: "ERROR", message: error, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SuperListTableViewCell.cellIdentifier(), for: indexPath) as! SuperListTableViewCell
        cell.configureCell(hero: superListArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superListArray.count
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? SuperListTableViewCell
        presenter?.goToDetailWith(hero: superListArray[indexPath.row], image: (cell?.heroImage.image)!)
    }
}

