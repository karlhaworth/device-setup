mkdir -p ~/.pip
cat <<'EOF' >>~/.pip/pip.conf
[global]
only-binary = :all:
EOF
