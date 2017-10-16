class BookDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      isbn: { source: "Book.isbn", cond: :eq, searchable: true, orderable: false },
      author: { source: "Book.author", cond: :eq, searchable: true, orderable: false },
      title: { source: "Book.title", cond: :eq, searchable: true, orderable: false },
      past_day_sales_history_quantity: { source: "IndabaDatum.past_day_sales_history_quantity", cond: :eq, searchable: false, orderable: true },
      past_week_sales_history_quantity: { source: "IndabaDatum.past_week_sales_history_quantity", cond: :eq, searchable: false, orderable: true },
      past_month_sales_history_quantity: { source: "IndabaDatum.past_month_sales_history_quantity", cond: :eq, searchable: false, orderable: true },
      past_year_sales_history_quantity: { source: "IndabaDatum.past_year_sales_history_quantity", cond: :eq, searchable: false, orderable: true },
      tqs: { source: "IndabaDatum.tqs", cond: :eq, searchable: false, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        'DT_RowId' => record.id,
        isbn: record.isbn,
        author: record.author,
        title: record.title,
        past_day_sales_history_quantity: record.indaba_datum.past_day_sales_history_quantity,
        past_week_sales_history_quantity: record.indaba_datum.past_week_sales_history_quantity,
        past_month_sales_history_quantity: record.indaba_datum.past_month_sales_history_quantity,
        past_year_sales_history_quantity: record.indaba_datum.past_year_sales_history_quantity,
        tqs: record.indaba_datum.tqs,
      }
    end
  end

  private

  def get_raw_records
    Book.includes(:guide_datum, :amazon_datum, :indaba_datum).references(:guide_datum, :amazon_datum, :indaba_datum).all
  end
end
