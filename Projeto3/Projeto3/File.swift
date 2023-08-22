import SwiftUI
import MapKit


struct File: View {
    var choise : LocationI
    var body: some View {
        VStack(spacing: 30 ){
            Text(choise.name).font(.title)
            AsyncImage(url: URL(string: choise.flag)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 35)
            .cornerRadius(10)
            .shadow(radius: 20)
            Text(choise.description)
            Spacer()
        }.padding(40)
    }
}

struct File_Previews: PreviewProvider {
    static var previews: some View {
        File(choise: LocationI(name: "Brasil",
                               coordinate: CLLocationCoordinate2D(latitude :-8.670294999510924, longitude: -56.20158036776577),
                               flag:"https://s1.static.brasilescola.uol.com.br/be/conteudo/images/2-bandeira-do-brasil.jpg",
                               description: "O Brasil, um vasto país sul-americano, estende-se da Bacia Amazônica, no norte, até os vinhedos e as gigantescas Cataratas do Iguaçu, no sul.")
        )
    }
}


