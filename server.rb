# encoding: utf-8
require 'webrick'
require 'json'

# 設定伺服器連接埠為 8000，文檔根目錄為當前資料夾
server = WEBrick::HTTPServer.new(
  :Port => 8000,
  :DocumentRoot => File.expand_path('.'),
  :AccessLog => [], # 隱藏詳細請求日誌以保持後台乾淨
  :Logger => WEBrick::Log.new(nil, WEBrick::BasicLog::WARN)
)

# API Servlet 用於處理身心能量分析
class AnalyzeServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(req, res)
    res.status = 200
    res.content_type = "application/json; charset=utf-8"
    
    begin
      # 讀取前端發送的 JSON 資料
      params = JSON.parse(req.body)
      text = params['text'] || ""
      
      # 執行身心關鍵字庫匹配分析
      result = analyze_symptom(text)
      
      res.body = JSON.generate(result)
    rescue => e
      res.status = 500
      res.body = JSON.generate({ :error => "後台分析失敗: #{e.message}" })
    end
  end

  private

  # 本地語意比對引擎 (對照原本前端 index.html 的邏輯)
  def analyze_symptom(text)
    # 預設頻率為 528Hz (奇蹟修復)
    freq = 528
    theme = "528 Hz 奇蹟細胞修復音樂"
    sym_tag = "日常精神疲勞、消化與能量阻滯"
    emo_tag = "焦慮、心神不寧、過度緊繃"
    mapping_desc = "胃部與太陽神經叢代表我們吸收外在事件的能力。當外界資訊或壓力過載時，胃部會緊縮。528Hz 的能量振頻專注於舒緩太陽神經叢的壓迫，調節副交感神經，協助胃部平滑肌重新放鬆。"
    lesson = "學會放手，臣服於當下，信任事情會有最好的安排。"
    root_cause = "試圖掌控生活中的每一件小事，對未知產生抗拒與焦慮。這股緊繃感直接壓迫了您的消化系統，導致身體發出『請停止過度負荷』的訊號。"
    affirmation = "我允許自己放下不屬於我的控制，我是安全的，我被宇宙溫柔地支持著。"

    # 關鍵字檢測 (Ruby 正則表達式)
    if text =~ /狗|貓|寵物|不見|丟|失蹤|財務|金錢|安全感|下背|下腰|膝蓋|無力|怕/
      freq = 396
      theme = "396 Hz 大地接地安神音樂"
      sym_tag = "下背部僵硬、膝蓋無力、心慌氣促"
      emo_tag = "失去根基的焦慮、恐懼、內疚與自責"
      mapping_desc = "海底輪是生存安全感的根基。寵物失蹤或財物損失會直接動搖我們的安全根基，導致心神飄忽、強烈恐慌。396Hz 能引導能量沉降、與大地重新連結，釋放『找不到牠』或『做錯決定』產生的自責。"
      lesson = "在不可控的分離與變故中重新自我定錨，釋放不理性的自責。"
      root_cause = "將不安全感與自我價值過度綁定。當連結中斷時，潛意識啟動了強烈的生存防衛（恐懼與自責），使您陷入無法自拔的焦慮循環。"
      affirmation = "我釋放恐懼與自責。我和我的所愛在能量上永遠相連。我是安全且踏實的。"
      
    elsif text =~ /撞|車|生氣|打人|想打人|心情很差|氣憤|委屈|突發|意外|不公平|車禍|怒氣/
      freq = 417
      theme = "417 Hz 療癒水波清理音樂"
      sym_tag = "胸口發熱、雙手緊繃握拳、呼吸急促"
      emo_tag = "極度憤怒、挫折感、無力感、疆界被侵犯的憋屈"
      mapping_desc = "本我輪象徵我們的個人邊界與行動力。車子被撞等突發不公事件，潛意識會視為『邊界被無端侵犯』，進而本能地啟動『戰或逃』的攻擊衝動（想打人）。417Hz 能溫和疏導這股滾燙的火氣，清理創傷。"
      lesson = "學習在失控、不公的突發事件中重新自我定錨，釋放對絕對掌控的執著。"
      root_cause = "憤怒是為了掩蓋『無法掌控外在變數』的被動與無力感。如果強行壓抑或以暴力宣洩這股能量，最終只會二次傷害您的身心。"
      affirmation = "我允許自己生氣，但我拒絕用別人的錯誤懲罰我自己的身體。我是安全的，我可以慢慢平息。"
      
    elsif text =~ /難過|傷心|心痛|胸口|胸悶|哭|愛|分手|吵架|關係|社交/
      freq = 639
      theme = "639 Hz 心輪和諧敞開音樂"
      sym_tag = "胸口沉重緊繃、窒息感、眼眶發酸"
      emo_tag = "悲傷、失落感、孤單、社交或情感焦慮"
      mapping_desc = "心輪代表愛與人際關係的連結。遭遇吵架、分手或情感重創時，胸口會像塞了重物般緊繃。639Hz 能以溫柔的大調和弦，軟化防禦機制，敞開緊閉的心扉，帶來寬恕與自愛的能量。"
      lesson = "培育對自己與他人的慈悲心，理解萬物連結，練習健康自愛。"
      root_cause = "害怕被遺棄或習慣在人際中壓抑自我需求（討好型人格）。當情感連結受挫時，身體將這股悲傷化為生理上的胸悶與窒息感。"
      affirmation = "我敞開心扉，給予並接受愛。我無條件地愛並接納原本的自己。"
      
    elsif text =~ /喉嚨|說不出|表達|聲音|說話|感冒|咳嗽|固執|發聲/
      freq = 741
      theme = "741 Hz 喉輪清毒表達音樂"
      sym_tag = "喉嚨緊縮卡頓、咽喉腫痛、慢性咳嗽"
      emo_tag = "表達受阻、敢怒不敢言、固執防衛"
      mapping_desc = "喉嚨代表我們的真實發聲與創造力。當我們敢怒不敢言、為了迎合他人而壓抑真實想法時，喉部能量會嚴重淤積。741Hz 專注於清理喉輪淤塞，喚醒內在聲音。"
      lesson = "練習真實表達自己，建立健康的溝通界線，釋放積壓的真實心聲。"
      root_cause = "害怕表達真實想法會引發衝突或不被喜愛。長期委曲求全，使喉部與頸部肌肉形成慢性緊張，影響免疫力。"
      affirmation = "我勇敢而溫柔地為自己發聲。我的真實聲音是美麗且有力量的。"
      
    elsif text =~ /想太多|停不下來|雜念|思緒|偏頭痛|頭痛|完美|腦袋|理性/
      freq = 852
      theme = "852 Hz 消除思緒雜念音樂"
      sym_tag = "太陽穴緊痛、腦袋發熱、夜間失眠多夢"
      emo_tag = "過度思考、大腦雜音打轉、完美主義精神衰竭"
      mapping_desc = "眉心輪代表直覺與內在清明。完美主義或試圖用理智解決生活中的每一件事，會導致能量過度集中於頭部，使大腦無法降溫。852Hz 能引導頭部能量下沈，消除紛亂反芻思緒。"
      lesson = "釋放理智過載，學會將能量帶回身體（接地），信任生命之流。"
      root_cause = "不理性的『必須完美、不容許出錯』的核心信念，促使交感神經睡前持續亢奮，將大腦當作戰場，引發失眠與偏頭痛。"
      affirmation = "我允許自己卸下一天的重擔。我的大腦可以安心休息。此時此刻，我是放鬆的。"
    end

    {
      :freq => freq,
      :theme => theme,
      :symTag => sym_tag,
      :emoTag => emo_tag,
      :mappingDesc => mapping_desc,
      :lesson => lesson,
      :rootCause => root_cause,
      :affirmation => affirmation
    }
  end
end

# 掛載 API 端點
server.mount('/api/analyze', AnalyzeServlet)

# 設定關閉伺服器的訊號處理
trap('INT') { server.shutdown }

# 啟動後台服務
server.start
