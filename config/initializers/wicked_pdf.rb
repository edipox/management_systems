# encoding: UTF-8

#WICKED_PDF = {
#	:exe_path => '/usr/bin/wkhtmltopdf'
#}

WickedPdf.config = {
   #:exe_path => '/usr/local/bin/wkhtmltopdf',
#   :exe_path => '/usr/local/bin/wkhtmltopdf',
#   :orientation => 'Landscape',
   :exe_path => "#{Rails.root}/lib/wkhtmltopdf",
#   :header => { :html => { :template => "pdf/header.pdf.erb" } }, # NEVER UNCOMMENT THIS LINE, THE APP WILL DIE!!
   :footer => { :right => 'Página [page] de [topage]' },
   :page_size => 'Letter'
#   :show_as_html => true
#   :footer => { :html => {:template => "layouts/footer.pdf.erb"} }

}
