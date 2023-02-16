package.preload["lapis"] = function()
  lapis = require("lapis")
  app = lapis.Application()

  -- "/" 경로 핸들러
app:get("/", function(self)
  return "Hello, World!"
end)

-- 앱 실행
app:run()

  return lapis
end

