//
//  ContentView.swift
//  MoneyRecord
//
//  Created by 白謹瑜 on 2020/11/1.
//

import SwiftUI

struct ContentView: View {
    
    var RecordType = [
        "柯南",
        "新一",
        "服部",
        "毛利小五郎",
    ]
    
    var Sentance = [
        "真相永遠只有一個！",
        "兇手就是你！",
        "越是不明白就越是興奮，我壓抑不住心底的好奇心。",
        "只要試過一次就停不下來了，這就是偵探工作的魅力所在啊！",
        "推理是不分輸贏、不分高低的，因為…事實永遠只有一個！",
        "只要是犯罪，無論有什麼樣的理由，都不可能名正言順。",
        "在這個世界上是絕對不可能有什麼解不開的案子！",
        "私情往往會妨礙推理，讓人遠離事實真相。",
        "所有的謎題都是人想出來的，只要動動腦一定想的出來。",
        "只要是犯罪，不管什麼理由都無法使它合理化的。",
        "如果只是沉溺在夢想之中，就無法看清真相了。",
        "放心啦！喜歡福爾摩斯的人不會是壞人！",
        "執著於復仇與憎恨，即使美好就在眼前，也會視而不見。",
        "月亮不是為了弔喪死者，而是為了使真相更加明朗。",
        "流動的水沒有形狀，漂流的風找不到蹤跡，任何案件的推理都取決於心！",
        "喜歡你！因為我喜歡你，比地球上的任何人都喜歡！",
        "被罪惡染成黑色的畫布，用巧妙的推理來使它變色吧！",
        "時間是縱軸，我是橫軸，將推理刻印在戀情與案件之上！",
        "睜大雙眼進行創造，推理預示著明天！",
        "無論罪犯計畫得多麼周全，笑到最後的也不會是罪犯。",
        "你給我記住，犯罪和魔法不同，罪行是不可能消除的！",
        "因為妳跟她很像，所以我才那麼努力的搜集證據，證明妳是清白的。",
        "揭露真相是偵探的本性。",
        "我去一下廁所！"
    ]
    
    
    
    @State private var Role = false
    @State private var Reference = false
    @State private var brightnessAmount : Double = 1
    @State private var RecordDate = Date()
    @State private var SelectIndexInt = 0
    @State private var SelectSentanceIndexInt = 0
    @State private var SelectSentance = "真相永遠只有一個！"
    @State private var Textfield = "流動的水沒有形狀，漂流的風找不到蹤跡，任何案件的推理都取決於心！"
    
    @State var xAmount : CGFloat = 0.0
    @State var yAmount : CGFloat = 0.0
    @State var textsize : CGFloat = 1.0
    @State private var textColor = Color.black
    
    @State private var showWebpage = false
    @State private var showAlert = false
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                ZStack{
                    Image("\(RecordType[SelectIndexInt])")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width , height: geometry.size.width / 4 * 3)
                        .clipped()
                        //                    .brightness(brightnessAmount)
                        .opacity(brightnessAmount)
                    if Reference{
                        
                        Text(
                            "\(Sentance[SelectSentanceIndexInt])"
                        )
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .background(
                            Rectangle()
                                .foregroundColor(.white)
                                .opacity(0.5)
                        )
                        .offset(x: 0, y: 120)
                        
                        
                    } else {
                        Text(
                            "\(Textfield)"
                        )
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .background(
                            Rectangle()
                                .foregroundColor(.white)
                                .opacity(0.5)
                        )
                        .offset(x: 0+xAmount, y: 120+yAmount)
                        .scaleEffect(textsize)
                        .foregroundColor(textColor)
                        
                    }
                }
                VStack{
                    Toggle("參考語錄", isOn: $Reference)
                    if Reference {
                        
                        Picker(selection: $SelectSentanceIndexInt, label: Text("語錄選擇")){
                            ForEach(Sentance.indices){ index in
                                Text(Sentance[index])
                                
                            }
                            
                        }
                        Button(action: {
                            Textfield = Sentance[SelectSentanceIndexInt]
                            showAlert = true
                        }, label: {
                            HStack{
                                Image(systemName: "hand.thumbsup")
                                Text("確定")
                            }.background(
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                            )
                            
                        })
                        .alert(isPresented: $showAlert, content: {
                            let re = "已選擇！！"
                            return Alert(title: Text(re))
                        })
                        
                    }
                    
                    
                }
                Form{
                    VStack{
                        Toggle("偵探選擇", isOn: $Role)
                        if Role {
                            Picker(selection: $SelectIndexInt, label: Text("選擇類別")){
                                ForEach(RecordType.indices){ (index) in
                                    Text(RecordType[index]).tag(index)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }
                    HStack{
                        TextField("真相只有一個！", text: $Textfield)
                            .padding(.all)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.blue, lineWidth: 3))
                        
                        Button(action: {
                            let number = Int.random(in: 0...Sentance.endIndex-1)
                            Textfield = Sentance[number]
                        }, label: {
                            Text("隨便想")
                            
                            
                        })
                    }
                    HStack{
                        Text("您選擇 ： \(RecordType[SelectIndexInt])")
                        DatePicker("  Date:", selection: $RecordDate  ,in:Date()... ,displayedComponents: .date)
                        
                        
                    }
                    HStack{
                        Text("亮度")
                        SliderView(brightnessAmount: $brightnessAmount)
                    }
                    DisclosureGroup("文字調整"){
                        HStack{
                            Stepper(value: $xAmount, in: -200...200, step: 5){
                                Text("x = \(Int(xAmount))")
                            }
                            Stepper(value: $yAmount, in: -200...200, step: 5){
                                Text("y = \(Int(yAmount))")
                            }
                        }
                        HStack{
                            Stepper(value: $textsize, in: 0.0...10, step: 0.1){
                                Text("大小 = \(Int(textsize))")
                            }
                        }
                        HStack{
                            ColorPicker("顏色", selection: $textColor)
                        }
                    }
                    //                    ColorPicker(
                    
                    
                }.frame(height: 320)
                
                HStack{
                    Button("分享!") {
                        self.showWebpage = true
                    }
                    .sheet(isPresented: $showWebpage) {
                        SafariView(url: URL(string: "https://line.me/R/")!)
                         }
                }
            }
            
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       
        ContentView()
    }
}

struct SliderView: View {
    @Binding var brightnessAmount : Double
    var body: some View {
        Slider(value: $brightnessAmount, in: 0.5...1, minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small), maximumValueLabel: Image(systemName: "sun.max.fill").imageScale(.large)){
            Text("")
        }
    }
}
