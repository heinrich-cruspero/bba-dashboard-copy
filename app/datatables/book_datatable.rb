class BookDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      ean: { source: "Book.ean", cond: :eq, searchable: true, orderable: false },
      isbn: { source: "Book.isbn", cond: :eq, searchable: true, orderable: false },
      past_day_sales_history_lowest_price: { source: "IndabaDatum.past_day_sales_history_lowest_price", cond: :eq, searchable: false, orderable: true },
      past_day_sales_history_highest_price: { source: "IndabaDatum.past_day_sales_history_highest_price", cond: :eq, searchable: false, orderable: true },
      past_week_sales_history_lowest_price: { source: "IndabaDatum.past_week_sales_history_lowest_price", cond: :eq, searchable: false, orderable: true },
      past_week_sales_history_highest_price: { source: "IndabaDatum.past_week_sales_history_highest_price", cond: :eq, searchable: false, orderable: true },
      past_month_sales_history_lowest_price: { source: "IndabaDatum.past_month_sales_history_lowest_price", cond: :eq, searchable: false, orderable: true },
      past_month_sales_history_highest_price: { source: "IndabaDatum.past_month_sales_history_highest_price", cond: :eq, searchable: false, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        'DT_RowId' => record.id,
        ean: record.ean,
        isbn: record.isbn,
        past_day_sales_history_lowest_price: record.indaba_datum.past_day_sales_history_lowest_price,
        past_day_sales_history_highest_price: record.indaba_datum.past_day_sales_history_highest_price,
        past_week_sales_history_lowest_price: record.indaba_datum.past_week_sales_history_lowest_price,
        past_week_sales_history_highest_price: record.indaba_datum.past_week_sales_history_highest_price,
        past_month_sales_history_lowest_price: record.indaba_datum.past_month_sales_history_lowest_price,
        past_month_sales_history_highest_price: record.indaba_datum.past_month_sales_history_highest_price,
      }
    end
  end

  private

  def get_raw_records
    Book.includes(:guide_datum, :amazon_datum, :indaba_datum).references(:guide_datum, :amazon_datum, :indaba_datum).all
  end
end
