name 'gunicorn'

dependency 'python'
dependency 'pip'


build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "#{install_dir}/embedded/bin/pip install gunicorn", env: env
end

