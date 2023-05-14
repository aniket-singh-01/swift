struct CalculatorBrain{
    
    var bmi: Float=0.0
    
    func getBMIValue() ->String {
        let bmiTO1DecimalPlace=String(format: "%.1f", bmi)
        return bmiTO1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float,weight: Float){
       bmi=weight/(height*height)
    }

}
