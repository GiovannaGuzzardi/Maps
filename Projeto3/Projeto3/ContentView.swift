//
//  ContentView.swift
//  Projeto3
//
//  Created by Student09 on 03/08/23.
//

import MapKit
import SwiftUI


var arrayLocation = [
    LocationI(name: "Brasil",
              coordinate: CLLocationCoordinate2D(latitude :-8.670294999510924, longitude: -56.20158036776577),
              flag:"https://s1.static.brasilescola.uol.com.br/be/conteudo/images/2-bandeira-do-brasil.jpg",
              description: "O Brasil, um vasto país sul-americano, estende-se da Bacia Amazônica, no norte, até os vinhedos e as gigantescas Cataratas do Iguaçu, no sul."),
    LocationI(name: "Luxemburgo",
              coordinate: CLLocationCoordinate2D(latitude :49.61135771482144,longitude:  6.132090454189364),
              flag:"https://paginas.fe.up.pt/~fff/Homepage/Bandeiras/Imagens/luxemburgo_R.gif",
              description: "Luxemburgo é a capital da pequena nação europeia de mesmo nome. Construída entre profundos desfiladeiros cortados pelos rios Alzette e Pétrusse, a cidade é famosa pelas ruínas de fortificações medievais."),
    
    LocationI(name: "República Checa",
              coordinate: CLLocationCoordinate2D(latitude :49.69567678870992    , longitude: 15.142887078783307),
              flag:"https://paginas.fe.up.pt/~fff/Homepage/Bandeiras/Imagens/checa_R.gif",
              description: "A República Tcheca, situada na Europa Central, é um país conhecido pelos castelos ornamentados, pelas cervejas locais e por sua longa história"),
    LocationI(name: "Polonia",

              coordinate: CLLocationCoordinate2D(latitude :  52.871741541536615, longitude: 18.437086106755835),
              flag:"https://paginas.fe.up.pt/~fff/Homepage/Bandeiras/Imagens/polonia_R.gif",
              description: "A Polônia é um país do Leste Europeu na costa do Mar Báltico, conhecido por sua arquitetura medieval e pela herança judaica."),
]


// mkannotation

struct ContentView: View {
    @State private var countries = "Brasil"
    @State private  var region = MKCoordinateRegion(
        center:  CLLocationCoordinate2D(
            latitude :-8.670294999510924,
            longitude: -56.20158036776577
        ),
        span : MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5
        ))
    
    
    func locate( coordinate : CLLocationCoordinate2D , countrie : String) {
        region.center = coordinate
        countries = countrie
        return
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing : 10){
                Text("Mapa Mundi").font(.title)
                Text(countries).font(.title2)
            }
            .padding(30)
            Map(coordinateRegion: $region,
                annotationItems: arrayLocation
            ) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    NavigationLink(destination: File(choise: place) ){
                        Image(systemName: "mappin.and.ellipse")
                            .font(.title)
                            .foregroundColor(.red)
                        
                    }
                }
            }

            
            HStack(spacing: 20){
                ForEach(arrayLocation) {
                    value in
                    Button(action: {locate(coordinate: value.coordinate , countrie: value.name )}) {
                        AsyncImage(url: URL(string: value.flag)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 55, height: 35)
                        .cornerRadius(10)
                        .shadow(radius: 20)
                    }
                }
            }
            .padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
