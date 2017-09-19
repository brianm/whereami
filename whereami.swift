import Foundation
import CoreLocation

class Thing: NSObject, CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateTo newLocation: CLLocation, from oldLocation: CLLocation) {
        print("\(newLocation.coordinate.latitude)\t\(newLocation.coordinate.longitude)")
        CFRunLoopStop(CFRunLoopGetCurrent());
    }

    func run() -> (Int32, String) {
        switch CLLocationManager.authorizationStatus() {
        case .restricted:            
            return (1, "You don't have permission to use Location Services.")
        case .denied:
            return (2, "You denied permission to use Location Services, please enable it in Preferences.")            
        default:
            if (!CLLocationManager.locationServicesEnabled()) {
                return (3, "Location Services are not enabled for this computer, please enable them in Preferences.")                
            }
        }

        let manager = CLLocationManager();
        manager.delegate = self;
        manager.startUpdatingLocation();

        CFRunLoopRunInMode(CFRunLoopMode.defaultMode, 15, false)
        return (0, "")
    }
}

let (rs, msg) = Thing().run()
if rs != 0 {
    print(msg)
    exit(rs)
}

