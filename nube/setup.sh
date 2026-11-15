#!/bin/bash
# claude-base: reglas y skills comunes de Raul (github.com/rbenitezm/claude-base). Si falla, solo avisa.
{ [ -d ~/claude-base/.git ] && git -C ~/claude-base pull -q --ff-only || git clone -q --depth 1 https://github.com/rbenitezm/claude-base.git ~/claude-base; } && bash ~/claude-base/instalar.sh || echo "AVISO: no se pudo instalar claude-base"
