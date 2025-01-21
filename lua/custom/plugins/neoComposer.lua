return {
  'ecthelionvi/NeoComposer.nvim',
  dependencies = { 'kkharji/sqlite.lua' },
  event = { 'BufNewFile', 'BufRead' },
  opts = { queue_most_recent = true },
}
