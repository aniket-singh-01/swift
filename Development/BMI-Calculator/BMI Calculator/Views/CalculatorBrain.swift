import UIKit

struct CalculatorBrain{
    
    var bmi: BMI?

    
    func getBMIValue() ->String {
        let bmiTO1DecimalPlace=String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTO1DecimalPlace
    }
    func getAdvice() ->String{
        return bmi?.advice ?? "No advice"
    }
    func getColor() ->UIColor{
        return bmi?.color ?? .white
    }
    
    mutating func calculateBMI(height: Float,weight: Float){
        let bmiValue=weight/(height*height)
        
        if bmiValue<18.5{
            bmi = BMI(value: bmiValue, advice: "Get more nutrients", color: UIColor.blue)
        }
        else if bmiValue<24.9{
            bmi = BMI(value: bmiValue, advice: "Fit as Aniket ", color: UIColor.green)
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Go to gym", color: .red)
        }
        
    }
}
