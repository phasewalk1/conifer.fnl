(local coniferous {})
(local window (require :window))

(lambda open-tree []
  (local buf (vim.api.nvim_create_buf false true))
  (local win-opts (window.window-opts))
  (local win (vim.api.nvim_open_win buf true win-opts))

  (local files-tbl (io.popen "ls -a"))
  (if (not files-tbl)
      (print "Error executing io.popen"))

  (local lines [])
  (each [file (files-tbl:lines)]
    (table.insert lines file))

  (vim.api.nvim_buf_set_lines buf 0 -1 false lines)

  (vim.api.nvim_win_set_option win :number false)
  (vim.api.nvim_buf_set_option buf :bufhidden :wipe)

  (local first-line-length (or (and (. lines 1) (length (. lines 1))) 0))
  (do
    (print (.. "First file: " (. lines 1) "Length: " first-line-length)))
  (local namespace-opts {:hl_group "Title"
                         :end_line 0
                         :end_col first-line-length})
  (vim.api.nvim_buf_set_extmark buf (vim.api.nvim_create_namespace :coniferous) 0 0 namespace-opts))

(tset coniferous :open-tree open-tree)

coniferous
