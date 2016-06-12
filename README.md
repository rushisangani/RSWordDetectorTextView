# RSWordDetectorTextView

The convinient class to get **clicked/tapped** word by user in **UITextView**. 

## Features

- Get user clicked text in UITextView using delegate method.

## How To Use

### RSWordDetectorTextView

```objective-c
/* set delegate */

self.textView.wordDetectorDelegate = self;

#pragma mark- RSWordDetectorDelegate method

-(void)textView:(UITextView *)textView didTappedWord:(NSString *)word {
    NSLog(@"Tapped word: %@", word);
}

```

## License

RSWordDetectorTextView is released under the MIT license. See LICENSE for details.
