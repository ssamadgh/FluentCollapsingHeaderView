//
//  FluentCollapsingHeaderView.swift
//  FluentCollapsingHeaderView
//
//  Created by Seyed Samad on 9/13/21.
//  Copyright (c) 2018 Seyed Samad. All rights reserved.
//

import UIKit


public protocol FluentCollapsingHeaderViewDelegate: AnyObject {
    
    /// Use this method to set the right value for your views peroperties when header view height changes based on fraction of header view height compared with maximum header height
    /// - Parameter fraction: The fraction of header view height compared with maximum header height
    func headerDidAnimate(to fraction: CGFloat)
    
    /// Use this method to set the right value for your views peroperties when header view height changes
    /// - Parameter currentValueWithMinMax: This is a closure that takes minimum and maximum value of the object property value and returns the property current right value based on header view height
    /// - Parameter min: minimum value of the object property that should change with header view height changes
    /// - Parameter max: maximum value of the object property that should change with header view height changes
    func headerDidAnimate(to currentValueWithMinMax: (_ min: CGFloat, _ max: CGFloat) -> CGFloat)
}

public extension FluentCollapsingHeaderViewDelegate {
    
    func headerDidAnimate(to percentage: CGFloat) {
        
    }
    
}

@IBDesignable
public class FluentCollapsingHeaderView: UIView {
    
    // MARK: Properties
    
    private var timer: Timer?
    
    private var previousScrollOffset: CGFloat = -1
    
    private var height: CGFloat {
        get {
            headerHeightConstraint.constant
        }
        
        set {
            headerHeightConstraint.constant = newValue
            updateHeader(with: newValue)
        }
    }
    
    private var observer: NSKeyValueObservation?
    
    
    public var ignoreSafeAreaInsets = true {
        didSet {
            setupScrollViewForHeaderHeight()
        }
    }
    
    // MARK: Outlets
    @IBOutlet public weak var scrollView: UIScrollView! {
        didSet {
            setupScrollViewForHeaderHeight()
            observeContentSize()
        }
    }
    
    @IBOutlet public weak var headerHeightConstraint: NSLayoutConstraint!
    
    
    // MARK: IBInspectables
    
    @IBInspectable
    public var minHeight: CGFloat = 50 {
        didSet {
            setupScrollViewForHeaderHeight()
        }
    }
    
    @IBInspectable
    public var maxHeight: CGFloat = CGFloat.infinity {
        didSet {
            setupScrollViewForHeaderHeight()
        }
    }
    
    // MARK: Initialize
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialize()
    }
    
    func initialize() {
        self.clipsToBounds = false
    }
    
    deinit {
        self.observer?.invalidate()
    }
    
    // MARK: Delegate
    
    public var delegate: FluentCollapsingHeaderViewDelegate?
    
    // MARK: Overrides
    
    public override func didMoveToSuperview() {
        for constraint in constraints {
            if constraint.firstAnchor == heightAnchor, constraint.secondAnchor == nil, constraint.constant > 0 {
                headerHeightConstraint = constraint
                break
            }
        }

        guard headerHeightConstraint != nil else {
            let maxHeight = (self.maxHeight == CGFloat.infinity) ? self.bounds.height : self.maxHeight
            self.maxHeight = maxHeight
            headerHeightConstraint = heightAnchor.constraint(equalToConstant: maxHeight)
            headerHeightConstraint.isActive = true
            self.setupScrollViewForHeaderHeight()
            return
        }
        let headerHeightConstraintConstant = headerHeightConstraint?.constant ?? 0
        let maxHeight = (self.maxHeight == CGFloat.infinity) ? max(headerHeightConstraintConstant, minHeight) : self.maxHeight
        self.maxHeight = maxHeight
        headerHeightConstraint.constant = maxHeight
    }
    
    func setupScrollViewForHeaderHeight() {
        guard headerHeightConstraint != nil && maxHeight != .infinity else { return }
        scrollView?.contentInset.top = maxHeight
        if #available(iOS 13.0, *) {
            scrollView?.verticalScrollIndicatorInsets.top = maxHeight
        } else {
            scrollView?.scrollIndicatorInsets.top = maxHeight
        }

        scrollView?.contentInsetAdjustmentBehavior = ignoreSafeAreaInsets ? .never : .automatic
        if #available(iOS 13.0, *) {
            scrollView?.automaticallyAdjustsScrollIndicatorInsets = !ignoreSafeAreaInsets
        } else {
            // Fallback on earlier versions
        }
    }
    
    func observeContentSize() {
        guard self.observer == nil else { return }
        self.observer = scrollView?.observe(\.contentSize) { [weak self] scrollView, observed in
            guard let `self` = self else { return }
            self.timer?.invalidate()
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { timer in
                let headerMinHeight = self.minHeight
                let scrollViewHeight = scrollView.bounds.height
                let minimumContentSizeHeight = scrollViewHeight - headerMinHeight
                let contentSizeHeight = scrollView.contentSize.height
                if contentSizeHeight > 0 && contentSizeHeight < minimumContentSizeHeight {
                    scrollView.contentSize.height = minimumContentSizeHeight
                }
                timer.invalidate()
            })
            
            
        }
    }
}

