# frozen_string_literal: true

##
class TrackedSkuDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :new_audit_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      asin: { source: 'TrackedSku.asin', cond: :like, searchable: true, orderable: true },
      isbn: { source: 'TrackedSku.isbn', cond: :like, searchable: true, orderable: true },
      publication_date: { source: 'TrackedSku.publication_date', cond: :like, searchable: true, orderable: true },
      title: { source: 'TrackedSku.title', cond: :like, searchable: true, orderable: true },
      author: { source: 'TrackedSku.author', cond: :like, searchable: true, orderable: true },
      publisher: { source: 'TrackedSku.publisher', cond: :like, searchable: true, orderable: true },
      binding: { source: 'TrackedSku.binding', cond: :like, searchable: true, orderable: true },
      condition: { source: 'TrackedSku.condition', cond: :like, searchable: true, orderable: true },
      location: { source: 'TrackedSku.location', cond: :like, searchable: true, orderable: true },
      sku: { source: 'TrackedSku.sku', cond: :like, searchable: true, orderable: true },
      locator_code: { source: 'TrackedSku.locator_code', cond: :like, searchable: true, orderable: true },
      suffix: { source: 'TrackedSku.suffix', cond: :like, searchable: true, orderable: true },
      date_created: { source: 'TrackedSku.date_created', cond: :like, searchable: true, orderable: true },
      internal_price_4: { source: 'TrackedSku.internal_price_4', cond: :like, searchable: true, orderable: true },
      internal_notes_1: { source: 'TrackedSku.internal_notes_1', cond: :like, searchable: true, orderable: true },
      internal_notes_2: { source: 'TrackedSku.internal_notes_2', cond: :like, searchable: true, orderable: true },
      internal_notes_3: { source: 'TrackedSku.internal_notes_3', cond: :like, searchable: true, orderable: true }
    }
  end

  private

  def data
    records.map do |tracked_sku|
      {
        asin: tracked_sku.asin,
        isbn: tracked_sku.isbn,
        publication_date: tracked_sku.publication_date,
        title: tracked_sku.title,
        author: tracked_sku.author,
        publisher: tracked_sku.publisher,
        binding: tracked_sku.binding,
        condition: tracked_sku.condition,
        location: tracked_sku.location,
        sku: tracked_sku.sku,
        locator_code: tracked_sku.locator_code,
        suffix: tracked_sku.suffix,
        date_created: tracked_sku.date_created,
        internal_price_4: tracked_sku.internal_price_4,
        internal_notes_1: tracked_sku.internal_notes_1,
        internal_notes_2: tracked_sku.internal_notes_2,
        internal_notes_3: tracked_sku.internal_notes_3,
        actions: link_to('Audit', new_audit_path(tracked_sku: tracked_sku)).to_s.html_safe
      }
    end
  end

  def get_raw_records(*)
    TrackedSku.all
  end
end
