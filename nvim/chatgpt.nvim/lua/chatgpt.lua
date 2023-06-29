local http = require("socket.http")
local ltn12 = require("ltn12")

local API_KEY = "your_api_key_here"
local API_ENDPOINT = "https://api.openai.com/v1/engines/text-davinci/jobs"

local request_body = {
  prompt = "What is the meaning of life?",
  max_tokens = 100,
  temperature = 0.5,
  top_p = 1,
}

local response_body = {}
local res, code, response_headers = http.request{
  method = "POST",
  url = API_ENDPOINT,
  headers = {
    ["Content-Type"] = "application/json",
    ["Authorization"] = "Bearer " .. API_KEY,
  },
  source = ltn12.source.string(json.encode(request_body)),
  sink = ltn12.sink.table(response_body),
}

if code == 200 then
  local response = json.decode(table.concat(response_body))
  print("Response: " .. response.choices[1].text)
else
  print("Request failed with code " .. code)
end

