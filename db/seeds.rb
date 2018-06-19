# frozen_string_literal: true

WantListPrivacy.create([{ name: 'Public' }, { name: 'Private' }, { name: 'Shared' }])

IndabaInstance.create(
  [
    { database_name: 'MainDB', account_name: 'FCB_Main' },
    { database_name: 'IndabaMerchant_FCBBobby_MainDB', account_name: 'FCB_Bobby' },
    { database_name: 'IndabaMerchant_FCBJim_MainDB', account_name: 'FCB_Jim' },
    { database_name: 'IndabaMerchant_FCBLane_MainDB', account_name: 'FCB_Lane' },
    { database_name: 'IndabaMerchant_FCBRENEE_MainDB', account_name: 'FCB_Renee' },
    { database_name: 'IndabaMerchant_FCBSteve_MainDB', account_name: 'FCB_Steve' },
    { database_name: 'IndabaMerchant_FCBRich_MainDB', account_name: 'FCB_Rich' },
    { database_name: 'textbookcorner_MainDB', account_name: 'TBC' },
    { database_name: 'FCB_FBAAZ_MainDB', account_name: 'FBAAZ' }
  ]
)
