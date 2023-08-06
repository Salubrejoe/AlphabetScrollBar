import SwiftUI

struct SectionIndexTitles: View {
  
  // MARK: - Properties
  
  let alphabet: [String] // The array containing the alphabet or index titles to be displayed.
  @Binding var selectedLetter: String // The selected letter that the ScrollViewProxy will scroll to.
  let pageScroller: ScrollViewProxy // The ScrollViewProxy used to scroll to the selected letter.
  let anchor: UnitPoint // The anchor point for scrolling to the selected letter.
  
  @GestureState private var dragLocation: CGPoint = .zero // The current drag location for gesture tracking.
  let haptics = UIImpactFeedbackGenerator(style: .rigid) // Haptic feedback generator for touch interaction.
  
  // MARK: - View Body
  
  var body: some View {
    VStack {
      ForEach(alphabet, id: \.self) { letter in
        Text(letter)
          .font(.system(size: 12).bold())
          .frame(width: 30)
          .background(dragObserver(title: letter, anchor: anchor)) // Background modifier for tracking gestures.
      }
    }
    .gesture(
      DragGesture(minimumDistance: 0, coordinateSpace: .global)
        .updating($dragLocation) { value, state, _ in
          state = value.location // Update the dragLocation with the current gesture location.
        }
    )
    .animation(.spring(), value: selectedLetter) // Apply animation when selectedLetter changes.
    .padding(.trailing, 3)
    .background(Color(.systemBackground).opacity(0.001)) // Transparent background.
  }
  
  // MARK: - Methods
  
  // Method to add a GeometryReader for drag gesture tracking.
  func dragObserver(title: String, anchor: UnitPoint) -> some View {
    GeometryReader { geometry in
      dragObserver(geometry: geometry, title: title, anchor: anchor)
    }
  }
  
  // Method to handle the drag gesture and scrolling to the selected letter.
  private func dragObserver(geometry: GeometryProxy, title: String, anchor: UnitPoint) -> some View {
    if geometry.frame(in: .global).contains(dragLocation) {
      DispatchQueue.main.async {
        // Scroll to the selected letter in the ScrollViewProxy.
        pageScroller.scrollTo(title, anchor: anchor)
        haptics.prepare() // Prepare the haptic feedback.
        if title != selectedLetter {
          haptics.impactOccurred() // Provide haptic feedback if the letter is different from the current selection.
        }
        selectedLetter = title // Update the selectedLetter binding with the current letter.
      }
    }
    return Rectangle().fill(Color(.systemBackground).opacity(0.001)) // Invisible filler rectangle.
  }
}
