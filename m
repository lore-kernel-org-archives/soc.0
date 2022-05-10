Return-Path: <SRS0=STI9=VS=toshiba.co.jp=nobuhiro1.iwamatsu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5876C433EF
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 13:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91497C385C6; Tue, 10 May 2022 13:28:32 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw1514.securemx.jp [210.130.202.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76771C385A6;
	Tue, 10 May 2022 13:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76771C385A6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 24ADSRa4018563; Tue, 10 May 2022 22:28:27 +0900
X-Iguazu-Qid: 34tKMNGQITdIz4Ecsa
X-Iguazu-QSIG: v=2; s=0; t=1652189307; q=34tKMNGQITdIz4Ecsa; m=0YKs3XruZI0gjDegYHrbrI7ZB/JiSABq6Ab/zGp3NIA=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
	by relay.securemx.jp (mx-mr1511) id 24ADSQa9040003
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 May 2022 22:28:26 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0xq/KOi03434MJyxXpukw/JmtGmI5t7pmE/Slqwo8s5LsbQeAhfNCs7bPLhx3H0eAmSzLqJ1G0pt0iuLoXkHsOqF9ThLKAp6UlMYbRcGRd+gRlVR2Q0JBg7EDkC7SYMnRYT3hcOjeFzdER84UlolYOn0SvX+TY3P2c6sOIg2DvdCeJongyJsG1haZCZEq6RdtrDNnrXtlSEZbwZxBLWvskD16xHSTqwbyMWqmWe9QvgeTK8pc7MFkjNgG+iSwZOZVxioo8plNY+7zVCvfwaAqFbZdgCrqadKTC55YMq54QbKl4wKyjm35KSOAGuvIPrSKWBDxvdbaVPssuftGveVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5zNTtO4mHPM8wQ7/UwTYXpW60+WAn7ViRTv4COkgXE=;
 b=gZhUYUYysZysaepeUCuwUnRYckMO8QeGTdcF3rHYLefjeNyqaRnIFnKIbWQMe1c8lgow2+ZoRyyLlVXjZra+ASMqCQSDJBJ2XaZ7jgU4Mhexf/3jMja4Ulg6doI2zuCiWPgludBbQit7fxVUbTTmstlyWIDV0d6FNzaU+b54WxB7nnq1eZhQ6H4FzK3FH4QkgWxtxb3xWHfC9tVMh88BIHjqzsMB8f/ZnaqBqARv1ddSGWXJUqWSyg0IfpBPGfcGoW/ck+8yzNF7KqSaok6sYX+PWCU2GTfgeCavt543IZoTUuN/ZmVLsShw5rkmBeea4l5/BVyZJBRDaFSuswjk/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: <arm@kernel.org>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] Visconti DT changes for 5.19
