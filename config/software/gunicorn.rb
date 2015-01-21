name 'gunicorn'
default_version '19.1.1'

dependency 'python'
dependency 'pip'


build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "#{install_dir}/embedded/bin/pip install gunicorn==#{version}", env: env
end

