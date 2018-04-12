class BookDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :number_with_delimiter
  def_delegator :@view, :tooltip_field

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
      bbap: { source: "IndabaDatum.bbap", cond: :eq, searchable: false, orderable: true },
      weekly_sqmd: { source: "IndabaDatum.weekly_sqmd", cond: :eq, searchable: false, orderable: true },
      lowest_good_price: { source: "AmazonDatum.lowest_good_price", cond: :eq, searchable: false, orderable: true },
      lowest_fba: { source: "AmazonDatum.lowest_fba", cond: :eq, searchable: false, orderable: true },
      sales_rank: { source: "AmazonDatum.sales_rank", cond: :eq, searchable: false, orderable: true },
      list_price: { source: "GuideDatum.list_price", cond: :eq, searchable: false, orderable: true },
      w_nw: { source: "IndabaDatum.w_nw", cond: :eq, searchable: false, orderable: true },
      whole_sale: { source: "IndabaDatum.whole_sale", cond: :eq, searchable: false, orderable: true },
      direct: { source: "IndabaDatum.direct", cond: :eq, searchable: false, orderable: true },
      daily_rqf: { source: "IndabaDatum.daily_rqf", cond: :eq, searchable: false, orderable: true },
      weekly_rqf: { source: "IndabaDatum.weekly_rqf", cond: :eq, searchable: false, orderable: true },
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
        tqs: number_with_delimiter(record.indaba_datum.tqs),
        daily_sqad: number_with_delimiter(record.indaba_datum.daily_sqad),
        weekly_sqad: number_with_delimiter(record.indaba_datum.weekly_sqad),
        monthly_sqad: number_with_delimiter(record.indaba_datum.monthly_sqad),
        yearly_sqad: number_with_delimiter(record.indaba_datum.yearly_sqad),
        bbap: record.indaba_datum.yearly_sqad,
        weekly_sqmd: number_with_delimiter(record.indaba_datum.weekly_sqmd),
        lowest_good_price: record.amazon_datum.lowest_good_price,
        lowest_fba: record.amazon_datum.lowest_fba,
        sales_rank: number_with_delimiter(record.amazon_datum.sales_rank),
        list_price: record.guide_datum.list_price,
        w_nw: record.indaba_datum.w_nw,
        whole_sale: record.indaba_datum.whole_sale,
        direct: record.indaba_datum.direct,
        daily_rqf: number_with_delimiter(record.indaba_datum.daily_rqf),
        weekly_rqf: number_with_delimiter(record.indaba_datum.weekly_rqf),
        daily_sqaa: number_with_delimiter(record.indaba_datum.daily_sqaa),
        weekly_sqaa: number_with_delimiter(record.indaba_datum.weekly_sqaa),
        monthly_sqaa: number_with_delimiter(record.indaba_datum.monthly_sqaa),
        yearly_sqaa: number_with_delimiter(record.indaba_datum.yearly_sqaa),
        updated_at: record.indaba_datum.updated_at.in_time_zone('Central Time (US & Canada)').strftime("%m-%d-%Y %H:%M"),
      }
    end
  end

  private

  def get_raw_records
    Book.includes(:guide_datum, :amazon_datum, :indaba_datum).references(:guide_datum, :amazon_datum, :indaba_datum).all
  end
end
