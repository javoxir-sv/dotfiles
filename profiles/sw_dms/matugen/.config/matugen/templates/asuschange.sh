#!/usr/bin/env bash

# more brighter tones
# asusctl aura effect static -c {{colors.primary.default.hex_stripped}}

# somewhere in-between
# asusctl aura effect static -c "{{ dank16.color4.default.hex_stripped }}"

# makes warmer, darker tone / kinda nice
# asusctl aura effect static -c {{colors.primary_container.default.hex_stripped}}

# the best overall
asusctl aura effect static -c {{palettes.primary._60.hex_stripped}}
