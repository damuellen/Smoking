import Cocoa
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!

    let
    🚥 = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength),
    📆 = Calendar.current
    
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func updateClicked(_ sender: Any) {
        update()
    }

    @objc func update() {
        let 💰 = estimateSavings()
        if 🚥.title != 💰 {
        
            🚥.title = 💰
            let
            📜 = NSUserNotification()
            📜.title = "Savings " + 💰
            📜.deliveryDate = Date()
        
            NSUserNotificationCenter.default.deliver(📜)
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        🚥.title = estimateSavings()
        🚥.menu = statusMenu
        
        let
        📰 = 📆.dateComponents([.year, .month, .day], from: Date()),
        🗞 = 📆.date(byAdding: .day, value: 1, to: 📆.date(from: 📰)!)!
        
        let timer = Timer(fireAt: 🗞,
                          interval: TimeInterval(86400),
                          target: self,
                          selector: #selector(AppDelegate.update),
                          userInfo: nil,
                          repeats: true)
        timer.tolerance = TimeInterval(3600)
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
    }

    func estimateSavings() -> String {
        
        let
        🖊 = DateFormatter()
        🖊.dateFormat = "yyyy.MM.dd"
        
        let
        🎄 = 🖊.date(from: "2015.12.24")!,
        🗓 = 📆.dateComponents([.day], from: 🎄, to: Date()).day!,
        🚬 = 6.0 / 7.0,
        🚫 = (Double(🗓) * 🚬).rounded(),
        💸 = 6.0,
        💶 = NSNumber(value: 🚫 * 💸)
        
        let
        🖍 = NumberFormatter()
        🖍.numberStyle = .currency
        🖍.locale = Locale(identifier: "de_DE")
        
        return 🖍.string(from: 💶)!
    }
}
