class Admin::ContractPdf < Prawn::Document
  def initialize(contract, template, requisite)
    super()
    @contract = contract
    @student = contract.student
    @template = template
    @period = "с #{@student.group.start.to_s} по #{@student.group.end.to_s}"
    @requisite = requisite
    text_content
  end

  def text_content
    y_position = cursor - 0
    bounding_box([30, y_position], :width => 500) do
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        text_box "ДОГОВОР № #{@contract.number}", :at => [0, 0], :align => :center
        move_down 12
        text_box "#{@template.title}", :at => [0, 0], :align => :center
      end
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        move_down 24
        text "г. Алматы                                                                                                                    #{@contract.date.day} #{get_month(@contract.date.month)} #{@contract.date.year} г.", :align => :justify
      end
      font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
        move_down 12
        text "#{@requisite.owner}, именуемое в дальнейшем «Образовательный центр», в лице #{@requisite.function_2} #{@requisite.fio_2}, действующего на основании #{@requisite.based} с одной стороны, и", indent_paragraphs: 30, :align => :justify
        if @student.male?
          text "#{@student.last_name} #{@student.first_name} #{@student.middle_name}, ИИН #{@student.iin}, именуемый в дальнейшем «Студент», заключили настоящий договор на оказание услуг по обучению (далее – «Договор») о нижеследующем:", indent_paragraphs: 30, :align => :justify
        else
          text "#{@student.last_name} #{@student.first_name} #{@student.middle_name}, ИИН #{@student.iin}, именуемая в дальнейшем «Студент», заключили настоящий договор на оказание услуг по обучению (далее – «Договор») о нижеследующем:", indent_paragraphs: 30, :align => :justify
        end
      end

      @template.sections.order("number").each do |s|
        font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
          move_down 10
          text "#{s.number}. #{s.title}", :align => :center
          move_down 5
        end
        s.clauses.order("number").each do |c|
          font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
            if c.body.include?('<Course>')
              text "#{c.number}. #{c.body.gsub! '<Course>', @student.group.course.name}", indent_paragraphs: 30, :align => :justify
            elsif c.body.include?('<period>')
              text "#{c.number}. #{c.body.gsub! '<period>', @period}", indent_paragraphs: 30, :align => :justify
           else
              text "#{c.number}. #{c.body}", indent_paragraphs: 30, :align => :justify
            end
         end
        end
      end
      font ("#{Rails.root}/app/assets/fonts/7454bold.ttf") do
        x_position = cursor
        text_box "«Образовательный центр»", :at => [50, x_position], :width => 250
        text_box "«Студент»", :at => [320, x_position], :width => 250
      end
      font ("#{Rails.root}/app/assets/fonts/7454.ttf") do
        x_position = cursor - 20
        text_box "#{@requisite.owner}" +"\n"+
        "Адрес: #{@requisite.address}" +"\n"+
        "БИН #{@requisite.bin}" +"\n"+
        "Банк: #{@requisite.bank}" +"\n"+
        "ИИК #{@requisite.iik}" +"\n"+
        "БИК #{@requisite.bik}" +"\n"+
        "Тел: #{@requisite.tel_1}" +"\n"+
        "#{@requisite.tel_2}" +"\n"+
        "#{@requisite.tel_3}"+"\n"+
        "" +"\n"+
        "#{@requisite.function}" +"\n"+
        "" +"\n"+
        "______________________ #{@requisite.fio}", :at => [0, x_position], :width => 240
        text_box "#{@student.last_name} #{@student.first_name} #{@student.middle_name}" +"\n"+
        "" + "\n" +
        "Удостоверение личности: № #{@student.id_card}" + "\n" +
        "Выдано #{@student.date_of_issue}, #{@student.issued_by}" + "\n" +
        "ИИН #{@student.iin}" + "\n" +
        "Тел: #{@student.tel_1}" + "\n" +
        "Email: #{@student.email}" + "\n" +
        "Telegram: #{@student.telegram}" + "\n" +
        "" + "\n" +
        "" + "\n" +
        "" + "\n" +
        "_____________________ #{@student.last_name}", :at => [260, x_position], :width => 250
      end
    end
  end
  def get_month(month)
    if month == 1
      'января'
    elsif month == 2
      'февраля'
    elsif month == 3
      'марта'
    elsif month == 4
      'апреля'
    elsif month == 5
      'мая'
    elsif month == 6
      'июня'
    elsif month == 7
      'июля'
    elsif month == 8
      'августа'
    elsif month == 9
      'сентября'
    elsif month == 10
      'октября'
    elsif month == 11
      'ноября'
    elsif month == 12
      'декабря'
    end
  end
end
