//
//  GlucosePageTests.swift
//  RileyLink
//
//  Created by Timothy Mecklem on 10/16/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import XCTest
@testable import MinimedKit

class GlucosePageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGlucosePageCRC() {
        let pumpModel = PumpModel.Model551
        do {
            let _ = try GlucosePage(pageData: Data(hexadecimalString:          "201E1D1C1A1817161718191B1D1B1C1F212527282A2E3235383C3FCD9086850E0E0000011006850E1043484857EB181006940E0F595E00000110069F0E106670757374767A7D7F8181817D7813726D6663605E5B554F4C4E4F4B484946423E3B38353234332D2B2B2B2C2E302F2F312F2D2D2E2D2C2D2D2A2B292700000110069F1310242323272B2C3235383C00000110069514103E3E3F404141444A4945413E3D3D3A35302C2823201D1B1C1D1A1A1B1C1E2123272B2F3231323235383B3F43484949474542779007A0000E41423D6C171007AD000F3C3D3D3B3C3E3F41474F545A626A6E700000011007860210717271727476797A7A7B7C7D7C7B777472706E6D6C6B6A6763605C5A6064636160605F5D5C5C5B5956545250555A585656555554565654504D4C4A484E515455555452504F4D4D504E4D4E505050504F4E4D4C4C4F50510000011007980910539290079C090E54554BC4141007A8090F4A4A49494C4C4D50515253524F53524F4D4C7590078E0B0E7590878E0B0E4A4947433BD0121007A30B0F373333312F2B26242423252526292A2A2A0000011007810D102A2A2828282B3337383A3F44474746484B4F52504B4846434343413D393500000110079F0F10312F2D2B27211E1D3F90078E100E1C1A191214100798100F181817181F20242A2E33383E41464B4B4F56595E000001100788121065686667660000011007A3121066686B6D6F727375777774707273706C6764615F5A575553453D39322C251F1A1C191614171D2124282C2E31353A3F4144484A4B4C4D50555B000001100790171061656A6665656768C99007B9170E0000011007B917106869659413100889000F625F5D5D5F5D5A56524B4E4E4C4B4847494B494A4D5051514F4E4C4E4E4D4B4A494A4B4B4B4B47474D4E4E4E4E4E4C4B4A46434B4D4C4B49490000011008B804104B4B4B4D515456565655545455595A5800000110088F0610595A5A595A595755555858575655545453525152534E4A474445484B4E4F13505251135113515051525154AF9088A6090E0000011008A6091052505594141008B3090F55565B5A58534F4B49134037132F28132320131A13181514151615171919191A1A1B1A1B1C1D202325242221225890088B0D0E00000110088C0D1023252AEC151008990D0F2B2B2E31393F3A3C41484E555D00000110089F0E1063696E73767A7C7D7F7E7F8085878689E59008B50F0E0000011008B50F10878979CD13100885100F76737272706D0000011008A71010696461605D5A57555352520000011008A11110504C4947484743434278900893120E0000011008941210423F3A3837D6131008A9120F33322F2E2F31322F2C2C2B2828292A2827243A90088E140E211C19181809141008A4140F191A19191028B6140813131313133C95")!, pumpModel: pumpModel)
        } catch GlucosePage.GlucosePageError.invalidCRC {
            XCTFail("page decoding threw invalid crc")
        } catch GlucosePage.GlucosePageError.unknownEventType(let eventType) {
            XCTFail("unknown event type" + String(eventType))
        } catch {
            XCTFail("Unexpected exception...")
        }
    }
    
    func testGlucosePageInvalidCRC() {
        let pumpModel = PumpModel.Model551
        do {
            let _ = try GlucosePage(pageData: Data(hexadecimalString:          "201E1D1C1A1817161718191B1D1B1C1F212527282A2E3235383C3FCD9086850E0E0000011006850E1043484857EB181006940E0F595E00000110069F0E106670757374767A7D7F8181817D7813726D6663605E5B554F4C4E4F4B484946423E3B38353234332D2B2B2B2C2E302F2F312F2D2D2E2D2C2D2D2A2B292700000110069F1310242323272B2C3235383C00000110069514103E3E3F404141444A4945413E3D3D3A35302C2823201D1B1C1D1A1A1B1C1E2123272B2F3231323235383B3F43484949474542779007A0000E41423D6C171007AD000F3C3D3D3B3C3E3F41474F545A626A6E700000011007860210717271727476797A7A7B7C7D7C7B777472706E6D6C6B6A6763605C5A6064636160605F5D5C5C5B5956545250555A585656555554565654504D4C4A484E515455555452504F4D4D504E4D4E505050504F4E4D4C4C4F50510000011007980910539290079C090E54554BC4141007A8090F4A4A49494C4C4D50515253524F53524F4D4C7590078E0B0E7590878E0B0E4A4947433BD0121007A30B0F373333312F2B26242423252526292A2A2A0000011007810D102A2A2828282B3337383A3F44474746484B4F52504B4846434343413D393500000110079F0F10312F2D2B27211E1D3F90078E100E1C1A191214100798100F181817181F20242A2E33383E41464B4B4F56595E000001100788121065686667660000011007A3121066686B6D6F727375777774707273706C6764615F5A575553453D39322C251F1A1C191614171D2124282C2E31353A3F4144484A4B4C4D50555B000001100790171061656A6665656768C99007B9170E0000011007B917106869659413100889000F625F5D5D5F5D5A56524B4E4E4C4B4847494B494A4D5051514F4E4C4E4E4D4B4A494A4B4B4B4B47474D4E4E4E4E4E4C4B4A46434B4D4C4B49490000011008B804104B4B4B4D515456565655545455595A5800000110088F0610595A5A595A595755555858575655545453525152534E4A474445484B4E4F13505251135113515051525154AF9088A6090E0000011008A6091052505594141008B3090F55565B5A58534F4B49134037132F28132320131A13181514151615171919191A1A1B1A1B1C1D202325242221225890088B0D0E00000110088C0D1023252AEC151008990D0F2B2B2E31393F3A3C41484E555D00000110089F0E1063696E73767A7C7D7F7E7F8085878689E59008B50F0E0000011008B50F10878979CD13100885100F76737272706D0000011008A71010696461605D5A57555352520000011008A11110504C4947484743434278900893120E0000011008941210423F3A3837D6131008A9120F33322F2E2F31322F2C2C2B2828292A2827243A90088E140E211C19181809141008A4140F191A19191028B6140813131313133C94")!, pumpModel: pumpModel)
            XCTFail("Should have thrown InvalidCRC")
        } catch GlucosePage.GlucosePageError.invalidCRC {
            // Happy path
        } catch GlucosePage.GlucosePageError.unknownEventType(let eventType) {
            XCTFail("unknown event type" + String(eventType))
        } catch {
            XCTFail("Unexpected exception...")
        }
    }
}
