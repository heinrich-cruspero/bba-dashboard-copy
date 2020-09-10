# frozen_string_literal: true

##
class CustomIsbnDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :edit_custom_isbn_path
  def_delegator :@view, :custom_isbn_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      text_isbn: { source: 'CustomIsbn.text_isbn', cond: :like, searchable: true, orderable: true },
      alt_isbn: { source: 'CustomIsbn.alt_isbn', cond: :like, searchable: true, orderable: true },
      custom_isbn: { source: 'CustomIsbn.custom_isbn', cond: :like, searchable: true, orderable: true },
      code_isbn: { source: 'CustomIsbn.code_isbn', cond: :like, searchable: true, orderable: true },
      tag: { source: 'CustomIsbn.tag', cond: :like, searchable: true, orderable: true }
    }
  end

  private

  def data
    records.map do |custom_isbn|
      {
        text_isbn: custom_isbn.text_isbn,
        alt_isbn: custom_isbn.alt_isbn,
        custom_isbn: custom_isbn.custom_isbn,
        code_isbn: custom_isbn.code_isbn,
        tag: custom_isbn.tag,
        actions: "#{link_to('Show', edit_custom_isbn_path(custom_isbn))}
                  #{link_to('Edit', custom_isbn_path(custom_isbn))}
                  #{link_to('Delete', custom_isbn, method: :delete, data: { confirm: 'Are you sure?' })}".html_safe
      }
    end
  end

  def get_raw_records(*)
    CustomIsbn.all
  end
end
