//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import HTTPRPC

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private(set) static var serviceProxy: WSWebServiceProxy!

    var window: UIWindow?

    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        // Create the URL session
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.requestCachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData

        let delegateQueue = NSOperationQueue()
        delegateQueue.maxConcurrentOperationCount = 10

        let session = NSURLSession(configuration: configuration, delegate: nil, delegateQueue: delegateQueue)

        // Initialize the web service proxy
        let baseURL = NSURL(string: "http://localhost:8080/httprpc-server-demo/notes/")

        AppDelegate.serviceProxy = WSWebServiceProxy(session: session, baseURL: baseURL!)

        return true
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow()

        window!.rootViewController = UINavigationController(rootViewController: MainViewController())

        window!.backgroundColor = UIColor.whiteColor()
        window!.frame = UIScreen.mainScreen().bounds

        window!.makeKeyAndVisible()

        return true
    }
}