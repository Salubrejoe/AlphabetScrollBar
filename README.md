# AlphabetScrollBar

AlphabetScrollBar is a SwiftUI package that provides a reusable view for displaying collections of items in an alphabetized manner. It allows you to present the collection either as a List or a Grid, with section headers representing the alphabet index.


![](https://github.com/Salubrejoe/AlphabetScrollBar/blob/main/AlphaScroll.GIF)
## Features

- Alphabetically group items in the collection.
- Display the collection as a List or a Grid with alphabet headers.
- Easy to use and customizable with your own cell views.

## Requirements

- Swift 5.3+
- iOS 14.0+
- macOS 11.0+
- watchOS 7.0+
- tvOS 14.0+

## Installation

You can add AlphabetizedList to your project using Swift Package Manager. To add it, follow these steps:

1. In Xcode, open your project or workspace.
2. Go to File > Swift Packages > Add Package Dependency.
3. Enter the repository URL: `(https://github.com/Salubrejoe/AlphabetScrollBar.git)`.
4. Click Next, then select the version rule you want to use.
5. Click Finish.

## Usage

To use AlphabetizedList in your SwiftUI project, follow these steps:

1. Import the package:

```swift
import SwiftUI
import AlphabetScrollBar

```
Conform your model type to the Alphabetizable protocol:
```


struct Country: Alphabetizable {
    var id: String { self.name }
    let name: String
}

```

Create an instance of the AlphabetizedList view:

```


let countries: [Country] = [
    // ... your collection of Country instances ...
]

var body: some View {
    AlphabetizedList(
        collectionDisplayMode: .asList, // or .asGrid
        collection: countries,
        sectionHeaderFont: .headline,
        sectionHeaderForegroundColor: .primary,
        resultAnchor: .top,
        cell: { country in
            // Customize your cell view here based on the 'Country' model.
            Text(country.name)
        }
    )
}
```

## Licence
Customize the appearance by adjusting the sectionHeaderFont, sectionHeaderForegroundColor, and the cell view.
License

This package is distributed under the MIT License. See LICENSE for more information.

Acknowledgments

The AlphabetizedList package was inspired by the need for an easy-to-use SwiftUI view to display alphabetically sorted collections.

Contributing

Contributions are welcome! If you have any bug reports, feature requests, or suggestions, please open an issue or submit a pull request.
