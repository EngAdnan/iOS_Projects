//
//  AlbumsListView.swift
//  SingAlongTest
//
//  Created by Adnan Kallas on 2019-12-19.
//  Copyright © 2019 Adnan ALKallas. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"


class AlbumsListView: UICollectionViewController {
    
    var albumsList:[Album]!
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(top: 50.0,
    left: 20.0,
    bottom: 50.0,
    right: 20.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewLayoutSetting()
        fetchListOfAlbums(url:Utils.fetchAlbumsUrl)
        self.clearsSelectionOnViewWillAppear = false

       
    }
    
    func setViewLayoutSetting(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView!.collectionViewLayout = layout
        
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if albumsList != nil {
            return albumsList.count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AlbumViewCell
        let albumLogoUrl = albumsList[indexPath.row].thumbnailUrl
        cell.setAlbumImage(albumLogoUrl: albumLogoUrl)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
   
    
    func fetchListOfAlbums(url:String){
        if Connectivity.isConnectedToInternet {
            SingAlongTestManager.fetchEventDetail(getProgramsUrl: url){ response, error, statusCode in
                if response != nil {
                   
                        self.albumsList = response
                        self.refreshTable()
                    
                }
                else{
                    Utils.showAlertView(title: "Error Message", message: "Something wrong happened", view: self)

                    
                }
                
            }
        }
        else {
            Utils.showAlertView(title: "Error", message: "Check Internet Connection", view: self)

        }
    }
    
    func refreshTable() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            return
        }
    }
    
}

//extension AlbumsListView: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView,
//                       layout collectionViewLayout: UICollectionViewLayout,
//                       sizeForItemAt indexPath: IndexPath) -> CGSize {
//     //2
//     let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//     let availableWidth = view.frame.width - paddingSpace
//     let widthPerItem = availableWidth / itemsPerRow
//
//     return CGSize(width: widthPerItem, height: widthPerItem)
//   }
//
//   //3
//    func collectionView(_ collectionView: UICollectionView,
//                       layout collectionViewLayout: UICollectionViewLayout,
//                       insetForSectionAt section: Int) -> UIEdgeInsets {
//     return sectionInsets
//   }
//
//   // 4
//    func collectionView(_ collectionView: UICollectionView,
//                       layout collectionViewLayout: UICollectionViewLayout,
//                       minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//     return sectionInsets.left - 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//           return 0.0
//       }
//
//}
