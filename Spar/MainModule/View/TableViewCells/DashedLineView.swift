//
//  DashedLineView.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import UIKit

final class DashedLineView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let dashPattern: [CGFloat] = [2.0, 2.0]
        path.setLineDash(dashPattern, count: dashPattern.count, phase: 0)
        path.lineWidth = 1
        path.move(to: CGPoint(x: 0, y: bounds.height * 0.65))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.65))
        UIColor.systemGray.setStroke()
        path.stroke()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setutpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setutpUI() {
        backgroundColor = .systemBackground
    }
}
