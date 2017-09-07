module NFC
  class Device
    DCO_HANDLE_CRC            = 0x00
    DCO_HANDLE_PARITY         = 0x01
    DCO_ACTIVATE_FIELD        = 0x10
    DCO_INFINITE_LIST_PASSIVE = 0x20

    IM_ISO14443A_106 = Modulation.new Modulation::NMT_ISO14443A,
                                      Modulation::NBR_106
    IM_FELICA = Modulation.new Modulation::NMT_FELICA,
                               Modulation::NBR_212

    # Find a tag, blocks until there is a tag available
    def select type = :mfrc
      select_passive_target NFC::Device::IM_ISO14443A_106 if type == :mfrc
      select_passive_target NFC::Device::IM_FELICA if type == :felica
    end
    def poll type = :mfrc, poll_nr = 1, ms = 1
      poll_target NFC::Device::IM_ISO14443A_106, poll_nr,ms if type == :mfrc
      poll_target NFC::Device::IM_FELICA, poll_nr,ms if type == :felica
    end
  end
end
