//
//  ViewController.swift
//  Search-Controller
//
//  Created by Macbook on 10/07/2021.
//

import UIKit
struct MyModel{
   var fname: String = ""
    var lname: String = ""
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet  var tableView: UITableView!
    var arrData = [MyModel]()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.reloadData()
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        searchBarSetup()
        dataModelSetup()
        
    }
    private func dataModelSetup(){
        arrData = [
            
        MyModel(fname: "Krishna", lname:"Khanal"),
        MyModel(fname: "Ram", lname:"Khanal"),
        MyModel(fname: "Sukrish", lname:"Khanal"),
        MyModel(fname: "Sukriti", lname:"Khanal"),
        MyModel(fname: "Suvadra", lname:"Khanal"),
        MyModel(fname: "Laxmi", lname:"Belbase")
            
        ]
        
    }
    
    private func searchBarSetup(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrData[indexPath.row].fname
        cell.detailTextLabel?.text = arrData[indexPath.row].lname
        return cell
    }
    


}
extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        if searchText == ""{
            dataModelSetup()
        }else{
            arrData = arrData.filter{
                $0.fname.contains(searchText)
            }
        }
        tableView.reloadData()
    }
    
    
}