Thread-Topic: [GIT PULL] Visconti DT changes for 5.19
Thread-Index: AdhkcXWYOXg3+YwORXG17SZmLlZVKw==
Date: Tue, 10 May 2022 13:28:24 +0000
X-TSB-HOP2: ON
Message-ID: <TYWPR01MB94201E842A2F8E5E9EBF740D92C99@TYWPR01MB9420.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8b49793-e44c-4c50-1fa3-08da3288f583
x-ms-traffictypediagnostic: TY2PR01MB3082:EE_
x-microsoft-antispam-prvs: <TY2PR01MB3082B12574B35AD04D792FD492C99@TY2PR01MB3082.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cQnwALwFN84tLq17ztIZLDw+Vn+rmzAXhbhwx1FuTkWoarM062uUOvyziUvli7eFQ0M+3JYecnWcrXZuucxKTb7DXG5381BMybu3NTJru+aa2EWDIU14nEHWHJmXm2hser35+9YJC82OHqdBUWZ6AiqJL/e7IAfkIngHKCh7iEnbFknAMp7RQsRFmP8MqrDWnGBXXk5EOlrwjNag0Htm/IRHaMgKgbJQmdeLOPf3azdZw3ZiKzBGsK6foL7VQuXJ4xGImK9MHE70mlW1CeLzAXivDX5aEn2iHicsJnEt/RmuaHeVz+6fuTM0vkFHvg3j7muc8Brb0W60ZNhLoqATRQqUSvrQfqCVSmUYaVTi/Pzv+lLRnKT4PK00y7JfBl/GTre7srf9QAyFiQkcmxBClAHVE4FVYmXDqqbrgTQQCRDHK/K86Ynzp16PIf+fcJ/5iBc4LyBhytctYilMGJi3iffShs4/+OFQcjUBIBrcD+fJvb2qWshXyjeK0iz7lfnPHRzq7bMYxQ7B9V/cD3x8LYUeWR50K8ufY06gpSeSBEYu4oAa/LZYCLBdfSOpGmNiw7nucbHgI/oArK4HqY0Pe2ciXEIVVNsBYgFTM9ckuLq9O+nTNJqbKZ9ZtQnhtX/kiiEoG89vGIePbTdt81/LsuHnr54SJAFMyx4KNY7B99b1ZTMoEmupttxX3SVPXHATkRPk1tPImPT7SwciA4mwGZmPupFuoQ+rvkjlHfWoyKydqeQTMXm/oeaibx09A3Z+24v+JEvo/YBqb3eKscxK+Qz77IWNVjBw/rkGth/ytEM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB9420.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38070700005)(64756008)(8676002)(66946007)(38100700002)(76116006)(4326008)(33656002)(66446008)(66476007)(71200400001)(186003)(83380400001)(66556008)(26005)(122000001)(110136005)(9686003)(52536014)(8936002)(86362001)(5660300002)(508600001)(6506007)(7696005)(55016003)(966005)(55236004)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?SGtxVHpaT3dHVHZYL1k3aVhkQVhrcjEwY2hqQVFQbFV4UURPWHZ0MU1I?=
 =?iso-2022-jp?B?MEVrMWlWNTI0NTljcDZjWFZhRGlEMWF3eFlmdmJPZ1V2NmQwblVVTEFt?=
 =?iso-2022-jp?B?ZWRSMm1qUWlBZnJPTWxxNU9vQWRRNHQ0SCs2Z0lyT3JQZTdUbmxHbUNz?=
 =?iso-2022-jp?B?Uk8vcElYOS9RTVA4Z0tBREF6K2llamVKaDczQVpBdG8yendBZ2VzYlU4?=
 =?iso-2022-jp?B?TG1tZmwvTkpaMnRGeUhENjZJMFlieTBGcTRXa2kySkFGOFRFb0hPQWU3?=
 =?iso-2022-jp?B?U2dJYnJGZi96MFIxbHptcTZLV2FEb0Q0bk5WQ2doSyttcjI3anNoNjQ1?=
 =?iso-2022-jp?B?aFlEM1dJR3JWbUtYcERKQUZ0M1JMYTF6bVlpbENnN3dUdFptS3FxRWJD?=
 =?iso-2022-jp?B?d2wvVWVGMzRsWStqNEswTXFKNExnMjIyemMxdjZzMVFuYkZLa2UzL0pG?=
 =?iso-2022-jp?B?V0lWbFNTZFZKZUNQTEZiRk53aDl6L2VBcWowUllMYkxNM3N2WVZ4RE42?=
 =?iso-2022-jp?B?MWsrT2lRWHVoenpqbVdlR1ZwY1ZCcStlQzlQWmRnRkpobjQ0L0pra1B1?=
 =?iso-2022-jp?B?Tk93QWRGcmQzMXdhZnBmWnY4bWxYTWV4ckp5dkRKem0zU0dUZ2cvcEky?=
 =?iso-2022-jp?B?V2hqb2MvQzVzR2E3QUlid2VkSTZjYzgzUWpOM1dCWWhkek9BZFRJc0tX?=
 =?iso-2022-jp?B?b3RtU1huY01BbUMyM2hjMjFtd0ZXWk1ZQXVVTzRMMWRtTFZ0eGpIRUNo?=
 =?iso-2022-jp?B?cXJYNDRhZDV4ZUEySkVxYnNrNTI1RVYvckxQd21xcEp2ckV5UG1nMTdO?=
 =?iso-2022-jp?B?Y1ZrdnJCbkVLSlQ4MHZURTZyRklNejFLZkFGaUJqVnh5TlgrSjJuOU9N?=
 =?iso-2022-jp?B?Uk9WRWF2ZkJXaitNeHg5WUpJQ0sxSlBYdHpSb2hRSU4xZUphc0VJdUdE?=
 =?iso-2022-jp?B?V21GUGtsODd0emp1cW9RWUdkZFRYbXp0RGtEVlN3MGpHMGY0dktRNitt?=
 =?iso-2022-jp?B?dHdzUVM4c2F5aTBjblBCVys2NTFKcitPVHBvSW1yWUlXeEw4TG1EQUla?=
 =?iso-2022-jp?B?Wm0zQ3dpSGYwNUx3ZlFQNkE3RGs0ZmZlQUYyMVdMcFVxRzd1d09Pakw2?=
 =?iso-2022-jp?B?S0M2Q2YxZXNOUmlwRkE5MHNtS2plSDJPNktobjVEMGZBZWtGVUd5UWRz?=
 =?iso-2022-jp?B?L1RSRlFRc2F0emg1eEw0cThsRSt5dzlnSXc1SFdtUlF5ZnNVNnpEZE5C?=
 =?iso-2022-jp?B?cnNjNm9HKzRrU1h3TSszNkhJc1ZKRENVMThtMTRDRkhtamNMYXZkV3pD?=
 =?iso-2022-jp?B?bm50ZzE5YzdRUUM4RFhwbTBYT0hROElTRmVSbVcxZTVmNGFJMUZNN29N?=
 =?iso-2022-jp?B?QS9RSlFQcjJ0MmxwZjEyQVFCNVB1dGpIZDdtMTVWNFByZ042YWVIV2Vk?=
 =?iso-2022-jp?B?MmlJUktDdWFzZUNrRnIvV0pTTm5nRDhZUys3OWVQKzlwMFlvQVFqVE1X?=
 =?iso-2022-jp?B?VHV3WVNLcEZhYVFPSFVQSTZ0c1ZiU3VjNld5bGI0Rm9vd09XajM0bGhi?=
 =?iso-2022-jp?B?bEdxNTNtMFdTQUs2UW1UQ1kwUDZsMWd2QThkVmNmLzBCMVZ2d25YaS90?=
 =?iso-2022-jp?B?S2ZqUjg2aUhjNGpqakZKN09zTHFIMzJ4L05BenVRSlc3ZS8rNkt5NGFE?=
 =?iso-2022-jp?B?dUhuVUdXdHB2c0dhUXZwRDhtSEkyeHRsUDVmWm8rcjdZWlVvTjIxM0FO?=
 =?iso-2022-jp?B?MXBmaDljS0JoTnVqaFdqT0lJRzlwbGZUaHBUM09mblhkMmdRM1YzU3BE?=
 =?iso-2022-jp?B?TUNVMXNxL3A1NU5FNXpEOHhGdVBuN0NGa0RXeDJ6L29DS1Z1MnpNQWxF?=
 =?iso-2022-jp?B?UEl6Z2dlakp0VGFOQWFVYzBNZ0ptWDRxYVM3M1FZY29NL0R1MDZwcVI4?=
 =?iso-2022-jp?B?MUFNSTV6S0I2OGpMU1JXcnRXWFVuanZrUUJTR3psOG00M1cvMEFPajRU?=
 =?iso-2022-jp?B?YVFiYlYrRXhOQ01ic1ZCNGdEQVY4Y1lLS3ZxMG9yRVVWNVMya2NzUWhR?=
 =?iso-2022-jp?B?TU1Gak1TaWMrWmVkL0ZYTzZwbWJsK3F3NTQ3Q09PUWdEaVJJTE5RcUk4?=
 =?iso-2022-jp?B?TXJUNW82RVpsOTZGWTNJT1orZEd4cHdtK0ZqNld0bDVNd0pQQjc1QWF3?=
 =?iso-2022-jp?B?cE9Tc0VGNTFlaFFHR2haR0g5ZklqZURSWEp6WnBVajJ3RXdwSWNUU0Jh?=
 =?iso-2022-jp?B?a3ZUL3F5YkprdHd6czk4a1psMTJQNUUxbE8rTXB2UTNLR0dIUVdyYTVW?=
 =?iso-2022-jp?B?QVNtZ3FwZDlyTEs0MW5UcWZ2cEpTN1YxaS9oRHA0UTI2bDFhNVFTOVZC?=
 =?iso-2022-jp?B?SThDdTJrL1NiT0VhaHpKWklqQ1cvVEx3WkpPemphK3lmOXBIcU9sb0hI?=
 =?iso-2022-jp?B?dkl1SXRIdERKWXF5cHh4TG5acTZXQWZ4anlTdTdHUmVld0NTald0SDZQ?=
 =?iso-2022-jp?B?SXVDSkt2NVFXV0hVWEVFUG5GV2J4Y3diclgwNGtpdTZUcEVhNGdkWFJo?=
 =?iso-2022-jp?B?bmpnZTRybz0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9420.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b49793-e44c-4c50-1fa3-08da3288f583
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 13:28:24.2142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EIwTDxlZ6fBrScLVXDuNfSP4nnkFBTRG8F+Z+vwgUjw03Rng1C4CktbDR/qBLxalJQyFTfvGgCdbUH9rUnlTJvrcvCdrclPOd4yqjlXZZXa56RIYFECscGXprMJMhaqL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3082
X-OriginatorOrg: toshiba.co.jp

