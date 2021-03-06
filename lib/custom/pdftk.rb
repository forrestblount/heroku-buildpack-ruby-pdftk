class Pdftk < BaseCustom
  def path
    "#{build_path}/vendor/#{name}"
  end
  def name
    "pdftk"
  end
  def source_url
    "https://s3.amazonaws.com/lexspot-static/pdftk.tar.gz"
  end
  def used?
    File.exist?("#{build_path}/bin/pdftk") && File.exist?("#{build_path}/bin/lib/libgcj.so.10")
  end
  def compile
    write_stdout "compiling #{name}"
    #download the source and extract
    %x{ mkdir -p #{path} && curl --silent #{source_url} -o pdftk.tar.gz }
    %x{ tar -zxvf pdftk.tar.gz -C #{path} } 
    write_stdout "complete compiling #{name}"
  end
  def cleanup!
    
  end
  def prepare
    File.delete("#{build_path}/bin/lib/libgcj.so.10") if File.exist?("#{build_path}/bin/libgcj.so.10")
    File.delete("#{build_path}/bin/pdftk") if File.exist?("#{build_path}/bin/pdftk")
  end
  
end
