vim9script

# LLM: Ollama & Qwen
nnoremap <leader>llc :OllamaChat<CR>
vnoremap <leader>llr :OllamaReview<CR>
vnoremap <leader>llt :OllamaTask 
nnoremap <leader>lls :Ollama enable<CR>
nnoremap <leader>lld :Ollama disable<CR>
# load ollama config first
# source ~/.vim/config/ollama.vim

# ~/.vim/pack/plugins/start/vim-ollama/autoload/ollama/config.vim
