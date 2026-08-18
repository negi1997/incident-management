using { API_BUSINESS_PARTNER as S4 } from './external/API_BUSINESS_PARTNER';

service RemoteService {
    entity BusinessPartner        as
        projection on S4.A_BusinessPartner {
            key BusinessPartner           as ID,
                FirstName                 as firstName,
                LastName                  as lastName,
                BusinessPartnerName       as name,
                to_BusinessPartnerAddress as addresses
        }

    entity BusinessPartnerAddress as
        projection on S4.A_BusinessPartnerAddress {
            BusinessPartner as ID,
            AddressID       as addressID,
            to_EmailAddress as emailList,
            to_PhoneNumber  as phoneNumber
        }

    entity EmailAddress   as
        projection on S4.A_AddressEmailAddress {
            key AddressID    as addressID,
            EmailAddress as email
        }

    entity PhoneNumber   as
        projection on S4.A_AddressPhoneNumber {
            key AddressID   as addressID,
            PhoneNumber as phone
        }


}
