//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ChangeFontSize {
    @IBOutlet weak var tableViewOne: UITableView!
    var currentSize:Float = 8.5
    func changeFontSize(size:Float) {

       currentSize = size
    tableViewOne.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return Movie.allMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = Movie.allMovies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "movies")
        cell?.textLabel?.text = movie.name
        cell?.detailTextLabel?.text = movie.genre
        cell?.textLabel?.font = UIFont(name: "Helvetica", size: CGFloat(currentSize))
       
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       tableViewOne.delegate = self
        tableViewOne.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SecondViewController else {fatalError()}
        destination.delegate = self
        let cells = tableViewOne.visibleCells
        for cell in cells {
            destination.currentValue = Float((cell.textLabel?.font.pointSize)!)
        }
    }
}

