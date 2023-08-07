(local module {})
(local window (require :window))

(var tree-win nil)

(lambda open-tree []
  (local buf (vim.api.nvim_create_buf false true))
  (local win-opts (window.window-opts))
  (local win (vim.api.nvim_open_win buf true win-opts))
  (set tree-win win)

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
  (vim.api.nvim_buf_set_extmark buf (vim.api.nvim_create_namespace :conifer) 0 0 namespace-opts))

(lambda close-tree []
  (if tree-win
      (do
        (vim.api.nvim_win_close tree-win true)
        (set tree-win nil))))

(lambda toggle-tree []
  (if (not tree-win)
      (open-tree)
      (close-tree)))

(tset module :open-tree open-tree)
(tset module :close-tree close-tree)
(tset module :toggle-tree toggle-tree)

module
