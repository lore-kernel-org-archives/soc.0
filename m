Return-Path: <SRS0=SDro=GL=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D227C433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 10:37:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F30A323788; Fri,  8 Jan 2021 10:37:49 +0000 (UTC)
X-Greylist: delayed 65 seconds by postgrey-1.34 at mail.kernel.org; Fri, 08 Jan 2021 10:37:49 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 188EF23787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188EF23787;
	Fri,  8 Jan 2021 10:37:48 +0000 (UTC)
IronPort-SDR: jINCmUpcZ5hw6Q2dODgSBX6iKVMcm4Ep2QQqkeUdJRn5nMujTbQPsYWfEGL29FpYOhK64KDpLy
 BT9F9PL1SOXEu1Uw7eYUuA91MEL5UiAtCcRTh+g/a/kjMxLyH5e7O669Pu0IKNguj6h7mOfBUk
 ScMpmMNYj7CIlTKns9Ur3Rb8bpROpfkaIYEzYrE5SK0PUne3K22HMBDCwYsTj1YdBO1OflWmL9
 /Qicuk7G7xWEhEsDBbudNdmJUtzzFYhLkQNiS/Nu4yQkDM8APcH1au5CdLMh4/PN8ursUIwARf
 fyA=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="23842819"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; 
   d="scan'208";a="23842819"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 19:36:42 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBbKSeu8qhE0evPrIipSZ2oJmFICsRi+FCydBnMPxGKIkTErTShKhb/vh5Z3ru+qpfnR9VHHSnYgY5/N/gBX8/L7qvzVF757UV1oeuN6KnCqLin0BgVJFkL3jKTkONyKUgqNh6u5BZ5UyF7EigLn3TiaLihqEQ2EZA9GFOLKQ6dVCUUDBHOeRbIsX+4r0nsRcAi2c4hUZO/Bq/NZ9B5KYClir3RfyuAEU+XXV6Y+4+RrWM3RL0nzIksxGAJrBaYY2mq3l/DHzXC+84hl5tYXnnLPWucJcJqoyaWJTAR1H7rMceTfvGx7Xce4qzchJaLG2dIy4j8dy85hYE9w858eLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vglWXwrrFC6ki1bk+6Xwpc0gA2BtUQafnmcWxo9wLrY=;
 b=DvSAavxlC+4AedksnALNYRIU0Z0wwBX62j4u+K+6okS4+Fjpdea2qOsDnV4CiDp/jxxB3Gigk8MIIEr3NLO04kPnOnHIsOMhTy3UuTY7wvlVMUyqpmKFYtCitwrI27TEN836MiVzWI1g3e2zkfeLc32TxI+APIN/t3C6XlYTCUWnCpJTKO/FsGMkSDwuZPbOaEGKtdWJmuriONjhyjw0GQLom6MWwYlxEnfw7QzV6apvkQyqO7oEn5EP5xQpB4SCel4pAOrfLXZuzj7fBX/C8Ni8YvXSj98w1RWdSflfRfvdu3T+Uzyhfy4v36tyLyFOFeNuL/M3yF2YFy5yWJ84XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vglWXwrrFC6ki1bk+6Xwpc0gA2BtUQafnmcWxo9wLrY=;
 b=llVJv1QTN/jeUi4YSHOW7cpD3LhHdfdLjuR3avDY5Q5JZdFUc3SJnCMZOS+quGMg0Q8MIlCJ1iw+mGLgK/xFycdWC3rFE1OEamh0AbfwYuaIjqjgBLwE8s+UadlemmXGicqAAipWuIdarfabJktem0o1jhKazWBhfrN0egFS1fc=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSYPR01MB5384.jpnprd01.prod.outlook.com (2603:1096:604:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 10:36:38 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3721.024; Fri, 8 Jan 2021
 10:36:38 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>, "'soc@kernel.org'" <soc@kernel.org>
CC: "'will@kernel.org'" <will@kernel.org>, "'catalin.marinas@arm.com'"
	<catalin.marinas@arm.com>, "'arnd@arndb.de'" <arnd@arndb.de>,
	"'olof@lixom.net'" <olof@lixom.net>
Subject: RE:
Thread-Index: AdblqbN22ARpZCh3T72pItS74KwU3g==
Date: Fri, 8 Jan 2021 10:35:08 +0000
Deferred-Delivery: Fri, 8 Jan 2021 10:34:51 +0000
Message-ID:
 <OSBPR01MB4582E37CD189F2518355B128E5AE0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: aeeabf70bfa14676bfaa7a8c13406a22
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b385f259-092a-417b-a81b-08d8b3c14779
x-ms-traffictypediagnostic: OSYPR01MB5384:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <OSYPR01MB53846FE2628642138D0B2370E5AE0@OSYPR01MB5384.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KJ+ybvwVRyrKeWgLe3z3siC59CV+yCbVzD27XdRlVYP9M/mexFjN7C4N/rpi2g9qW5Z0K779o37MUNvqWfcjuRAjoGLDuuXjTFe2rkYUFP+yO+ammyUanSZxKtlTXo5+iiLsJ+AMNtwVttgwDeT9YmDfFhbaoMTdGvPfgELDvpeuj1oVistOlfOV3u2pdL/ojkBkFI8A54Xb1/db3ys93twbkj6Sb2fRKyRsnWBs8uo5NlL3ZkngpRBBNazOfjJ6L+oq0yIomJu1/UJYRM/92JZm0+71FcGN6nUYfbEr/dZDZNQ52FbOkvZnLkPgFfCYnxHOhKkZ8L8RQ2PLpNS3wcberS8jcR9mDySBNnA4h3J477ZUY+meN91QebiVMEuhUDC1v284COWNvXUy1XPI83rWNsc24Yrf4hQd6Umc9yQj0qj3pjg2ZK/9f+ToYfv+SjJYlJjiM1qFl7C/MkJSpnSEony28O1oGjCb8I3nLgz6stz+7PE896NRbGi/T2YolHZRAzFzEdhq6VXzkFSzQmLFuIde+JF5Q2hKAp9S+GX80izJKxz9ZSCb/erMwrR1jDjhaTh5oEGhVoPzskQQEs3z4a7QXchMZ/Wmp8qPyYw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(83380400001)(71200400001)(478600001)(9686003)(3480700007)(55016002)(85182001)(966005)(7696005)(7116003)(6506007)(52536014)(53546011)(8676002)(316002)(110136005)(33656002)(4326008)(26005)(86362001)(6666004)(54906003)(186003)(66946007)(66556008)(64756008)(8936002)(66476007)(76116006)(2906002)(5660300002)(66446008)(4410300001)(777600001)(231573002)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?iso-2022-jp?B?aDlKWWE4eFB5Z2k5LzdOL0R0NlhRT3hIdCs0RDFtTERNTGkvNWhjeGxq?=
 =?iso-2022-jp?B?UDV5OXNRYzZmdHJsc0s3c1VYMWF3WnhESUEzK3E2bkhqYkJES3RLTG1z?=
 =?iso-2022-jp?B?TURaSXVmYVNlc0UzYlVMdmVHWWNPSE01VFI4Zmk0OW1wZTZlWW11MEtN?=
 =?iso-2022-jp?B?dEk2aVpLOFNGMEg4UUo5TUg2eDBXUTlNWk5oOGczOFhwdGtZTXRheVRU?=
 =?iso-2022-jp?B?ZTI2NUlESCtWczJJVmZldkhieEZnUkpubDM0VUlKQld3VHFudHAwS3pS?=
 =?iso-2022-jp?B?c3E0VU9YSGpNUkh3c0dwQ3lsd2hWRXdVNHBMN1k2Wlg2c3RyaW85T3k3?=
 =?iso-2022-jp?B?V1JveWFEOEhCc2VFNkV1NUNtRnk1Y3FBbXdLU0hJdjVqdWRLQytKMFhr?=
 =?iso-2022-jp?B?b004R3puc1gyL3VoTjY0amJYWWZ5NnFFYUFxMmdBQUI5bkJuVkI5bG5Y?=
 =?iso-2022-jp?B?VHAvenFod0JYSW1vcWVuMEVXb2NPcDh6WjJRcHV2WFNFWG5JSW53aWJT?=
 =?iso-2022-jp?B?RmI0TlhObWVmb3l4cVpSb0YzL1VQbUNmUkdKMFJHZFc4QVRaTmhoQ2Zz?=
 =?iso-2022-jp?B?NUhrN05OK3k0N2x5SUxKNU13TnZJWDh0ZE40QVVmUzlUNzZVMlhTNnRi?=
 =?iso-2022-jp?B?a29rek5vQllveldJeVprNDlPWmVUM0xNaHJmNi9rYkd4cFk1OTlqSmE3?=
 =?iso-2022-jp?B?ZnpJVElXUnZvL3BZbUhlOUNlYnUycFBzM2UyejdCVkVlNVR2NERjblF0?=
 =?iso-2022-jp?B?cWRCd1poc0k3TmQ5MkhtNnVUbkFvL1V0Z1lOSDdJUVovMEVBeEIrSkl2?=
 =?iso-2022-jp?B?aDdTSk9CYXFhSm5lVTYzL203bXBMa1dlQ2pHeVVCNzVocUEzMmhhbFNG?=
 =?iso-2022-jp?B?QTZqUTRsVHFMNFhKRUl4eVFYSlBYTGZUbTFCNnplOGM3OFlQSVBjV2dT?=
 =?iso-2022-jp?B?SGF5T05sZDRjbnZaK2g0dy8zT1hPVnFJd2ZXMk1KSU0xWm51ZTFwMUxV?=
 =?iso-2022-jp?B?cWt6Mlcwam12TDlEZEdkbUN4K1l2VjdzNk9CeUhhdmExeXRmZ3R5bFhF?=
 =?iso-2022-jp?B?VFFBTGFxM3FheUQyNmdMR1JvblcvQldjcEFRN1FDUGlZYXp3WUFRaUph?=
 =?iso-2022-jp?B?KzlTUWdLZHFJS25WZGlnOG9tNXN4NEQvMFJOMXJ1QUJkRGsyRFVsR1cz?=
 =?iso-2022-jp?B?aExQM0xiT2hzK3VFcHhsQ3lWcEVob2NSaTJkQll0QXBsVytnYVJ0QVR4?=
 =?iso-2022-jp?B?R1VUV1ViMkt5N1lvWFdaTVBzSU42NDB5VEI0bGVDb0VDTVNMYXdaTGpY?=
 =?iso-2022-jp?B?TGExNzVLWUJ0bjREaVZNbEdVcFJkVnlEckl0dHlrOXQ2YzAveUVJQy9R?=
 =?iso-2022-jp?B?UGpXaHJ5U3lOUHgzVGpkYjErRnhnZi91cXRyc1FyTG5PWlI1Yz0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b385f259-092a-417b-a81b-08d8b3c14779
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 10:36:38.0751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcNcrs96KRLlGK/Mm3Ya+mSkn/uJkSguNWs3HqB8C+3hy33uGqzjZEN5WqNBpGvYOSQ8sqqKqcW6YIirx86yTmsYbiyNf5yQwqQkQvRpdXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5384

Sorry, I failed to add proper subject to cover letter and it does not show =
lore archive.
I will resend the whole serieses. Plese discard this.

Tomohiro

> -----Original Message-----
> From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> Sent: Friday, January 8, 2021 7:32 PM
> To: linux-arm-kernel@lists.infradead.org; soc@kernel.org
> Cc: will@kernel.org; catalin.marinas@arm.com; arnd@arndb.de; olof@lixom.n=
et; Misono, Tomohiro/=1B$BL#A>Ln=1B(B =1B$BCRNi=1B(B
> <misono.tomohiro@fujitsu.com>
> Subject:
>=20
> Subject: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier d=
river
>=20
> Hello,
>=20
> This series adds Fujitsu A64FX SoC entry in drivers/soc and hardware barr=
ier driver for it.
>=20
> [Driver Description]
>  A64FX CPU has several functions for HPC workload and hardware barrier  i=
s one of them. It is a mechanism to realize
> fast synchronization by  PEs belonging to the same L3 cache domain by usi=
ng implementation  defined hardware
> registers.
>  For more details, see A64FX HPC extension specification in  https://gith=
ub.com/fujitsu/A64FX
>=20
>  The driver mainly offers a set of ioctls to manipulate related registers=
.
>  Patch 1-9 implements driver code and patch 10 finally adds kconfig,  Mak=
efile and MAINTAINER entry for the driver.
>=20
>  Also, C library and test program for this driver is available on:
>  https://github.com/fujitsu/hardware_barrier
>=20
>  The driver is based on v5.11-rc2 and tested on FX700 environment.
>=20
> [RFC]
>  This is the first time we upstream drivers for our chip and I want to  c=
onfirm driver location and patch submission
> process.
>=20
>  Based on my observation it seems drivers/soc folder is right place to pu=
t  this driver, so I added Kconfig entry for arm64
> platform config, created  soc/fujitsu folder and updated MAINTAINER entry=
 accordingly (last patch).
>  Is it right?
>=20
>  Also for final submission I think I need to 1) create some public git  t=
ree to push driver code (github or something), 2)
> make pull request to  SOC team (soc@kernel.org). Is it a correct procedur=
e?
>=20
>  I will appreciate any help/comments.
>=20
> sidenote: We plan to post other drivers for A64FX HPC extension (prefetch=
 control and cache control) too anytime soon.
