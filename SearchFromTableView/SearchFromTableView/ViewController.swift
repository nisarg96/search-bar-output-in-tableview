//
//  ViewController.swift
//  SearchFromTableView
//
//  Created by Tops on 15/12/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {

    var filteredcountry = [String]()
    var shouldbool = false
    
    @IBOutlet weak var MysearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    var jsonarray = [[String:Any]]()
    var country = [String]()
    let searchcontroller = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredcountry = country
        searchcontroller.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
    

    
    @IBAction func ParseJsonData(_ sender: UIButton) {
        
        let url = "https://restcountries.eu/rest/v2/all"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request){
            (data,res,err) in
            if err == nil{
                if data != nil{
                    
                }
            }
        }
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return filteredcountry.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchcountrycell")
        cell?.textLabel?.text = String(filteredcountry[indexPath.row])
        return cell!

    }


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText != ""{
            filteredcountry = country.filter({ (cntry) in
                cntry.lowercased().contains(MysearchBar.text!.lowercased())
            })
            myTableView.reloadData()
        }
        else{
            filteredcountry = country
            myTableView.reloadData()
        }
    }
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//    }
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        shouldbool = false
//        myTableView.reloadData()
//    }
    
    
    
//    func updateSearchResults(for searchController: UISearchController)
//    {
//        if searchController.searchBar.text == "" {
//            filteredcountry = country
//        } else {
//            // Filter the results
//            filteredcountry = country.filter { cntry in
//                return cntry.lowercased().contains(searchController.searchBar.text!.lowercased()) }
//        }
//        myTableView.reloadData()
//    }

}

