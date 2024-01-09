//
//  CustomImageView.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 07/01/24.
//

import SwiftUI



struct DownloadImageView: View {
    
    let itemWidth: CGFloat
    let itemHeight: CGFloat
   // let cast: Cast
    //var imageType: MovieImageType = .poster
    //var imageString: String = ""
    
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key: String,itemWidth: CGFloat,itemHeight: CGFloat){
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack{
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow( color: Color.theme.background.opacity(0.3), radius: 10, x: 0, y: 2)
        

    }
}

//#Preview {
//    CustomImageActor(url: 150, key: 170,temWidth: "https://via.placeholder.com/600/149540", itemHeight: "1")
//}

//AsyncImage(url: URL(string: vm.isSearching ? imageString : cast.getImageActor(for: imageType))) { image in
//    image
//        .resizable()
//        .scaledToFill()
//      
//} placeholder: {
//    ZStack {
//        ProgressView()
//    }
//}
//.frame(width: itemWidth, height: itemHeight)
//.clipShape(RoundedRectangle(cornerRadius: 20))
//.shadow( color: Color.theme.background.opacity(0.3), radius: 10, x: 0, y: 2)
//}

