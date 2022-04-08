# frozen_string_literal: true

##
class AccountDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :@view, :link_to
  def_delegator :@view, :edit_account_path
  def_delegator :@view, :account_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      name: { source: 'Account.name', cond: :like, searchable: true, orderable: true },
      account_number: { source: 'Account.account_number', cond: :like, searchable: true, orderable: true },
      source_type: { source: 'SourceType.name', cond: :like, searchable: true, orderable: true },
      source: { source: 'Source.name', cond: :like, searchable: true, orderable: true },
      address_ln1: { source: 'Account.address_ln1', cond: :like, searchable: true, orderable: true },
      address_ln2: { source: 'Account.address_ln2', cond: :like, searchable: true, orderable: true },
      city: { source: 'Account.city', cond: :like, searchable: true, orderable: true },
      state: { source: 'Account.state', cond: :like, searchable: true, orderable: true },
      zip: { source: 'Account.zip', cond: :like, searchable: true, orderable: true },
      phone_number: { source: 'Account.phone_number', cond: :like, searchable: true, orderable: true },
      extension: { source: 'Account.extension', cond: :like, searchable: true, orderable: true }
    }
  end

  private

  def data
    records.map do |account|
      {
        name: account.name,
        account_number: account.account_number,
        source_type: account.source.source_type.name,
        source: account.source.name,
        address_ln1: account.address_ln1,
        address_ln2: account.address_ln2,
        city: account.city,
        state: account.state,
        zip: account.zip,
        phone_number: account.phone_number,
        extension: account.extension,
        actions: "#{link_to('Show', account_path(account))} |
                  #{link_to('Edit', edit_account_path(account))} |
                  #{link_to('Delete', account_path(account), method: :delete, data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' })}".html_safe
      }
    end
  end

  def get_raw_records(*)
    Account.joins(:source, :source_type).all
  end
end