>=20
> Misono Tomohiro (10):
>   soc: fujitsu: hwb: Add hardware barrier driver init/exit code
>   soc: fujtisu: hwb: Add open operation
>   soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
>   soc: fujitsu: hwb: Add IOC_BW_ASSIGN ioctl
>   soc: fujitsu: hwb: Add IOC_BW_UNASSIGN ioctl
>   soc: fujitsu: hwb: Add IOC_BB_FREE ioctl
>   soc: fujitsu: hwb: Add IOC_GET_PE_INFO ioctl
>   soc: fujitsu: hwb: Add release operation
>   soc: fujitsu: hwb: Add sysfs entry
>   soc: fujitsu: hwb: Add Kconfig/Makefile to build fujitsu_hwb driver
>=20
>  MAINTAINERS                            |    7 +
>  arch/arm64/Kconfig.platforms           |    5 +
>  drivers/soc/Kconfig                    |    1 +
>  drivers/soc/Makefile                   |    1 +
>  drivers/soc/fujitsu/Kconfig            |   24 +
>  drivers/soc/fujitsu/Makefile           |    2 +
>  drivers/soc/fujitsu/fujitsu_hwb.c      | 1253 ++++++++++++++++++++++++
>  include/uapi/linux/fujitsu_hpc_ioctl.h |   41 +
>  8 files changed, 1334 insertions(+)
>  create mode 100644 drivers/soc/fujitsu/Kconfig  create mode 100644 drive=
rs/soc/fujitsu/Makefile  create mode
> 100644 drivers/soc/fujitsu/fujitsu_hwb.c  create mode 100644 include/uapi=
/linux/fujitsu_hpc_ioctl.h
>=20
> --
> 2.26.2

