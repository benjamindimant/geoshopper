import UIKit

class ListViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TaskViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 4, right: 0)
        collectionView.backgroundColor = UIColor(white: 0.97, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    let cellIdentifier = "cell"
    
    var items: [String] = {
        var items = [String]()
        for i in 1 ..< 20 {
            items.append("Item \(i)")
        }
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.pinEdgesToSuperView()
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TaskViewCell
        cell.itemNameLabel.text = items[indexPath.item]
        cell.delegate = self
        return cell
    }
}

extension ListViewController: SwipeableCollectionViewCellDelegate {
    func hiddenContainerViewTapped(inCell cell: UICollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        items.remove(at: indexPath.item)
        collectionView.performBatchUpdates({
            self.collectionView.deleteItems(at: [indexPath])
        })
    }
}
