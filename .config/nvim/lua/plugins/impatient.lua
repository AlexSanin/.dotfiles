return {
  'lewis6991/impatient.nvim',
  config = function()
    local status_ok, impatient = pcall(require, "impatient")
    if status_ok then
      impatient.enable_profile()
    end
  end
}
