//
//  ViewController.swift
//  CalculatorApp
//
//  Created by semih bekdaş on 27.09.2024.
//

import UIKit

class ViewController: UIViewController {

    
    //label input girişler
    //labelresult sonuç
    // var input giriş değişkeni
    @IBOutlet weak var labelInput: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    
    var input : String = ""
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        clearAll()
    }
    
    func clearAll(){
        
        input = ""
        labelInput.text = ""
        labelResult.text = ""
    }
    
    
    func addInput(_ value: String){
        
        input = input + value
        labelInput.text = input
    }

    
    @IBAction func buttonAllClear(_ sender: Any) {
        
        clearAll()
        
    }
    
    @IBAction func buttonDelete(_ sender: Any) {
        
        if(!input.isEmpty){
            
            input.removeLast()
            
            labelInput.text = input
            
        }
    }
    
    @IBAction func buttonPercent(_ sender: Any) {
        
        addInput("%")

    }
    @IBAction func buttonDivide(_ sender: Any) {
        
        addInput("/")

    }
    
    
    @IBAction func buttonTİmes(_ sender: Any) {
        addInput("*")

    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        addInput("-")

    }
    
    
    @IBAction func buttonPlus(_ sender: Any) {
        addInput("+")

    }
    
    @IBAction func buttonEquals(_ sender: Any) {
        
        var decimalFormattedInput = input
        
        if input.contains("%"){
            
            // Yüzde işaretin ne olduğunu tanımladık (replacingOccurences) fonksiyonu
             decimalFormattedInput  = input.replacingOccurrences(of: "%", with: "*0.01")
            //  % butonuna basılınca işlem yapılması için % işaretini *0.01 şeklinde değiştirdik
            
            
        }else{
            
            
            // bu kodu yazma sebebimiz sayıları double olarak algılamak istiyoruz bölme işlemi gibi işlemleri düzgün yapmak için
            //eğer kullanıcıdan ondalıklı sayı alınan bir uygulama yapsaydım alttaki kodu yazmam gerekirdi
            //let decimalFormattedInput = formattedInput.replacingOccurrences(of: "(?<=\\d)(?!\\.)", with: ".0", options: .regularExpression)
             //decimalFormattedInput = input.replacingOccurrences(of: "(?<=\\d)", with: ".0", options: .regularExpression)
                
            // Sayıları ondalıklı hale getir
            decimalFormattedInput = decimalFormattedInput.replacingOccurrences(of: "([0-9]+)", with: "$1.0", options: .regularExpression)
            
            
        }
        
        if decimalFormattedInput.contains("/0") {
               labelResult.text = "Error: Division by 0"
               return
           }
        
        // NSExpression yazdığımız sayıları ve işlemleri matematiksel olarak algılıyormuş bu yüzden kullandık
        let expression = NSExpression(format: decimalFormattedInput)
        
        // Sonucu hesaplama
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            labelResult.text = String(result)
        } else {
            labelResult.text = "Error"
        }
    }
    
    
    
    @IBAction func button0(_ sender: Any) {
        addInput("0")

    }
    
    
    @IBAction func button1(_ sender: Any) {
        addInput("1")

    }
    
    @IBAction func button2(_ sender: Any) {
        addInput("2")

    }
    
    
    @IBAction func button3(_ sender: Any) {
        addInput("3")

    }
    
    
    @IBAction func button4(_ sender: Any) {
        addInput("4")

        
    }
    @IBAction func button5(_ sender: Any) {
        addInput("5")

        
    }
    
    @IBAction func button6(_ sender: Any) {
        addInput("6")

    }
    
    @IBAction func button7(_ sender: Any) {
        addInput("7")

        
    }
    @IBAction func button8(_ sender: Any) {
        addInput("8")

        
    }
    @IBAction func button9(_ sender: Any) {
        
        addInput("9")
        
    }
}

