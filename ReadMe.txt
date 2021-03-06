//
//  ReadMe.txt
//  LastFM Song Search
//
//  Created by Alicia Windsor on 26/05/2021.
//  Updated: 27/05/2021

-----------------------
UPDATE: 30/05/2021

Changed functionality so that the webpage is loaded within the application using the WebKit framework.

Ignore the following files are they are for detailed view using json data (not implemented yet) read in from track.getinfo of last.fm API:

- TrackDetail
- Detail Model
- Detail View Model

-----------------------

For this project I attempted to use a traditional MVVM architecture as I will be using SwiftUI for this project and I find this architecture is relatively straight forward to implement. I have chosen to use SwiftUI over UIKit as it requires less code (making it more readable) and is simpler to learn. SwiftUI can be combined with UIViewRepresentable which gives access to UIKit type functionalites meaning I'm not missing out on anything by not using UIKit.

When I began building this application, the first thought was to read the api data then only show results which contained the revelant keyword that was typed into the seach bar. I have noticed that this method allowed the user to search for both song and artist (not album). For the search bar I decided using the UIKit search bar, which was called into SwiftUI using a representable, was better than using a textfield in SwiftUI as it had more preexisting functionality.
 
For the detailed view of each track, I first wanted to use the track.getInfo API as the track.search API I was using thus far did not contain enough information on the track. The challenge was this was whist track.search only took in one term (track), track.getInfo took in tow (track and artist). Getting the track was straight forward as I figured the search term from track.search just needed to be copied over (however thinking about it now I could have just used teh track's title instead so that I would only have to configure one search term, that is for track.search), getting the atrist name from the already track.search was a bit more tricky but I ended up getting the instance which was stored in TrackView and calling that into the artist term.
  
Admittedly I struggled with figuring out the best method for decoding this JSON file as most JSON files I knew how to work with were stored as an array/list, but as this one does not appear to be, it confused me and I was unsure as to how to correctly call the load function for this. As I reached a sort of stagnant point with trying to figure it out, I decided to just have a webpage with the track's information open when the track was selected instead, so as to atleast fulfill that part of the criteria.
  
NOTE: The image loader is loading the image, the there is just no image stored in the URL (see: https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.png for an example).

This project was extremely interesting for me to undertake as I only had previous experience loading locally stored JSON files, learning how to read JSON files from APIs was quite challenging but I have definately learnt a lot from it, I will most likely spend the following days researching and looking at more documentation to get a better understanding of the issues I had as well as hopefully be able fully implement everything correctly as a personal project.

-----------------------
Tools used:

- Last.fm API
    - track.search
    - track.getInfo (not implemented)
- Swift 5
- SwiftUI
- UIViewRepresentable
- URLSession
- JSON Decoder
- Codable
- Combine
- WebKit
- MVVM Architecture
