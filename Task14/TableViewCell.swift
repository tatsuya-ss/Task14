//
//  NoImageTableViewCell.swift
//  Task14
//
//  Created by 坂本龍哉 on 2020/10/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    //privateを付けることで他のクラスからアクセスできない
    @IBOutlet private var  checkIcon: UIImageView!
    @IBOutlet private var  label: UILabel!
    
    func configure(isChecked: Bool, name: String) {
        // ここに表示の処理を書きましょう
        //dequeue...で再利用したcellのconfigureを呼んで、それをreturn
        //チェックされているときには表示して、チェックされていない時は表示しないという処理を書く
        checkIcon.image = nil
        if isChecked == true {
            checkIcon.image = UIImage(named: "check")
        }else{
            checkIcon?.image = nil
        }
        label.text = name
    }
}
