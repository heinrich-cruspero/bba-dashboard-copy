# frozen_string_literal: true

##
class AuditDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :edit_audit_path
  def_delegator :@view, :audit_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      sku: { source: 'Audit.sku', cond: :like, searchable: true, orderable: true },
      status: { source: 'Audit.status', cond: :like, searchable: true, orderable: true },
      notes: { source: 'Audit.notes', cond: :like, searchable: true, orderable: true },
      internal_price_4: { source: 'Audit.internal_price_4', cond: :like, searchable: true, orderable: true },
      internal_notes_1: { source: 'Audit.internal_notes_1', cond: :like, searchable: true, orderable: true },
      internal_notes_2: { source: 'Audit.internal_notes_2', cond: :like, searchable: true, orderable: true },
      internal_notes_3: { source: 'Audit.internal_notes_3', cond: :like, searchable: true, orderable: true },
      date_created: { source: 'Audit.date_created', cond: :like, searchable: true, orderable: true }
    }
  end

  private

  def data
    records.map do |audit|
      {
        sku: audit.sku,
        status: audit.status,
        notes: audit.notes,
        internal_price_4: audit.internal_price_4,
        internal_notes_1: audit.internal_notes_1,
        internal_notes_2: audit.internal_notes_2,
        internal_notes_3: audit.internal_notes_3,
        date_created: audit.date_created,
        actions: "#{link_to('Show', audit_path(audit))}
                  #{link_to('Edit', edit_audit_path(audit))}
                  #{link_to('Delete', audit, method: :delete, data: { confirm: 'Are you sure?' })}".html_safe
      }
    end
  end

  def get_raw_records(*)
    Audit.all
  end
end
