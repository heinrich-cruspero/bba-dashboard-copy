# frozen_string_literal: true

##
class EasyPostAccountDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :edit_easy_post_account_path
  def_delegator :@view, :easy_post_account_path
  def_delegator :@view, :button_to

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      key: { source: 'EasyPostAccount.key', cond: :like, searchable: true, orderable: true },
      account_number: { source: 'EasyPostAccount.account_number', cond: :like, searchable: true, orderable: true },
      name: { source: 'EasyPostAccount.name', cond: :like, searchable: true, orderable: true },
      company_name: { source: 'EasyPostAccount.company_name', cond: :like, searchable: true, orderable: true },
      phone_number: { source: 'EasyPostAccount.phone_number', cond: :like, searchable: true, orderable: true },
      email: { source: 'EasyPostAccount.email', cond: :like, searchable: true, orderable: true },
      street: { source: 'EasyPostAccount.street', cond: :like, searchable: true, orderable: true },
      city: { source: 'EasyPostAccount.city', cond: :like, searchable: true, orderable: true },
      state: { source: 'EasyPostAccount.state', cond: :like, searchable: true, orderable: true },
      zip_code: { source: 'EasyPostAccount.zip_code', cond: :like, searchable: true, orderable: true },
      parcel_width: { source: 'EasyPostAccount.parcel_width', cond: :like, searchable: true, orderable: true },
      parcel_length: { source: 'EasyPostAccount.parcel_length', cond: :like, searchable: true, orderable: true },
      parcel_weight: { source: 'EasyPostAccount.parcel_weight', cond: :like, searchable: true, orderable: true },
      parcel_height: { source: 'EasyPostAccount.parcel_height', cond: :like, searchable: true, orderable: true },
      prod: { source: 'EasyPostAccount.prod', cond: :like, searchable: true, orderable: true }
    }
  end

  private

  def data
    records.map do |easy_post_account|
      {
        key: easy_post_account.key,
        account_number: easy_post_account.account_number,
        name: easy_post_account.name,
        company_name: easy_post_account.company_name,
        phone_number: easy_post_account.phone_number,
        email: easy_post_account.email,
        street: easy_post_account.street,
        city: easy_post_account.city,
        state: easy_post_account.state,
        zip_code: easy_post_account.zip_code,
        parcel_width: easy_post_account.parcel_width,
        parcel_length: easy_post_account.parcel_length,
        parcel_height: easy_post_account.parcel_height,
        parcel_weight: easy_post_account.parcel_weight,
        prod: easy_post_account.prod,
        actions: "#{link_to('Edit', edit_easy_post_account_path(easy_post_account))}
          #{link_to('Show', easy_post_account_path(easy_post_account))}
          #{link_to('Delete', easy_post_account, method: :delete, data: { confirm: 'Are you sure?' })}".html_safe
      }
    end
  end

  def get_raw_records(*)
    EasyPostAccount.all
  end
end
