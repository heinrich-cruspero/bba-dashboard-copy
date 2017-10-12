class BookDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      ean: { source: "Book.ean", cond: :eq, searchable: true, orderable: false },
      isbn: { source: "Book.isbn", cond: :eq, searchable: true, orderable: false },
      list_price: { source: "GuideDatum.list_price", cond: :eq, searchable: false, orderable: true },
      lowest_fba: { source: "AmazonDatum.lowest_fba", cond: :eq, searchable: false, orderable: true },
      lowest_good_price: { source: "AmazonDatum.lowest_good_price", cond: :eq, searchable: false, orderable: true },
      sales_rank: { source: "AmazonDatum.sales_rank", cond: :eq, searchable: false, orderable: true },
      bbap: { source: "IndabaDatum.bbap", cond: :eq, searchable: false, orderable: true },
      direct: { source: "IndabaDatum.direct", cond: :eq, searchable: false, orderable: true },
      tqs: { source: "IndabaDatum.tqs", cond: :eq, searchable: false, orderable: true },
      weekly_sqad: { source: "IndabaDatum.weekly_sqad", cond: :eq, searchable: false, orderable: true },
      weekly_sqmd: { source: "IndabaDatum.weekly_sqmd", cond: :eq, searchable: false, orderable: true },
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
        list_price: record.guide_datum.list_price,
        lowest_fba: record.amazon_datum.lowest_fba,
        lowest_good_price: record.amazon_datum.lowest_good_price,
        sales_rank: record.amazon_datum.sales_rank,
        bbap: record.indaba_datum.bbap,
        direct: record.indaba_datum.direct,
        tqs: record.indaba_datum.tqs,
        weekly_sqad: record.indaba_datum.weekly_sqad,
        weekly_sqmd: record.indaba_datum.weekly_sqmd,
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