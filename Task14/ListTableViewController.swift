//
//  ListTableViewController.swift
//  Task14
//
//  Created by 坂本龍哉 on 2020/10/20.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    private var fruit = ["りんご","みかん","バナナ","パイナップル"]

    @IBOutlet var plusButton: UIBarButtonItem!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruit.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifiers = ["Cell1","Cell2"]
        let identifier = identifiers[indexPath.row % identifiers.count]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableViewCell
        cell.label.text = fruit[indexPath.row]
        
        return cell
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue){
    }
    
    @IBAction func exit(segue:UIStoryboardSegue){
        let addition = segue.source as? SaveViewController
        self.fruit.append((addition?.additionalKoumoku)!)
        self.tableView.reloadData()
    }
    
    @IBAction func plusAction(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: sender)
    }
}
