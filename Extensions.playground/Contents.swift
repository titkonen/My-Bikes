extension Bool {
    
    var asYesOrNo: String {
        if self {
            return "Yes"
        } else {
            return "No"
        }
    }

}

print(true.asYesOrNo)
print(false.asYesOrNo)
