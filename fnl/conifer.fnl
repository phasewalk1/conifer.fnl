(local plugin {})
(local tree (require :tree))
(local window (require :window))

(tset plugin :open-tree (. tree :open-tree))
(tset plugin :close-tree (. tree :close-tree))
(tset plugin :toggle-tree (. tree :toggle-tree))

(tset plugin :window-opts (. window :window-opts))
(tset plugin :window-opts-n (. window :window-opts-n))

plugin
