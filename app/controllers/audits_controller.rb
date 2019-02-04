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
    params.require(:audit).permit(:sku, :status, :notes, :internal_price_1, :internal_price_2, :internal_price_3, :internal_price_4, :date_created)
  end
end
