import SwiftUI

struct Option: Hashable {
    let title: String
    let imageName: String
}

struct MainPage: View {
    let options: [Option] = [
        .init(title: "Rate Calculator", imageName: "house"),
        .init(title: "Production Calculator", imageName: "info.circle"),
        .init(title: "License Calculator", imageName: "gear"),
        .init(title: "Profile", imageName: "person"),
    ]
    @State private var selectedOption: Option?
    
    var body: some View {
        NavigationView {
            ListView(options: options, selectedOption: $selectedOption)
            
            MainView(option: selectedOption)
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct MainView: View {
    let option: Option?
    
    var body: some View {
        VStack {
            if let selectedOption = option {
                switch selectedOption.title {
                case "Rate Calculator":
                    RateCalculator()
                case "Production Calculator":
                    ProductionCalculator()
                case "License Calculator":
                    LicenseCalculator()
                case "Profile":
                    Text("The profile page")
                default:
                    RateCalculator()
                }
            } else {
                RateCalculator()
            }
        }
    }
}

struct ListView: View {
    let options: [Option]
    @Binding var selectedOption: Option?
    
    var body: some View {
        VStack {
            ForEach(options, id: \.self){ option in
                Button(action: {
                    selectedOption = option
                }, label: {
                    HStack {
                        Image(systemName: option.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                        
                        Text(option.title)
                        
                        Spacer()
                    }
                    .padding(5)
                })
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
        }
        .padding([.top, .leading], 20)
        .frame(maxWidth: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
