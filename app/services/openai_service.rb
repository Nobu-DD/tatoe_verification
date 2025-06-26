class OpenaiService
  def initialize
    @client = OpenAI::Client.new
    @default_model = Rails.application.config.openai[:default_model]
  end

  def fetch_response(prompts)
  @client.chat(
      parameters: {
        model: @default_model,
        messages: [
          { role: "system",
            content: "あなたは優秀な例え話の達人です。「知らないジャンル」、「知っているジャンル」、「質問」の順番で送信するので、「知らないジャンル」への「質問」を「知っているジャンル」で例えてほしいです。" },
          { role: "user",
            content: <<~TEXT
              知らないジャンル: #{prompts[:unknown_genre]}
              知っているジャンル: #{prompts[:known_genre]}
              質問: #{prompts[:question]}
            TEXT
          }
        ],
        max_tokens: 150,
        temperature: 0.7
      }
    )
  end
end