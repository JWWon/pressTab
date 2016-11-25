class LandingController < ApplicationController
  def index
  end

  def write
    @email = params[:email]
    @name = params[:name]
    @price = params[:price]
    @term = params[:term]
    @tech = params[:tech]
    @describe = params[:describe]
    @examples = params[:examples]

    mg_client = Mailgun::Client.new("key-5ffa51199cd5bbdbf41312a17c78f055")

    message_params =  {
        from: @email,
        to: "pressTab <presstab016@gmail.com>",
        subject: "Hello pressTab",
        text: "이메일 주소 : " + @email + "\n" +
              "프로젝트 이름 : " + @name + "\n" +
              "예상 작업비 : " + @price + "원" + "\n" +
              "예상 기간 : " + @term + "\n" +
              "필요 기술 : " + @tech + "\n" +
              "프로젝트 설명 :\n" + @describe + "\n" +
              "참고 링크 : " + @examples,
        #TODO: file
    }

    result = mg_client.send_message('sandboxa24d9e8127ad4051a6c177ec51a6107f.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']

    # TODO:버튼을 눌렀을 때 다시 돌아가는 형태로 구성
    redirect_to root_path;
  end
end
