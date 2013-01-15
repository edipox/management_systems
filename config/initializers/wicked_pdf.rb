# encoding: UTF-8

#WICKED_PDF = {
#	:exe_path => '/usr/bin/wkhtmltopdf'
#}

WickedPdf.config = {
   #:exe_path => '/usr/local/bin/wkhtmltopdf',
#   :exe_path => '/usr/local/bin/wkhtmltopdf',
#   :orientation => 'Landscape',
   :exe_path => "#{Rails.root}/lib/wkhtmltopdf",
   :footer => { :right => 'Página [page] de [topage]' },
   :page_size => 'A4'
   #:extra => '--ignore-load-errors'
#   :show_as_html => true
}
