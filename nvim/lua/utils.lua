local M = {}

function M.toggleDebugLine()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local current_buf = vim.api.nvim_get_current_buf()

  -- 获取当前行内容
  local current_line_content = vim.api.nvim_buf_get_lines(current_buf, current_line - 1, current_line, false)[1]

  -- 获取当前行缩进
  local current_indent = current_line_content:match "^%s*"

  if current_line_content:find "import ipdb; ipdb.set_trace()" then
    vim.api.nvim_buf_set_lines(current_buf, current_line - 1, current_line, false, {})
    return
  end

  if current_line > 1 then
    -- 获取当前行的上一行内容
    local prev_line_content = vim.api.nvim_buf_get_lines(current_buf, current_line - 2, current_line - 1, false)[1]

    -- 如果上一行内容与 'import ipdb; ipdb.set_trace()' 相匹配，则删除上一行
    if prev_line_content:find "import ipdb; ipdb.set_trace()" then
      vim.api.nvim_buf_set_lines(current_buf, current_line - 2, current_line - 1, false, {})
      -- 移动光标到当前行
      vim.api.nvim_win_set_cursor(0, { current_line - 1, 1 })
    else
      -- 在当前行的上方添加 'import ipdb; ipdb.set_trace()'
      vim.api.nvim_buf_set_lines(
        current_buf,
        current_line - 1,
        current_line - 1,
        false,
        { current_indent .. "import ipdb; ipdb.set_trace()" }
      )
    end
  end
end

return M
