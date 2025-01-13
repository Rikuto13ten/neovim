require('render-markdown').setup({
  heading = {
    border = true
  },

  code = {
    position = 'right',
    width = 'block', -- コードブロックの幅をcontentに合わせる
    left_pad = 2, -- left padding
    right_pad = 2, -- right padding
  },

  indent = {
    enabled = true
  }
})
