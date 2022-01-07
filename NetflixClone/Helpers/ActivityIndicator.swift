//
//  ActivityIndicator.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/7/22.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style
    @Binding var animate: Bool
    
    private let spinner: UIActivityIndicatorView = {
        $0.hidesWhenStopped = true
        return $0
    }(UIActivityIndicatorView(style: .medium))
    
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        spinner.style = style
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        animate ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
    func configure(_ indicator: (UIActivityIndicatorView) -> Void) -> some View {
        indicator(spinner)
        return self
    }
}
