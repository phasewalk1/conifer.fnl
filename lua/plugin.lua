local sakura = {}
local function open_tree()
  local buf = vim.api.nvim_create_buf(false, true)
  local win_opts = {relative = "editor", width = 40, height = vim.api.nvim_get_option("lines"), col = 0, row = 0}
  local win = vim.api.nvim_open_win(buf, true, win_opts)
  local files_tbl = io.popen("ls -a")
  if not files_tbl then
    print("Error executing io.popen")
  else
  end
  local lines = {}
  for file in files_tbl:lines() do
    table.insert(lines, file)
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_win_set_option(win, "number", false)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  local first_line_length = ((lines[1] and #lines[1]) or 0)
  do
    print(("First file: " .. lines[1] .. "Length: " .. first_line_length))
  end
  local namespace_opts = {hl_group = "Title", end_line = 0, end_col = first_line_length}
  return vim.api.nvim_buf_set_extmark(buf, vim.api.nvim_create_namespace("sakura"), 0, 0, namespace_opts)
end
sakura["open-tree"] = open_tree
return sakura
