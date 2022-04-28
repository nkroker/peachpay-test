class Currency
  include ActiveModel::Model

  attr_accessor :amount, :currency

  class << self
    def conversion_scale
      {
        USD:  { sub_unit: 'CENT',  multiple: 10 },
        INR:  { sub_unit: 'PAISA', multiple: 10 },
        EURO: { sub_unit: 'CENT',  multiple: 10 },
        JPY:  { sub_unit: 'SEN',   multiple: 10 },
        GBP:  { sub_unit: 'PENCE', multiple: 10 },
        AUD:  { sub_unit: 'CENT',  multiple: 10 },
        CHF:  { sub_unit: 'RAPPN', multiple: 10 }
      }.with_indifferent_access
    end

    def available_currencies
      [
        ['United States Dollar', 'USD'],
        ['Indian Rupee',         'INR'],
        ['European Union EURO',  'EURO'],
        ['Japanese Yen',         'JPY'],
        ['Great British Pound',  'GBP'],
        ['Australian Dollar',    'AUD'],
        ['Swiss Franc',          'CHF']
      ]
    end

    def convert_amount(params)
      scale = conversion_scale[params[:currency]]
      result = (params[:amount].to_f * scale[:multiple])
      "#{result} #{scale[:sub_unit]}"
    end
  end
end
