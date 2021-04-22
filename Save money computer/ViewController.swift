//
//  ViewController.swift
//  Save money computer
//
//  Created by Ciao Caterina on 2021/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var 輸入月收入: UITextField!

    @IBOutlet weak var 固定開支％: UITextField!
    
    @IBOutlet weak var 固定開支: UITextField!
    
    @IBOutlet weak var 平均支出: UITextField!
    
    @IBOutlet weak var 計算: UIButton!

    var inforBtn:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        輸入月收入.placeholder = "請輸入月收入 "
        固定開支％.placeholder = "勞健保等（％）"
        固定開支.placeholder = "房租·交通電信費等 "
        平均支出.placeholder = "娛樂·伙食費等"
       
        計算.layer.cornerRadius = 30000
        //inforBtn?.layer.cornerRadius = 20
        
    }
    
    
   
    
    @IBAction func 計算(_ sender: Any) {
        //Button執行的地方
        if let monthBalance = calMonthly(){
            let year = monthBalance * 12
            let alert = UIAlertController(title: "結果", message: "存了\(year)", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        
       
    }
    
   
    func calMonthly()->Float?{
        let incomeMonthly = 輸入月收入.text!
        let expensePercentage = 固定開支％.text!
        let expense1 = 固定開支.text!
        let expense2 = 平均支出.text!
        
        if let inM = Float(incomeMonthly),let expPercent = Float(expensePercentage),let exp1 = Float(expense1),let exp2 = Float(expense2){
            let monthBalance = (inM * (1-expPercent/100)) - exp1 - exp2
            return monthBalance
        }else{
            return nil
        }
    }
    
    
    
    
}

