// Douglas Hill, November 2019

import UIKit

/// A scroll view that supports scrolling and zooming using a hardware keyboard. Behaviour is modelled
/// after `NSScrollView`. Supports arrow keys, ⌥ + arrow keys, ⌘ + arrow keys, space bar, page up, 
/// page down, home and end.
///
/// The scroll view’s delegate will receive `scrollViewDidEndScrollingAnimation:` after a keyboard-driven
/// scrolling animation finishes or is interrupted by a new keyboard-driven scrolling animation.
open class KeyboardScrollView: UIScrollView, ResponderChainInjection {

    public override var canBecomeFirstResponder: Bool {
        true
    }

    private lazy var keyHandler = ScrollViewKeyHandler(scrollView: self, owner: self)

    public override var next: UIResponder? {
        keyHandler
    }

    func nextResponderForResponder(_ responder: UIResponder) -> UIResponder? {
        super.next
    }
}
