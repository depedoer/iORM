inherited PersonViewModel: TPersonViewModel
  OldCreateOrder = True
  Height = 203
  Width = 189
  object PersonModelPresenter: TioModelPresenter
    AsDefault = True
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoPost = False
    AutoRefreshOnNotification = arEnabledNoReload
    TypeName = 'IPerson'
    ViewDataType = dtSingle
    WhereDetailsFromDetailAdapters = False
    Left = 72
    Top = 24
  end
  object PhonesModelPresenter: TioModelPresenter
    AsDefault = False
    Async = False
    AutoLoadData = True
    AutoPersist = True
    AutoPost = False
    AutoRefreshOnNotification = arEnabledNoReload
    MasterPresenter = PersonModelPresenter
    MasterPropertyName = 'Phones'
    TypeName = 'IPhoneNumber'
    ViewDataType = dtList
    WhereDetailsFromDetailAdapters = False
    Left = 72
    Top = 88
  end
end
