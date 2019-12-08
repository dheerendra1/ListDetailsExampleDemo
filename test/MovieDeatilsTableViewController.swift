//
//  MovieDeatilsTableViewController.swift
//  test
//
//  Created by Dheerendra Singh on 08/12/19.
//  Copyright © 2019 Dheerendra Singh. All rights reserved.
//
import UIKit

class MovieDeatilsTableViewController: UITableViewController {
    var  movieObj:TestMoviesList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = movieObj?.title ?? ""
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
   override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView().estimatedRowHeight
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell:MovieDetailCell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailCell
            var textToShow = ""
            textToShow = self.createTextWithPreviousTextToShow(title: "Year", pText: textToShow, nText: movieObj?.year ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Rated", pText: textToShow, nText: movieObj?.rated ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Released", pText: textToShow, nText: movieObj?.released ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Runtime", pText: textToShow, nText: movieObj?.runtime ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Director", pText: textToShow, nText: movieObj?.director ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Awards", pText: textToShow, nText: movieObj?.awards ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Language", pText: textToShow, nText: movieObj?.language ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Country", pText: textToShow, nText: movieObj?.country ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Actors", pText: textToShow, nText: movieObj?.actors ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Writer", pText: textToShow, nText: movieObj?.writer ?? "N/A")
            textToShow = self.createTextWithPreviousTextToShow(title: "Plot", pText: textToShow, nText: movieObj?.plot ?? "N/A")
            cell.lblMovieDetail?.text = textToShow
            return cell
    }
    
    func createTextWithPreviousTextToShow(title:String, pText:String, nText:String) -> String{
        return pText.isEmpty ? "\(title): \(nText)\n" : "\(pText)\n\(title): \(nText)\n"
    }
    
  
}

class MovieDetailCell: UITableViewCell
{
    @IBOutlet weak var lblMovieDetail: UILabel?
}


