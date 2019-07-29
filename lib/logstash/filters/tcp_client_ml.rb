# encoding: utf-8
require "logstash/filters/base"
require 'socket'

# This  filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an .
class LogStash::Filters::TcpClientMl < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #    {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "tcp_client_ml"

  # Replace the message with this value.
  config :message, :validate => :string, :default => "Hello World!"
  config :tcp_address, :validate => :string, :default => '127.0.0.1'
  config :tcp_port, :validate => :string, :default => '65432'

  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    #eventAmmount = event.get("amount").to_i
    #eventAmmount = event.get("message").to_i
    #multiply = eventAmmount * @inputNumber.to_i
    #event.set("multipliedValue", multiply)

    sock = TCPSocket.new(@tcp_address, @tcp_port.to_i)

    sock.write event.get("message")
    event.set("anomalyFlag", sock.read(1))
    
    #puts sock.read(5) # Since the response message has 5 bytes.
    sock.close

    #if @message
    #  # Replace the event message with our message as configured in the
    #  # config file.
    #  event.set("message", @message)
    #end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::TcpClientMl
