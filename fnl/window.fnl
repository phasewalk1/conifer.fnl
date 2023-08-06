(lambda window-opts []
  {:relative :editor
   :width 40
   :height (vim.api.nvim_get_option :lines)
   :col 0
   :row 0})

(lambda window-opts-n [col row width]
  {:relative :editor
   :width width
   :height (vim.api.nvim_get_option :lines)
   :col col
   :row row})

{:window-opts window-opts
 :window-opts-n window-opts-n}
