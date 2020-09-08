//
//  ContentView.swift
//  UI Challenge
//
//  Created by Thobio Joseph on 06/09/20.
//

import SwiftUI

struct ContentView: View {
    var dataIs = [["icon": "🌈","name":"Design"],["icon": "🇮🇳","name":"India"],["icon": "💰","name":"₹500-700K PA"]]
    var dataJob = [["icon":"a","title":"Product Designer","exp":"5+ year","sub":"Kochin, kerala"],["icon":"am","title":"Visual Designer","exp":"2+ year","sub":"Trivandrum, kerala"]]
    @State var indexStart = 0
    var body: some View {
        VStack{
        ScrollView{
            VStack(alignment:.leading){
                // NavigationBar
                HStack{
                    Button(action: {
                        //TODO:-- Button Action
                    }, label: {
                        Image("bar").resizable().frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                    Spacer()
                    Image("profile").resizable().frame(width: 44, height: 44).cornerRadius(10)
                }.padding(.horizontal)
                
                //Name Section
                
                VStack(alignment:.leading){
                    Text("Hi,").font(.subheadline) + Text(" Regina Cassandra").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Have a great day").font(.system(size: 14)).foregroundColor(.gray)
                }
                
                //List Bar
                
                ScrollView (.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0..<dataIs.count){ i in
                            return  RectBox(dataFromSupeView: dataIs[i]).padding(5).background(Capsule().fill(Color("color").opacity(0.2)))
                        }
                    }
                }.frame(height: 50)
                
                HStack{
                    VStack(alignment: .leading) {
                        Text("Jobs for your preferences")
                        Text("26 jobs for you").font(.system(size: 12)).foregroundColor(Color.gray)
                    }
                    Spacer()
                    Button(action: {
                        //TODO:-- Action for the button
                        print("hihi")
                    }, label: {
                        Image(systemName: "slider.horizontal.3").accentColor(Color("color1")).font(.system(size: 20))
                        
                    })
                }.padding(.trailing)
                
                List(0..<dataJob.count) {i in
                    HStack {
                        Image(dataJob[i]["icon"]!).resizable().frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.trailing,5)
                        VStack(alignment: .leading){
                            Text(dataJob[i]["title"]!).font(.title3)
                            Text(dataJob[i]["sub"]!).font(.subheadline).foregroundColor(Color.gray)
                        }
                        Spacer()
                        Text(dataJob[i]["exp"]!).font(.subheadline)
                    }.padding().clipShape(Rectangle())
                }.frame(height:170).padding([.trailing,.vertical]).cornerRadius(10)
                
                HStack{
                    Text("Suggested for you")
                    Spacer()
                    Text("See All")
                }.padding(.trailing)
                HStack(alignment:.center){
                    Spacer()
                    VStack{
                        Image("w").resizable().frame(width:32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("UI Designer")
                        Text("Kottayam, Kerala").font(.subheadline).foregroundColor(.gray)
                        
                    }.padding().background(Color.white).cornerRadius(10)
                    VStack{
                        Image("f").resizable().frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("UI Intern")
                        Text("Chennai, TamilNadu").font(.subheadline).foregroundColor(.gray)

                        
                    }.padding().background(Color.white).cornerRadius(10)
                    Spacer()
                }.padding(.trailing).background(Color.clear)
                
            }.padding([.leading,.vertical])
        }.background(Color.clear)
            CustomTapBar(index: $indexStart)
        }.background(Color.gray.opacity(0.2)).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RectBox:View {
    
    let dataFromSupeView:[String:String]
    
    var body: some View{
        HStack{
            Text(dataFromSupeView["icon"]!)
            Text(dataFromSupeView["name"]!).font(.subheadline).accentColor(Color("color1"))
            Button(action: {
                
            }, label: {
                Image(systemName: "xmark").resizable().accentColor(Color("color1")).frame(width: 8, height: 8)
            })
        }.padding(.horizontal,5)
    }
}

struct CustomTapBar : View {
    @Binding var index:Int
    var body: some View{
        ZStack{
        HStack{
            Button(action: {
                self.index = 0
            }, label: {
                Image(systemName: "house.fill").font(.title).foregroundColor(Color.white)
            }).padding()
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Button(action: {
                self.index = 2
            }, label: {
                Image(systemName: "person.fill").font(.title).foregroundColor(Color.white)
            }).padding()
        }.padding(.horizontal,35).background(Color("color")).clipShape(ShapeTabBar()).clipShape(ButtonBackgroundShape(cornerRadius: 90))
            Button(action: {
                self.index = 1
            }, label: {
                Image(systemName: "magnifyingglass").font(.title).foregroundColor(Color.white)
            }).padding().background(Color.black).clipShape(Circle()).offset(y: -30.0)
        }
    }
}

struct ShapeTabBar:Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addArc(center: CGPoint(x: rect.width/2, y: 0), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
    }
}

struct ButtonBackgroundShape: Shape {

    var cornerRadius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}
