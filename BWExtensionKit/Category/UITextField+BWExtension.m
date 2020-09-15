//
//  UITextField+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/20.
//

#import "UITextField+BWExtension.h"

@implementation UITextField (BWExtension)

- (void)setBw_PlaceholderColor:(UIColor *)bw_PlaceholderColor {
    
    if (self.placeholder.length <= 0) {
        self.placeholder = @" ";
    }
    UILabel *label = [self valueForKeyPath:@"placeholderLabel"];
    label.textColor = bw_PlaceholderColor;
}

- (UIColor *)bw_PlaceholderColor {
    
    UILabel *label = [self valueForKeyPath:@"placeholderLabel"];
    return label.textColor;
}

- (void)bw_selectAllText {
    
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    self.selectedTextRange = range;
}

- (void)bw_selectTextWithRange:(NSRange)range {
    
    UITextPosition *startPosition = [self positionFromPosition:self.beginningOfDocument offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:self.beginningOfDocument offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    self.selectedTextRange = selectionRange;
}

- (NSRange)bw_selectRange {
    
    UITextRange *selectedRange = self.selectedTextRange;
    UITextPosition *selectionStart = selectedRange.start;
    UITextPosition *selectionEnd = selectedRange.end;
    
    NSInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:selectionStart];
    NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

@end
