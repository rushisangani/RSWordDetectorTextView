//
// RSWordDetectorTextView.m
//
// Copyright (c) Rushi Sangani.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RSWordDetectorTextView.h"

@implementation RSWordDetectorTextView

- (instancetype)init
{
    self = [super init];
    if (self) {

        [self setProperties];
    }
    return self;
}

- (instancetype)initWithDelegate:(id)delegate
{
    self = [self init];
    
    self.wordDetectorDelegate = delegate;
    [self setProperties];
    
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setProperties];
}

-(void)setProperties {
    
    self.userInteractionEnabled = YES;
    self.editable = NO;
    self.scrollEnabled = NO;
    self.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.dataDetectorTypes = UIDataDetectorTypeLink;
    self.backgroundColor = [UIColor clearColor];
    
    /* Set Tap gesture on TextView */
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapResponse:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
}

#pragma mark- Tap gesture method

- (void)tapResponse:(UITapGestureRecognizer *)recognizer{
    
    UITextView *textView =  (UITextView *)recognizer.view;
    CGPoint location = [recognizer locationInView:textView];
    
    CGPoint position = CGPointMake(location.x, location.y);
    
    //get location in text from textposition at point
    UITextPosition *tapPosition = [textView closestPositionToPoint:position];
    
    //fetch the word at this position (or nil, if not available)
    UITextRange *textRange = [textView.tokenizer rangeEnclosingPosition:tapPosition withGranularity:UITextGranularityWord inDirection:UITextLayoutDirectionRight];
    NSString *tappedWord = [textView textInRange:textRange];
    
    if(tappedWord) {
        
        if([self.wordDetectorDelegate respondsToSelector:@selector(textView:didTappedWord:)]){
            [self.wordDetectorDelegate textView:self didTappedWord:tappedWord];
        }
    }
}

@end
