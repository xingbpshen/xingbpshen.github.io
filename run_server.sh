#!/bin/bash

#bundle exec jekyll liveserve
#bundle exec jekyll serve --livereload

bundle exec jekyll clean
bundle exec jekyll serve --livereload --incremental --force_polling