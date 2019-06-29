import UIKit

class TaskHeader: BaseCell {
    
    var viewController: ListViewController?
    
    let taskNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter task"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let taskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func addTask() {
        viewController?.addTask(taskName: taskNameTextField.text!)
    }
    
    override func setupViews() {
        addSubview(taskNameTextField)
        addSubview(taskButton)
        
        taskButton.addTarget(self, action: Selector(("addTask")), for: .touchUpInside)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-[v1(80)]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": taskNameTextField, "v1": taskButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-24-[v0]-24-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": taskNameTextField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": taskButton]))

    }
    
}
