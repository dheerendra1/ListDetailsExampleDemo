//
//  MoviesListViewController.swift
//  test
//
//  Created by Dheerendra Singh on 08/12/19.
//  Copyright © 2019 Dheerendra Singh. All rights reserved.
//

import UIKit
import SwiftyJSON
typealias ImageCacheLoaderCompletionHandler = ((UIImage) -> ())

class MoviesListViewController: UIViewController {

    @IBOutlet weak var tblMovieList: UITableView!

    var movies:TestMoviesList?
    var moviesData: TestMovies?
    
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<NSString, UIImage>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getMovieList()
        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        session = URLSession.shared
        self.cache = NSCache()
       super.init(coder: aDecoder)
    }
    
    @IBAction func editButtonToggle(_ sender: UIButton) {
        self.tblMovieList.isEditing = !self.tblMovieList.isEditing
        sender.setTitle(self.tblMovieList.isEditing ? "Done": "Edit", for: .normal)
    }
    // MARK: - Movie List API Call
    func getMovieList()
    {
        Utils.sharedInstance.addActivity(self)
        ServiceModel.getMovieList { (success, response, error) in
            
            if (success != nil)
            {
                DispatchQueue.main.async(execute: {
                    Utils.sharedInstance.clearActivity(self)
                })
                var jsnObj: JSON = JSON.null
                if(response != nil)
                {
                    do {
                        jsnObj = try JSON(data: response!)
                        
                    } catch {
                        //print("")
                    }
                    
                }
                
                if(jsnObj != JSON.null)
                {
                    
                    self.moviesData = TestMovies.init(object: jsnObj )
                    self.tblMovieList.reloadData()
                    
                }
                
            }else
            {
                DispatchQueue.main.async(execute: {
                    Utils.sharedInstance.clearActivity(self)
                    
                })
            }
            
        }
    }
    // MARK: - DownLoad images
    func obtainImageWithPath(imagePath: String, completionHandler: @escaping ImageCacheLoaderCompletionHandler) {
        if let image = self.cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let url: URL! = URL(string: imagePath)
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: imagePath as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img)
                    }
                }
            })
            task.resume()
        }
    }
    
}
// MARK: - Movie Cell
class MovieListCell: UITableViewCell
{
    @IBOutlet weak var lblMovieName: UILabel?
    @IBOutlet weak var lblGenre: UILabel?
    @IBOutlet weak var imgMovie: UIImageView!
    
    func updateCellData(movieObj:TestMoviesList?)
    {
        lblMovieName?.text = movieObj?.title
        lblGenre?.text = movieObj?.genre
        
    }
}

