require 'suds/cleaner'

class DowncaseCleaner < Cleaner
  def initialize  exclude_columns:[], include_columns:[]
    @exclude_columns = [exclude_columns].flatten
    @include_columns = [include_columns].flatten
  end

  def clean data
    Cleaner.clean_array(data) do |k,v|
      next if v.nil?
      if !@include_columns.empty?
        v.downcase if @include_columns.include?(k)
      elsif !@exclude_columns.empty?
        v.downcase! unless @exclude_columns.include?(k)
      else
        v.downcase!
      end
    end
  end
end
