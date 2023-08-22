import Foundation
import MapKit

struct LocationI : Identifiable {
    let id = UUID()
    let name : String
    let coordinate : CLLocationCoordinate2D
    let flag : String
    let description: String
}
