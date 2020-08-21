//
//  UITextView+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/20.
//

#import "UITextView+BWExtension.h"
#import <objc/runtime.h>

static const void *bw_placeHolderKey;

@interface UITextView ()
@property (nonatomic, readonly) UILabel *bw_placeHolderLabel;
@end

@implementation UITextView (BWExtension)

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

#pragma mark -------- 占位符 --------
+ (void)load {
    [super load];
    
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(bwPlaceHolder_layoutSubviews)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setText:")),
                                   class_getInstanceMethod(self.class, @selector(bwPlaceHolder_setText:)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(bwPlaceHolder_dealloc)));
}

- (void)bwPlaceHolder_layoutSubviews {
    
    if (self.bw_placeHolder) {
        
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;
        CGFloat x = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat y = textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2*self.layer.borderWidth;
        CGFloat height = [self.bw_placeHolderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        self.bw_placeHolderLabel.frame = CGRectMake(x, y, width, height);
    }
    [self bwPlaceHolder_layoutSubviews];
}

- (void)bwPlaceHolder_setText:(NSString *)text {
    
    [self bwPlaceHolder_setText:text];
    if (self.bw_placeHolder) {
        [self updatePlaceHolder];
    }
}

- (void)bwPlaceHolder_dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self bwPlaceHolder_dealloc];
}

- (NSString *)bw_placeHolder {
    
    return objc_getAssociatedObject(self, &bw_placeHolderKey);
}

- (void)setBw_placeHolder:(NSString *)bw_placeHolder {
    
    objc_setAssociatedObject(self, &bw_placeHolderKey, bw_placeHolder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceHolder];
}

- (UIColor *)bw_placeHolderColor {
    
    return self.bw_placeHolderLabel.textColor;
}

- (void)setBw_placeHolderColor:(UIColor *)bw_placeHolderColor {
    
    self.bw_placeHolderLabel.textColor = bw_placeHolderColor;
}

- (NSString *)placeholder {
    
    return self.bw_placeHolder;
}

- (void)setPlaceholder:(NSString *)placeholder {
    
    self.bw_placeHolder = placeholder;
}

- (void)updatePlaceHolder {
    
    if (self.text.length) {
        [self.bw_placeHolderLabel removeFromSuperview];
        return;
    }
    self.bw_placeHolderLabel.text = self.bw_placeHolder;
    self.bw_placeHolderLabel.textAlignment = self.textAlignment;
    self.bw_placeHolderLabel.font = self.font ? self.font : self.bw_defaultFont;
}

- (UILabel *)bw_placeHolderLabel {
    
    UILabel *label = objc_getAssociatedObject(self, @selector(bw_placeHolderLabel));
    if (!label) {
        label = [UILabel new];
        label.numberOfLines = 0;
        label.textColor = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, @selector(bw_placeHolderLabel), label, OBJC_ASSOCIATION_RETAIN);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return label;
}

- (UIFont *)bw_defaultFont {
    
    static UIFont *font;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *tv = [UITextView new];
        tv.text = @" ";
        font = tv.font;
    });
    return font;
}

@end
