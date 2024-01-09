
import SwiftUI

struct MovieCard: View {
    
    let movie: Movie
    var type: MovieCardType = .poster
    var imageType: MovieImageType = .poster
    
    var body: some View {
      //  CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
        DownloadImageView(url: movie.getImage(for: imageType), key: "\(movie.id)", itemWidth: itemWidth, itemHeight: itemHeight)
    }
}

extension MovieCard {
    var itemWidth: CGFloat {
        screenWith * type.widthPercent
    }
    
    var itemHeight: CGFloat {
        screenHeight * type.heightPercent
    }
}

#Preview {
    MovieCard(movie: DeveloperPreview.instance.movie)
}
