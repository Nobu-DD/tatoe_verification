require "openai"

# Rails全体で利用するOpenAIの設定を保存
Rails.application.config.openai = {
  api_key: ENV.fetch("OPENAI_API_KEY", "default_test_key"),
  default_model: "gpt-4.1-nano"
}
# OpenAIライブラリの初期設定
OpenAI.configure do |config|
  config.access_token = Rails.application.config.openai[:api_key]
  config.log_errors = Rails.env.development?
end
