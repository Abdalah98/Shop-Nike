//
//  ShoeDetailTableViewController.swift
//  Shop Nike
//
//  Created by Abdalah on 12/4/1440 AH.
//  Copyright © 1440 AH Abdalah. All rights reserved.
//

import UIKit
// indentife
struct Storyboard {
    static let showImagesPageVC = "ShowImagesPageViewController"
    static let shoeDetailCell = "ShoeDetailCell"
    static let productDetailCell = "ProductDetailsCell"
    static let suggestionCell = "SuggestionCell"
    static let buyButtonCell = "BuyButtonCell"
}
class ShoeDetailTableViewController: UITableViewController {
 var shoe: Shoe!
    @IBOutlet weak var shoeImagesHeaderView: ShoeImageHeaderView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = shoe.name
        
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tabBarController?.tabBar.items![1].badgeValue = "2"
    }
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.shoeDetailCell, for: indexPath) as! ShoeDetailCell
            cell.shoe = shoe
            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.buyButtonCell, for: indexPath)
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailCell, for: indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.suggestionCell, for: indexPath) as! SuggestionTableViewCell
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 3{
            if let cell = cell as? SuggestionTableViewCell{
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false

            }
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row == 3 {
                return self.tableView.bounds.width + 68
            }else
            {
                return UITableView.automaticDimension
            }
    }
}
// MARK: - UICollectionViewDataSource

extension ShoeDetailTableViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.suggestionCell, for: indexPath)as!SuggestionCollectionViewCell
        let shoes = Shoe.fetchShoes()
        cell.image = shoes[indexPath.item].images?.first
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 2.5
        let itemWidth = (collectionView.bounds.width - 5.0) / 2.0
        return CGSize(width: itemWidth, height: itemWidth)
    }
    // MARK -> navigation
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showImagesPageVC{
            if let imagePageVC  = segue.destination as? ShoeImagePageViewController {
                imagePageVC.images = shoe.images
                imagePageVC.pageViewControllerDelegate = shoeImagesHeaderView
            }
        }
    }
    
}
