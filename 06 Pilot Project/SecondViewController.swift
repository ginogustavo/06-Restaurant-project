//
//  SecondViewController.swift
//  06 Pilot Project
//
//  Created by AcademiamovilesAir on 1/28/19.
//  Copyright © 2019 index. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var fondo2: UIImageView!
    @IBOutlet weak var tableViewCategoria: UITableView!
    
    //Declarar variable para recibir los datos para la tabla de categorias
    var arrayCategorias = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DataBase.checkAndCreateDatabase(withName: "ComidasBD.sqlite")
        arrayCategorias = DataBase().ejecutarSelect("Select * from categoria_platos ") as! [[String:String]]

    }


    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            //Landscape
            fondo2.image = UIImage(named: "forest")
        }else{
            //Portrait
            fondo2.image = UIImage(named: "v0_fondocompleto")
        }
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "categoria1", for: indexPath)
        let index = indexPath.row
        
        let categoria = arrayCategorias[index]
        let id = categoria["id_categoria"]
        let nombre = categoria["nombre_categoria"]
        celda.textLabel?.text = nombre
        
        return celda
    }
    
    
    
    
    
    
    
}
