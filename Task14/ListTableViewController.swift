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
    
    var fruit:[Dictionary<String,Any>] = []

    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! TableViewCell
        let fruitArray = self.fruit[indexPath.row]
        let fruitName = fruitArray[KeyName] as! String
        let check = (fruitArray[KeyCheck] as? Bool)!
        //セルのチェックマークの処理
        cell.configure(isChecked: check, name: fruitName)
//        cell.label.text = (fruitArray[KeyName]  as? String) ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let check = self.fruit[indexPath.row][KeyCheck] as? Bool{
            self.fruit[indexPath.row][KeyCheck] = !check
            //表示の機能を使うために定数に入れる
            //表示の処理を行う
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
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
