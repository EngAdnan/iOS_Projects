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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedAlbum = albumsList[indexPath.row].albumId
        viewEventDetails(selectedAlbum: selectedAlbum)
    }
    
    
    
    
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
    
    func viewEventDetails(selectedAlbum:Int){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let eventDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "albumDetailsID") as! AlbumDetailsViewController
        eventDetailsViewController.albumId = selectedAlbum
        eventDetailsViewController.albumDetails = albumsList
        self.navigationController?.pushViewController(eventDetailsViewController, animated: true)
    }
    
}

