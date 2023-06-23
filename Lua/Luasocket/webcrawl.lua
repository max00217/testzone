local socket = require("socket")
local http = require("socket.http")
local url = require("socket.url")
local ltn12 = require("ltn12")
local json = require("dkjson")

-- 구글 검색 API 사용
-- https://developers.google.com/custom-search/v1/introduction 참조
-- API 키 및 사용자 정의 검색 엔진 ID를 설정
local API_KEY = "AIzaSyDBGw1yqrif7VAvwKssiMF2api7U4ijNkk"
local SEARCH_ENGINE_ID = "e0393df07af884623"
local GOOGLE_SEARCH_API_URL = "https://www.googleapis.com/customsearch/v1"

-- 검색 질의와 결과 인덱스를 매개변수로 받아 검색 결과를 반환하는 함수
function google_search(query, start_index)
  local response = {}
  local search_url = GOOGLE_SEARCH_API_URL
  search_url = search_url .. "?key=" .. API_KEY
  search_url = search_url .. "&cx=" .. SEARCH_ENGINE_ID
  search_url = search_url .. "&start=" .. tostring(start_index)
  search_url = search_url .. "&q=" .. url.escape(query)

  http.request{
    url = search_url,
    sink = ltn12.sink.table(response)
  }
  local result_str = table.concat(response)
  return json.decode(result_str)
end

local searchTerm = "Warframe Excalibur Build"
local startIndex = 1
local result = google_search(searchTerm, startIndex)

-- 결과 출력
if result.items then
  for i, item in ipairs(result.items) do
    print("#" .. tostring(i + startIndex - 1) .. ": " .. item.title .. " - " .. item.link)
  end
else
  print("검색 결과가 없습니다.")
  print("API 응답: " .. json.encode(result))
end
