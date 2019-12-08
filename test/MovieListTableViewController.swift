//
//  MovieListTableViewController.swift
//  test
//
//  Created by Dheerendra Singh on 08/12/19.
//  Copyright © 2019 Dheerendra Singh. All rights reserved.
//
import UIKit

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return self.moviesData?.data?.count ?? 0
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MovieListCell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListCell
        
        if (self.moviesData?.data?[indexPath.row].poster) == nil || (self.moviesData?.data?[indexPath.row].poster) == "N/A "
        {
            cell.imgMovie.image = #imageLiteral(resourceName: "icon_MoviewPlaceholder")
        }else{
            
           self.obtainImageWithPath(imagePath: (self.moviesData?.data?[indexPath.row].poster?.trimmingCharacters(in: .whitespaces))!) { (image) in
                   // Before assigning the image, check whether the current cell is visible
            if tableView.cellForRow(at: indexPath) != nil {
                       cell.imgMovie.image = image
                   }
               }
        }
        cell.updateCellData(movieObj: self.moviesData?.data?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self.tblMovieList.isEditing
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tempRecord:TestMoviesList! = self.moviesData?.data?[sourceIndexPath.row] ?? TestMoviesList.init(object: ["":""])
        self.moviesData?.data?.remove(at: sourceIndexPath.row)
        self.moviesData?.data?.insert(tempRecord, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieDeatilsTableViewController") as! MovieDeatilsTableViewController

        vc.movieObj = self.moviesData?.data?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
}
