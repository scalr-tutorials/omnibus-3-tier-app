name '3-tier-app'
default_version '__APP_VERSION__'

source :git => 'https://github.com/scalr-tutorials/3-tier-app.git'

dependency 'python'
dependency 'pip'


build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "#{install_dir}/embedded/bin/pip install" \
          " --build /pybuild" \
          ' --requirement ./app/requirements.txt', env: env

  command "mkdir -p #{install_dir}/embedded/app"
  command "rsync -a --delete ./app #{install_dir}/embedded"

end
