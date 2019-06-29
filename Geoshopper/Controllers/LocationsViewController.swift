import UIKit
import MapKit

class LocationsViewController: UIViewController {
    var mapView: MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMapView()
    }
    
    private func setupMapView() {
        mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(mapView!)
    }
    
}
