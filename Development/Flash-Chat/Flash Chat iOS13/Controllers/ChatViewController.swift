

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db=Firestore.firestore()
    
    var message: [Message]=[
        Message(sender: "12@3.com", body: "hello"),
        Message(sender: "12@afa3.com", body: "helfaflo"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title=K.appName
        navigationItem.hidesBackButton=true
        tableView.dataSource=self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier:K.cellIdentifier)
     }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messagebody=messageTextfield.text,let messagesender=Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messagesender,K.FStore.bodyField: messagebody]){
                (error) in
                if let e=error{
                    print("There is an issue saving data")
                }
                else{
                    print("Saved Successfully")
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
}

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        as! MessageCell
        cell.label.text=message[indexPath.row].body
        return cell
    }
    
    
}
