# frozen_string_literal: true

##
class RentalReturnDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_rental_return_path
  def_delegator :@view, :rental_return_path

  def view_columns
    @view_columns ||= {
      fedex_account: { source: 'FedexAccount.company_name', cond: :like, searchable: true, orderable: true },
      email: { source: 'RentalReturn.email', cond: :like, searchable: true, orderable: true },
      name: { source: 'RentalReturn.name', cond: :like, searchable: true, orderable: true },
      phone_number: { source: 'RentalReturn.phone_number', cond: :like, searchable: true, orderable: true },
      street: { source: 'RentalReturn.street', cond: :like, searchable: true, orderable: true },
      city: { source: 'RentalReturn.city', cond: :like, searchable: true, orderable: true },
      state: { source: 'RentalReturn.state', cond: :like, searchable: true, orderable: true },
      zip_code: { source: 'RentalReturn.zip_code', cond: :like, searchable: true, orderable: true },
      submitted: { source: 'RentalReturn.submitted', cond: :like, searchable: true, orderable: true },
      created_at: { source: 'RentalReturn.created_at', cond: :like, searchable: true, orderable: true }
    }
  end

  private

  def data
    records.map do |rental_return|
      {
        fedex_account: rental_return.fedex_account.company_name,
        email: rental_return.email,
        name: rental_return.name,
        phone_number: rental_return.phone_number,
        street: rental_return.street,
        city: rental_return.city,
        state: rental_return.state,
        zip_code: rental_return.zip_code,
        submitted: rental_return.submitted,
        created_at: rental_return.created_at.in_time_zone('Central Time (US & Canada)').strftime('%m-%d-%Y %H:%M'),
        actions: "#{link_to('Show', edit_rental_return_path(rental_return))}
                  #{link_to('Edit', rental_return_path(rental_return))}
                  #{link_to('Delete', rental_return, method: :delete, data: { confirm: 'Are you sure?' })}".html_safe
      }
    end
  end

  def get_raw_records(*)
    RentalReturn.joins(:fedex_account)
                .joins('LEFT JOIN "fedex_accounts_users" ON "fedex_accounts_users"."fedex_account_id" = "fedex_accounts"."id"')
                .where("fedex_accounts_users.user_id=#{@view.current_user.id}")
                .distinct
  end
end
