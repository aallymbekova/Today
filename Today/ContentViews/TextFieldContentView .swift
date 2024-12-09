//
//  TextFieldContentView .swift
//  Today
//
//  Created by Aliya Alymbekova on 8/12/24.
//

import UIKit

class TextFieldContentView: UIView, UIContentView {
    
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        var onCnahge: (String) -> Void = { _ in }
        
        func makeContentView() -> any UIView & UIContentView {
            return TextFieldContentView(self)
        }
        
        func updated(for state: any UIConfigurationState) -> TextFieldContentView.Configuration {
            return self 
        }
        
    }
    
    let textField = UITextField()
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        textField.addTarget(self, action: #selector(didChange(_ :)), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        textField.text = configuration.text
    }
    
    @objc private func didChange(_ sendner: UITextField) {
        guard let configuration = configuration as? TextFieldContentView.Configuration else { return }
        configuration.onCnahge(textField.text ?? "")
    }
    
}

extension UICollectionViewListCell {
    func textFieldConfiguration() -> TextFieldContentView.Configuration {
        TextFieldContentView.Configuration()
    }
}
