# encoding: UTF-8

#WICKED_PDF = {
#	:exe_path => '/usr/bin/wkhtmltopdf'
#}

WickedPdf.config = {
   #:exe_path => '/usr/local/bin/wkhtmltopdf',
#   :exe_path => '/usr/local/bin/wkhtmltopdf',
#   :orientation => 'Landscape',
   :exe_path => "#{Rails.root}/lib/wkhtmltopdf",
   :page_size => 'Letter',
   :footer => { :right => 'Página [page] de [topage]' },
   :header => { :html => { :template => '/pdf/header.pdf.erb' } }
#   :show_as_html => true
#   :footer => { :html => {:template => "layouts/footer.pdf.erb"} }

}
