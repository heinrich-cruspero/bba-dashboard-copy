# frozen_string_literal: true

##
class AuditsController < ApplicationController
  before_action :set_audit, only: %i[show edit update destroy]

  def index
    @audits = Audit.all
  end

  def show; end

  def new
    @audit = Audit.new
    return redirect_to tracked_skus_path if params[:tracked_sku].nil? || TrackedSku.find_by_id(params[:tracked_sku]).nil?

    tracked_sku = TrackedSku.find_by_id(params[:tracked_sku])

    @audit.sku = tracked_sku.sku
    @audit.internal_price_4 = tracked_sku.internal_price_4
    @audit.internal_notes_1 = tracked_sku.internal_notes_1
    @audit.internal_notes_2 = tracked_sku.internal_notes_2
    @audit.internal_notes_3 = tracked_sku.internal_notes_3
    @audit.date_created = tracked_sku.date_created
  end

  def edit; end

  def create
    @audit = Audit.new(audit_params)

    respond_to do |format|
      if @audit.save
        format.html { redirect_to @audit, notice: 'Audit was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @audit.update(audit_params)
        format.html { redirect_to @audit, notice: 'Audit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @audit.destroy
    respond_to do |format|
      format.html { redirect_to audits_url, notice: 'Audit was successfully destroyed.' }
    end
  end

  private

  def set_audit
    @audit = Audit.find(params[:id])
  end

  def audit_params
    params.require(:audit).permit(:sku, :status, :notes, :internal_price_4, :internal_notes_1, :internal_notes_2, :internal_notes_3, :date_created)
  end
end
