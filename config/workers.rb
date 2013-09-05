Dir[File.expand_path('app/workers/*.rb', PADRINO_ROOT)].each{|file|require file}