public extension FluentCollapsingHeaderView {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let newHeight = headerHeightForContentOffet(scrollView.contentOffset.y)
        setHeaderHeightConstraint(newHeight)
        updateHeader(with: newHeight)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let targetOffset = targetContentOffset.pointee
        
        let minimumHeaderHeightOffset = contentOffsetYForHeaderHeight(minHeight)
        let maximumHeaderHeightOffset = contentOffsetYForHeaderHeight(maxHeight)
        
        // If scrolling up (velocity is more than zero) and target offset is less than offset for minimum header height so we set target offset to the value that header height stay at minimum
        if velocity.y > 0, targetOffset.y < minimumHeaderHeightOffset {
            targetContentOffset.pointee = CGPoint(x: targetOffset.x, y: minimumHeaderHeightOffset)
        }
        
        if velocity.y == 0 {
            // This is the point we change target offset between minimum or maximum header height offset
            let inflectionOffsetPoint = maximumHeaderHeightOffset + (minimumHeaderHeightOffset - maximumHeaderHeightOffset)*0.4
            if targetOffset.y >= inflectionOffsetPoint && targetOffset.y < minimumHeaderHeightOffset {
                targetContentOffset.pointee = CGPoint(x: targetOffset.x, y: minimumHeaderHeightOffset)
            }
            
            if targetOffset.y < inflectionOffsetPoint {
                targetContentOffset.pointee = CGPoint(x: targetOffset.x, y: -maxHeight)
            }
        }
        
        // If scrolling down (velocity is less than zero) we set target offset to the value that header height stay at maximum
        if velocity.y < 0 {
            targetContentOffset.pointee = CGPoint(x: targetOffset.x, y: maximumHeaderHeightOffset)
        }
        
    }
    
    func setHeaderHeightConstraint(_ height: CGFloat) {
        headerHeightConstraint?.constant = height
    }
    
    func headerHeightForContentOffet(_ contentOffset: CGFloat) -> CGFloat {
        var height = -round(contentOffset)
        height = max(min(maxHeight, height), minHeight)
        return height
    }
    
    func contentOffsetYForHeaderHeight(_ headerHeight: CGFloat) -> CGFloat {
        -round(headerHeight)
    }
    
}

private extension FluentCollapsingHeaderView {
    
    func updateHeader(with height: CGFloat) {
        let range = max(maxHeight - minHeight, 1)
        let expandAmount = height - minHeight
        let fraction = expandAmount / range
        
        func currentValue(min: CGFloat, max: CGFloat) -> CGFloat {
            let diff = (max - min)*fraction
            return min + diff
            //min + diff
        }
        
        delegate?.headerDidAnimate(to: fraction)
        delegate?.headerDidAnimate(to: currentValue)
    }
    
}

