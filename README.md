# NewsAppSn

This is a project for practicing and comparing Swift and SwiftUI.
It makes use of the data and restful APIs from hn.algolia.com
This project is structured using MVVM architecture to have data models, views, view controllers and data service.

I wrote another project - HNBrowserSn with the same functionality in SwiftUI.

Comparing the Swift and SwiftUI projects, The main differences are in view layout and data passing.

In SwiftUI, veiws are arranged by stacking up view components to achieve the visual effect.  Data are passed by using @State,  @State, @Published, @ObservedObject or @EnviromemntObject etc.

In Swift and Objective-C, views can be designed using XCode Interface Builder. This graphic tool enables designing customized screens and views without any data.  Data are passed by direct referencing, delegate or segue methods.
