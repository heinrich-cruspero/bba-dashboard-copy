class BookDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      isbn: { source: "Book.isbn", cond: :eq, searchable: true, orderable: false },
      author: { source: "Book.author", cond: :eq, searchable: true, orderable: false },
      title: { source: "Book.title", cond: :eq, searchable: true, orderable: false },
      publication_date: { source: "Book.publication_date", cond: :eq, searchable: true, orderable: false },
      tqs: { source: "IndabaDatum.tqs", cond: :eq, searchable: false, orderable: true },
      daily_sqad: { source: "IndabaDatum.daily_sqad", cond: :eq, searchable: false, orderable: true },
      weekly_sqad: { source: "IndabaDatum.weekly_sqad", cond: :eq, searchable: false, orderable: true },
      monthly_sqad: { source: "IndabaDatum.monthly_sqad", cond: :eq, searchable: false, orderable: true },
      yearly_sqad: { source: "IndabaDatum.yearly_sqad", cond: :eq, searchable: false, orderable: true },
      daily_sqaa: { source: "IndabaDatum.daily_sqaa", cond: :eq, searchable: false, orderable: true },
      weekly_sqaa: { source: "IndabaDatum.weekly_sqaa", cond: :eq, searchable: false, orderable: true },
      monthly_sqaa: { source: "IndabaDatum.monthly_sqaa", cond: :eq, searchable: false, orderable: true },
      yearly_sqaa: { source: "IndabaDatum.yearly_sqaa", cond: :eq, searchable: false, orderable: true },
      updated_at: { source: "IndabaDatum.updated_at", cond: :eq, searchable: false, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        'DT_RowId' => record.id,
        isbn: record.isbn,
        author: tooltip_field('author', record.id, record.author),
        title: tooltip_field('title', record.id, record.title),
        publication_date: record.publication_date,
        tqs: record.indaba_datum.tqs,
        daily_sqad: record.indaba_datum.daily_sqad,
        weekly_sqad: record.indaba_datum.weekly_sqad,
        monthly_sqad: record.indaba_datum.monthly_sqad,
        yearly_sqad: record.indaba_datum.yearly_sqad,
        daily_sqaa: record.indaba_datum.daily_sqaa,
        weekly_sqaa: record.indaba_datum.weekly_sqaa,
        monthly_sqaa: record.indaba_datum.monthly_sqaa,
        yearly_sqaa: record.indaba_datum.yearly_sqaa,
        updated_at: record.indaba_datum.updated_at.in_time_zone('Central Time (US & Canada)').strftime("%m-%d-%Y %H:%M"),
      }
    end
  end

  private

  def get_raw_records
    Book.includes(:guide_datum, :amazon_datum, :indaba_datum).references(:guide_datum, :amazon_datum, :indaba_datum).all
  end

  def tooltip_field(field_name, id, full_string)
    "<div id='#{field_name}_#{id}'>#{full_string[0..20]}</div>
      <div class='mdl-tooltip' data-mdl-for='#{field_name}_#{id}'>#{full_string}</div>".html_safe
  end
end
