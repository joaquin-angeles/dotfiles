return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = function()
    local install_path = vim.fn.stdpath('data') .. '/lazy/telescope-fzf-native.nvim'
    vim.fn.system({
      'cmake', '-S', install_path, '-B', install_path .. '/build', '-DCMAKE_BUILD_TYPE=Release'
    })
    vim.fn.system({
      'cmake', '--build', install_path .. '/build'
    })
  end,
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('telescope').load_extension('fzf')
  end
}
