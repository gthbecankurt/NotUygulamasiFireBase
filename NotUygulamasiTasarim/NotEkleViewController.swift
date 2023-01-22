//
//  NotEkleViewController.swift
//  NotUygulamasiTasarim
//
//  Created by Emirhan Cankurt on 21.01.2023.
//

import UIKit
import Firebase

class NotEkleViewController: UIViewController {
    
    var ref:DatabaseReference?


    
    @IBOutlet weak var textfieldDersAdi: UITextField!
    @IBOutlet weak var textfieldNot1: UITextField!
    @IBOutlet weak var textfieldNot2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database(url:"https://notuygulamasi-5d10c-default-rtdb.europe-west1.firebasedatabase.app").reference()
        
    }
    

    @IBAction func notEkle(_ sender: Any) {
        if let ad = textfieldDersAdi.text , let not1 = textfieldNot1.text , let not2 = textfieldNot2.text {
            if let n1 = Int(not1) , let n2 = Int(not2) {
                notEkle(ders_adi: ad, not1: n1, not2: n2)
            }
        }
    }
    
    func notEkle(ders_adi:String,not1:Int,not2:Int){
        let dict:[String:Any] = ["ders_adi":ders_adi,"not1":not1,"not2":not2]
        
        let newRef = ref!.child("notlar").childByAutoId()
        
        newRef.setValue(dict)
        
    }
    

}
