#  Using Dynamic Font Sizes in iOS

- Author: andynadal
- [Twitter](https://twitter.com/theandynadal)
- [GitHub](https://github.com/andynadal)
- [Website](https://andynadal.com)

## Intro

Accessibility is a must in for all apps, and there's a specific accessibility feature in the iOS ecosystem, called __Dynamic Type__, please refer to [Apple's Documentation](https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically) to know more about the implementation of the feature.

__Dynamic Type__ is often hard to implement, specially when using auto layout, please look at this [WWDC 2017 Talk](https://developer.apple.com/videos/play/wwdc2017/245/) to see more.

This __code sample__ was made to see the implementation in more complex environments, `UILabel`s can be added to `UIStackView`s, `UITableViewCell`s or other environments, but there're potential pitfalls we should avoid.


## When using them in a `UITableView`

Due to their nature, cells should also have a dynamic height to correctly display dynamic text, though the system has default cells, sometimes we need to design custom cells from the ground up,
this is where we can run into some pitfalls, for example if you include images, whose size is determined by a label, the image will autoresize based on the image, and not the label.
 
