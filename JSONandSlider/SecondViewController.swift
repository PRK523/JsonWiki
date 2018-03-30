//
//  SecondViewController.swift
//  JSONandSlider
//
//  Created by Pranoti Kulkarni on 2/20/18.
//  Copyright © 2018 Pranoti Kulkarni. All rights reserved.
//

import UIKit
import WebKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    //var url: Json?
    var codeData:Array< String > = Array < String >()
    var urlData:Array< String > = Array < String >()
    
    //@IBOutlet weak var labelTest: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(json.count)
        return codeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        //let d = json[indexPath.row]
        cell.titleLabel?.text = codeData[indexPath.row]
        cell.urlLabel?.text = urlData[indexPath.row]
        //cell.urlLabel?.text = TableData[indexPath.row]
        //print(d.code)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webData = self.storyboard?.instantiateViewController(withIdentifier: "web") as! WebViewController
        webData.strURL = self.urlData[indexPath.row]
        performSegue(withIdentifier: "webSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WebViewController{
            destination.strURL = urlData[(tableView.indexPathForSelectedRow?.row)!]
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
            jsonData()
        
    }
    
    func jsonData() {
        let urlString = "https://ergast.com/api/f1/current/last/results.json"
        let url = URL.init(string: urlString)
        
        do{
            let response = try Data.init(contentsOf: url!)
            
            let parsedResponse = try JSONSerialization.jsonObject(with: response, options: []) as! [String:Any]
            
            print(parsedResponse)
            var mrData = parsedResponse["MRData"] as! [String: Any]
            let raceTable = mrData["RaceTable"] as! [String: Any]
            
            let races = raceTable["Races"] as! [[String:Any]]
            
            for temp in races
            {
                let results = temp["Results"] as! [[String:Any]]
                for temp2 in results{
                    var driver = temp2["Driver"] as! [String:Any]
                    
                    
                    let code = driver["code"] as! String
                    let url = driver["url"] as! String
                    
                    //print(code)
                    //print(url)
                    
                    self.codeData.append(code)
                    self.urlData.append(url)
                    //print(j)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        catch let error{
            print(error)
        }
        /*OperationQueue.main.addOperation({
            //calling another function after fetching the json
            //it will show the names to label
            self.showNames()
        })*/
    }
    
    /*func showNames(){
        for name in data{
            labelTest.text = labelTest.text! + name + "\n";
        }
    }*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