Hi ARM SoC maintainers,

Please pull following DT changes for 5.19.

Best regards,
 Nobuhiro

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17=
:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.g=
it/ tags/visconti-arm-dt-for-v5.19

for you to fetch changes up to 5d3b6ede2c6c80304944cdb5bc653957390afcf4:

  arm64: dts: visconti: Update the clock providers for PCIe host controller=
 (2022-05-10 11:18:55 +0900)

----------------------------------------------------------------
Visconti device tree updates for 5.19

- Update the clock providers for PCIe host controller
- Update the clock providers for ethernet device
- Update the clock providers for SPI
- Update the clock providers for watchdog timer
- Update the clock providers for I2C
- Update the clock providers for UART
- Add clock controller support for TMPV7708

----------------------------------------------------------------
Nobuhiro Iwamatsu (7):
      arm64: dts: visconti: Add clock controller support for TMPV7708
      arm64: dts: visconti: Update the clock providers for UART
      arm64: dts: visconti: Update the clock providers for I2C
      arm64: dts: visconti: Update the clock providers for watchdog timer
      arm64: dts: visconti: Update the clock providers for SPI
      arm64: dts: visconti: Update the clock providers for ethernet device
      arm64: dts: visconti: Update the clock providers for PCIe host contro=
ller

 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts   |  9 --
 .../boot/dts/toshiba/tmpv7708-visrobo-vrb.dts      |  6 --
 .../boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi     |  4 -
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi          | 96 ++++++++++++------=
----
 4 files changed, 53 insertions(+), 62 deletions(-)

