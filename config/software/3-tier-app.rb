name '3-tier-app'

source :git => 'https://github.com/scalr-tutorials/3-tier-app.git'

dependency 'python'
dependency 'pip'


build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "#{install_dir}/embedded/bin/pip install" \
          " --build #{project_dir}/pybuild" \
          ' --requirement ./app/requirements.txt', env: env

  command "mkdir -p #{install_dir}/embedded/app"
  command "rsync -a --delete --exclude=.git --exclude=.gitignore --exclude=pybuild ./app #{install_dir}/embedded"

end
