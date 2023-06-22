local http = require("socket.http")
local ltn12 = require("ltn12")
local htmlparser = require("htmlparser")

-- 웹 문서 다운로드하세요
local function download_page(url)
  -- 페이지 컨텐츠를 저장하는 테이블
  local content_table = {}

  local request = {
    url = url,
    sink = ltn12.sink.table(content_table)
  }

  local _, _, _ = http.request(request)
  return table.concat(content_table)
end

-- 특정 클래스의 값을 가진 div 요소를 찾으세요
local function find_div_with_class(elements, class_name)
  local result = {}
  for _, element in ipairs(elements) do
    if element.tag == "div" and element.attributes["class"] == class_name then
      table.insert(result, element)
    end
  end
  return result
end

-- HTML 요소를 파싱하여 div class="box-body" 요소를 추출하세요
local function extract_meal_information(html_content)
  local root = htmlparser.parse(html_content)
  local tables = root("table")

  local file = io.open("output.html", "w")
  file:write("<html><head></head><body>")

  for _, table_element in ipairs(tables) do
    file:write("MEAL: " .. table_element:getcontent())
  end
  file:write("</body></html>")
  file:close()
end

local sample_url = "https://school.koreacharts.com/school/meals/B000012373/contents.html"
local page_content = download_page(sample_url)
extract_meal_information(page_content)

