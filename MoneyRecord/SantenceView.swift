//
//  SantenceView.swift
//  MoneyRecord
//
//  Created by 白謹瑜 on 2020/12/7.
//

import SwiftUI

struct SantenceView: View {
    var body: some View {
        Form{
            DisclosureGroup("偵探") {
                VStack(alignment: .leading) {
                    ForEach(RecordType.indices, id: \.self) { (author) in
                        Text("\(RecordType[author])")
                    }
                }
            }
            List{
                DisclosureGroup("柯南語錄"){
                    ForEach(Sentance.indices) { (index)  in
                        Text("\(index + 1)"+". "+"\(Sentance[index])")
                    }
                    
                }
            }
        }
    }
}

struct SantenceView_Previews: PreviewProvider {
    static var previews: some View {
        SantenceView()
    }
}

let RecordType = [
    "柯南",
    "新一",
    "服部",
    "毛利小五郎",
]


let Sentance = [
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
