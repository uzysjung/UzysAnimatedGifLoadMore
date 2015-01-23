UzysAnimatedGifLoadMore
============================
[![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://raw.githubusercontent.com/uzysjung/UzysAnimatedGifLoadMore/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/UzysAnimatedGifLoadMore.svg?style=flat)](https://github.com/uzysjung/UzysAnimatedGifLoadMore)
[![License MIT](https://img.shields.io/badge/contact-@Uzysjung-blue.svg?style=flat)](http://uzys.net)

Add LoadMore using animated GIF to any scrollView with just simple code

![Screenshot](https://raw.githubusercontent.com/uzysjung/UzysAnimatedGifLoadMore/master/UzysAnimatedGifLoadMore.gif)

**UzysAnimatedGifLoadMore features:**

* simple to use.
* Support CocoaPods.
* ARC Only (if your project doesn't use ARC , Project -> Build Phases Tab -> Compile Sources Section -> Double Click on the file name Then add -fno-objc-arc to the popup window.)

## Installation
1. UzysAnimatedGifLoadMore in your app is via CocoaPods.
2. Copy over the files libary folder to your project folder
## Usage
###Import header.

``` objective-c
#import "UIScrollView+UzysAnimatedGifLoadMore.h"
```

### Initialize
adding addLoadMoreActionHandler

``` objective-c
- (void)viewDidLoad
{
    __weak typeof(self) weakSelf =self;
    [self.tableView addLoadMoreActionHandler:^{
        [weakSelf insertRowAtTop];
    }
    ProgressImagesGifName:@"spinner_dropbox@2x.gif" 
    LoadingImagesGifName:@"run@2x.gif" 
    ProgressScrollThreshold:60 
    LoadingImageFrameRate:30];
}
```
### programmatically trigger LoadMore
``` objective-c
[_tableView triggerLoadMoreActionHandler];
```

### stop LoadMore Activity Animation
``` objective-c
[_tableView stopLoadMoreAnimation];
```

### option
#### Progress : Animated GIF , Loading : Animated GIF
``` objective-c
- (void)addLoadMoreActionHandler:(actionHandler)handler
                ProgressImagesGifName:(NSString *)progressGifName
                 LoadingImagesGifName:(NSString *)loadingGifName
              ProgressScrollThreshold:(NSInteger)threshold;
```
#### Progress : Animated GIF , Loading : UIActivitiyIndicator
``` objective-c
- (void)addLoadMoreActionHandler:(actionHandler)handler
                ProgressImagesGifName:(NSString *)progressGifName
              ProgressScrollThreshold:(NSInteger)threshold;
```

#### Progress : Array images , Loading : UIActivitiyIndicator
``` objective-c
- (void)addLoadMoreActionHandler:(actionHandler)handler
                       ProgressImages:(NSArray *)progressImages
              ProgressScrollThreshold:(NSInteger)threshold;
```

#### Progress : Array images , Loading : Array images
``` objective-c
- (void)addLoadMoreActionHandler:(actionHandler)handler
                       ProgressImages:(NSArray *)progressImages
                        LoadingImages:(NSArray *)loadingImages
                    ProgressScrollThreshold:(NSInteger)threshold
               LoadingImagesFrameRate:(NSInteger)lframe;
```

## Information
 - Please Visit [UzysAnimatedGifPullToRefresh](https://github.com/uzysjung/UzysAnimatedGifPullToRefresh)  

## Contact
 - [Uzys.net](http://uzys.net)

## License
 - See [LICENSE](https://github.com/uzysjung/UzysAnimatedGifLoadMore/blob/master/LICENSE).

## Acknowledgements
This application makes use of the following third party libraries:

### AnimatedGIFImageSerialization
Copyright (c) 2014 Mattt Thompson (http://mattt.me/)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Example Project Resources From
* https://dribbble.com/shots/1853041-Slack-Loader?list=searches&tag=load_more&offset=474
* https://dribbble.com/shots/1813893-Bouncing-Sammy?list=searches&tag=load_more&offset=563
* https://dribbble.com/shots/1773881-Fruit-Animation?list=searches&tag=gif&offset=54
* https://dribbble.com/shots/1776423-Inbox-by-Gmail-Animated-Icon?list=searches&tag=gif&offset=94
* https://dribbble.com/shots/1559273-Its-never-too-late?list=searches&tag=gif&offset=143
* https://dribbble.com/shots/1574930-Farm-Truck-animated?list=searches&tag=gif&offset=273
* https://dribbble.com/shots/406120--GIF-Superbowl-XLVI?list=searches&tag=gif&offset=27
