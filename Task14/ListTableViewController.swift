//
//  ListTableViewController.swift
//  Task14
//
//  Created by 坂本龍哉 on 2020/10/20.
//

import UIKit

class ListTableViewController:  UITableViewController {
    
    let KeyName = "Name"
    let KeyCheck = "Check"
    
    private var fruit:[Dictionary<String,Any>] = []

    @IBOutlet var plusButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fruit = [
            [KeyName:"りんご",KeyCheck:false],[KeyName:"みかん",KeyCheck:true],[KeyName:"バナナ",KeyCheck:false],[KeyName:"パイナップル",KeyCheck:true]
        ]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.fruit.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let identifiers = ["Cell1","Cell2"]
//        let identifier = identifiers[indexPath.row % identifiers.count]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! TableViewCell
        let fruitArray = self.fruit[indexPath.row]
        cell.checkIcon.image = nil
        if fruitArray[KeyCheck] as? Bool == true{
            cell.checkIcon.image = UIImage(named: "check")
        }
        cell.label.text = (fruitArray[KeyName]  as? String) ?? ""
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        if cell.checkIcon.isHidden == true{
            cell.checkIcon.isHidden = false
        }else{
            cell.checkIcon.isHidden = true
        }
    }
    
    
    @IBAction func cancel(segue:UIStoryboardSegue){
    }
    
    @IBAction func exit(segue:UIStoryboardSegue){
        if let addition = segue.source as? SaveViewController {
            let fruitArray:Dictionary<String,Any> = [KeyName:addition.additionalKoumoku, KeyCheck:false]
            self.fruit.append(fruitArray)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func plusAction(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: sender)
    }
}
