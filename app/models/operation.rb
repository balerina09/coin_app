class Operation < ApplicationRecord
  enum :otype, { outlay: 0, income: 1 }, default: :outlay
  
  belongs_to :category

  validates :amount, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true

  def self.search(search)
    where("category_id = #{search}")
  end

  def self.data_for_reports(start_date, end_date, otype)
    where('odate BETWEEN ? AND ? AND otype = ?', start_date, end_date, otype)
  end
end
