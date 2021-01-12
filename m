Return-Path: <SRS0=bXzz=GP=fujitsu.com=misono.tomohiro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A782DC433E0
	for <soc@archiver.kernel.org>; Tue, 12 Jan 2021 10:38:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A66A23105; Tue, 12 Jan 2021 10:38:21 +0000 (UTC)
X-Greylist: delayed 63 seconds by postgrey-1.34 at mail.kernel.org; Tue, 12 Jan 2021 10:38:20 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 829FC222B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=misono.tomohiro@fujitsu.com
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 829FC222B3;
	Tue, 12 Jan 2021 10:38:20 +0000 (UTC)
IronPort-SDR: bmc4o/bL2sh9NIXm/XrZmREt8WIJb50ZYcf23WZ8XgFYUdlG7bZYIWlN6u8lD8ipniQbD9SfYE
 ti7LpfJqYHEgA1XHfB45QrGkeoc2prWcSX0LGhyXXHBah2w+ipFuF1iy5N21anWBZf0+fSSVNg
 DeuXH27k02oomnHE5gt4ug/Id44psAKjtiDmeLQ+PAFL8G6/MQcBYz8pf9S2zlFpH9caD+M1r7
 xayZ1Kf+WpcC23YeHNAJUI5VeurRGAS5ulH5GBYTl3gETNWzOFaa964p9tCiLo9T3vHJCf11HD
 D2k=
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="32407615"
X-IronPort-AV: E=Sophos;i="5.79,341,1602514800"; 
   d="scan'208";a="32407615"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 19:37:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4CzQGEg+nfhbGpIBXWvOiL09fDqNF1fKRDjLxPLs5/VoUGQ1VpeDytRGOHQgyEDOB/cng/2UDVh3YIvZF9S0bK21AOYeM2aWChcynrDxG/Z83vlXxAA62lKNl4VFvOX8JfofLcWe6MaznG0J6YPvwcWFzQOKoGkT/w3w0WI+i//gY8tWqPMCGLpZRmZqyCGUfET9pta7E9OwcFEicKaBfNUJ9dZO2abXsvdefyt1JM9p4R0jYAfTVypjxmBZq0QQ1LMCpCddHGyCcKDRWGEgIAOZDGKbQm0Thh3AKzXxXzqk6MBAIyr82z5Lh7wgOTeNY77rEQ73hnpN0icAUNIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMTqRpPvyaIKkj/f6Eary2gXh/NYZR6ito/pxzSaRlw=;
 b=Q22vDF9jOSVXXnT4v8+aOIY3k6ChedCYI/TOh1RYEKoefHfUBDylWhe2pLTN6PQy5d777blAXPqpW+K/1ZPi0dGBDZ2cfvd+d7imkmjC6Jt4NoewLmtW3tV3HBOSOXOQ/xaEieyNALV72W/KAFME6+O9c7inpQH6jQHQFPdbEc3Rp4WK3buNU+KVTbI+C/ZI6CHqdHGpnVu0eMSIfGXZdcSuSEC2FRq0nLX6Xtct1a3s9PTYOZqfhYFw0J4hMVjJQ2i6h14S8ZdKrfs+31P/JTaK2VYUysk/p0od3nrBLPSZOptUZlEHJtHYiRkgJlz9lzKhRvTuTYuwxxU7LheMSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMTqRpPvyaIKkj/f6Eary2gXh/NYZR6ito/pxzSaRlw=;
 b=D9YNxp3IARANH1bjHFHHUcB3IEx0tMGaoqkuiLYllo2ZaV4if4QKhsbpAYI5Npkk1HHUdWZaJ+D6nAjQSo9orIlqiau6M/SNOxcTS6t0rHzGs+uxMCTsZ0ozYDyh5FzRQv77GZgCi/czTEd3nz3yiMv8xzYkURBjQfOwx3PKbZY=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSBPR01MB2181.jpnprd01.prod.outlook.com (2603:1096:603:26::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 10:37:10 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 10:37:10 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Jonathan Cameron' <Jonathan.Cameron@Huawei.com>
List-Id: <soc.lore.kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "soc@kernel.org" <soc@kernel.org>,
	"olof@lixom.net" <olof@lixom.net>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>
Subject: RE: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
Thread-Topic: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
Thread-Index: AQHW5afs5N54s+MgtEWWkkqkCyxp9qodh8MAgAAX9wCABZUDEA==
Date: Tue, 12 Jan 2021 10:35:59 +0000
Deferred-Delivery: Tue, 12 Jan 2021 10:36:58 +0000
Message-ID:
 <OSBPR01MB4582AE3802469001F5F5A4AAE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
	<20210108103227.1740865-2-misono.tomohiro@jp.fujitsu.com>
 <20210108115804.00000594@Huawei.com>
In-Reply-To: <20210108115804.00000594@Huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-shieldmailcheckermailid: 06c732a7f885417f8cabe34bfdaafd0f
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: Huawei.com; dkim=none (message not signed)
 header.d=none;Huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c7ef96b-51dd-4ba6-62a6-08d8b6e6041d
x-ms-traffictypediagnostic: OSBPR01MB2181:
x-microsoft-antispam-prvs:
 <OSBPR01MB218129E676E4FA1768174BAEE5AA0@OSBPR01MB2181.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +ytaaKnHXqncAP1YC8xtB0VBmhjoVpDY0249qChRfNIIh67ZXm32fFZu1DxRpExOcCNMP3JlNsMpgub8Jko4j5U84h9lfj1Jp5KduhwBXL9fz4c/RlNz325B/z36Y44zNRA7xRVJD0obxlPt/Ju3f1DJSOf4zfP6JPZb+caBQPqm4lLeGrtZpPIELlOPqb3ieRrBBs/uX+3agUejkpA/rvXIc6xFvZTMgcTbsydM7JL5FEtAeD1QWOrTbYTSN8g9AZ5sYpVyU8UPsuGqjnmMTdywb6xviq7vIgYrv0x49TVcX1L1z3CLXw8qEVri3FnbwATX62JTINbhXVLqf3by9Rte0/u+rsGcG5DiqYaKieUNYFfnxVMRVPjuV59o8HTVc134HLO+bbbEJ91CI8Ck6CWKOxfUf6K1xow0peTiUIcIwvLe1p2GufZdo8RJR252
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB4582.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(6666004)(66476007)(76116006)(30864003)(66556008)(7696005)(5660300002)(8936002)(52536014)(64756008)(66446008)(66946007)(55016002)(85182001)(6506007)(9686003)(2906002)(83380400001)(186003)(478600001)(4326008)(26005)(6916009)(316002)(33656002)(8676002)(86362001)(71200400001)(54906003)(777600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?iso-2022-jp?B?alZ0M3hrdXV6bnhlSFpmUTgydE5WS01icFNucmNOVHB2aVV0ek9sb3Ny?=
 =?iso-2022-jp?B?TmYwLytXNEhRc0Zxdk9kamRqNitCQmRVeDIxVDZpYWI0V0xHSGRmemVr?=
 =?iso-2022-jp?B?eG94R29qY3dZWEZkS3RXUG1JcnVzcVRIOG5tYjlLcXFCQ1NBZmRBcFJm?=
 =?iso-2022-jp?B?NnYrU3VDbnVjTXlvMTgwN0IxQ0JncHVaMkRRNHhHV0JyWmpLaVNoOWlW?=
 =?iso-2022-jp?B?VFlNRGFpMWhTQkZyQ2J0aWtlTVdNNXZ5WDFkYlVMbWFVd2hIbDVJbDl4?=
 =?iso-2022-jp?B?ekVuOU5RamhSZGs3MFBveGxuaFRtVlJ6cWYwMXprMVJ3eFdqUDJIdmZz?=
 =?iso-2022-jp?B?N1o5M0N1b0dmNzFQYUVtK3ZkQkVkK1NoVzJxSng3d25EWHVQbS8vTFAw?=
 =?iso-2022-jp?B?em9FYjhlR2FpekxnT3B5RXBrRllMWEpPcGp1Ry9GUktDZTJuVWwwNUVU?=
 =?iso-2022-jp?B?K0sra2U1K2hPZ0Z3MXRodDg3bUtLMnVJNjdWRFNHa0gzNVpoMk9XeWxF?=
 =?iso-2022-jp?B?V1lkYmdZeVFjbjFGR1hzQVd1WDJxMWFDSTFlOHQyd29YWEl4akV3Z25p?=
 =?iso-2022-jp?B?SjBROEt4eFJ0ZURiV29wemZ2RmZ2Tmh3YjlGaTdUdEdVU1BiTnhtRTIv?=
 =?iso-2022-jp?B?dmhTUUNsSGt0R1ZSL1hPOVR3cjdZcnIzSVZMeFVaSGRVbDN1eFdRVzNn?=
 =?iso-2022-jp?B?dGJNSXlqNHpHZVlWNlNkcXRSUUhlTTV2NHNFWlUzSVozNkJtTUxCNU5T?=
 =?iso-2022-jp?B?ZDRRbllESTI3Rjl1VXhrdnZjT3BsYzdDZ0FYTWhHT0xITVcxMDlSZ3pL?=
 =?iso-2022-jp?B?Z1VzckkzeUs2V2pRSjNUejJYdytqUFZyMWdHVGsxSHhxbkxSVGVobzhh?=
 =?iso-2022-jp?B?amVDeHBkUG5maUNNTGgwelhzR09wT2l2eGJVRFFNSjN4KzB1SXBrTDZB?=
 =?iso-2022-jp?B?YU9TbmlCWENDVDIwWkRFWXBBL2x6VTJ6eVRHUHEwcUpwUXY3ZjROUUp1?=
 =?iso-2022-jp?B?Z0M3VFNjK0lVYkp0elVIWEExZERQU1RwOFZ0MXZPUVBWQ2lWOVBuS1E4?=
 =?iso-2022-jp?B?S3h2ZnBsT0tZMjlEYWZnODFraUh3QmNjV3pETVlVWVhBS0JaRW9vaTZB?=
 =?iso-2022-jp?B?K295ZURpaUJCQW1IQnk1eTMrVE5haS94bldESFdob0NaUjhKVXMrMjlq?=
 =?iso-2022-jp?B?ZjJPSUJRSDRxSldIQ0k2WFVKUjlxT2R1TGZLaFhuMUhsQjFzSFUzdW9z?=
 =?iso-2022-jp?B?bVZlN0JPWXNGcTFlUlNYeDFCeVdnR1g0NmFPQUFxVU85WWdxQUJSSTh0?=
 =?iso-2022-jp?B?NVNVQ0VvNk5KWGRxOGVrM3hMWmMyL3Iza0dOdFFHTU9TOGEvejJiSkp1?=
 =?iso-2022-jp?B?L2RNWU53aEkyYTJjTnRnRmQ2cEhVMUw4UW1RQWp2VmVPRThQUT0=?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7ef96b-51dd-4ba6-62a6-08d8b6e6041d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 10:37:09.9873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KnmoSJmnJOlVkUxj1WMYtvyWGoRLtTk7LlPkyeQ9EdsFGEZJSWgP88FlgK2uZfnnetckdZmw5VksaRPeMxEjt9PLd7aEa9SnGH+EQq3XzZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2181

> On Fri, 8 Jan 2021 19:32:18 +0900
> Misono Tomohiro <misono.tomohiro@jp.fujitsu.com> wrote:
>=20
> > This adds hardware barrier driver's struct definitions and module
> > init/exit code. We use miscdeice for barrier driver ioctl
>=20
> device
>=20
> > and /dev/fujitsu_hwb will be created upon module load.
> > Following commits will add each ioctl definition.
> >
> > Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
>=20
> Hi Misono,
>=20
> I was taking a look out of curiosity so the following is definitely
> not a full review but a few general comments inline.

Hi Jonathan,
Thanks for all reviews. I will update accordingly if I send v2
(each comments follows below).

>=20
> Thanks,
>=20
> Jonathan
>=20
> > ---
> >  drivers/soc/fujitsu/fujitsu_hwb.c | 313
> > ++++++++++++++++++++++++++++++
> >  1 file changed, 313 insertions(+)
> >  create mode 100644 drivers/soc/fujitsu/fujitsu_hwb.c
> >
> > diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c
> > b/drivers/soc/fujitsu/fujitsu_hwb.c
> > new file mode 100644
> > index 000000000000..44c32c1683df
> > --- /dev/null
> > +++ b/drivers/soc/fujitsu/fujitsu_hwb.c
> > @@ -0,0 +1,313 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2020 FUJITSU LIMITED
> > + *
> > + * This hardware barrier (HWB) driver provides a set of ioctls to
> > +realize synchronization
> > + * by PEs in the same Come Memory Group (CMG) by using implementation =
defined registers.
> > + * On A64FX, CMG is the same as L3 cache domain.
> > + *
> > + * The main purpose of the driver is setting up registers which
> > +cannot be accessed
> > + * from EL0. However, after initialization, BST_SYNC/LBSY_SYNC
> > +registers which is used
> > + * in synchronization main logic can be accessed from EL0 (therefore i=
t is fast).
> > + *
> > + * Simplified barrier operation flow of user application is as follows=
:
> > + *  (one PE)
> > + *    1. Call IOC_BB_ALLOC to setup INIT_SYNC register which is shared=
 in a CMG.
> > + *       This specifies which PEs join synchronization
> > + *  (on each PE joining synchronization)
> > + *    2. Call IOC_BW_ASSIGN to setup ASSIGN_SYNC register per PE
> > + *    3. Barrier main logic (all logic runs in EL0)
> > + *      a) Write 1 to BST_SYNC register
> > + *      b) Read LBSY_SYNC register
> > + *      c) If LBSY_SYNC value is 1, sync is finished, otherwise go bac=
k to b
> > + *         (If all PEs joining synchronization write 1 to BST_SYNC, LB=
SY_SYNC becomes 1)
> > + *    4. Call IOC_BW_UNASSIGN to reset ASSIGN_SYNC register
> > + *  (one PE)
> > + *    5. Call IOC_BB_FREE to reset INIT_SYNC register
> > + */
> > +
> > +#include <asm/cputype.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> > +#include <linux/cpu.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/kernel.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/module.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/slab.h>
> > +#include <linux/wait.h>
> > +
> > +#ifdef pr_fmt
> > +#undef pr_fmt
> > +#endif
> > +#define pr_fmt(fmt) "[%s:%s:%d] " fmt, KBUILD_MODNAME, __func__,
> > +__LINE__
> > +
> > +/* Since miscdevice is used, /dev/fujitsu_hwb will be created when
> > +module is loaded */ #define FHWB_DEV_NAME "fujitsu_hwb"
> > +
> > +/* Implementation defined registers for barrier shared in CMG */
> > +#define FHWB_INIT_SYNC_BB0_EL1  sys_reg(3, 0, 15, 13, 0) #define
> > +FHWB_INIT_SYNC_BB1_EL1  sys_reg(3, 0, 15, 13, 1) #define
> > +FHWB_INIT_SYNC_BB2_EL1  sys_reg(3, 0, 15, 13, 2) #define
> > +FHWB_INIT_SYNC_BB3_EL1  sys_reg(3, 0, 15, 13, 3) #define
> > +FHWB_INIT_SYNC_BB4_EL1  sys_reg(3, 0, 15, 13, 4) #define
> > +FHWB_INIT_SYNC_BB5_EL1  sys_reg(3, 0, 15, 13, 5)
> > +
> > +/* Implementation defined registers for barrier per PE */
> > +#define FHWB_CTRL_EL1           sys_reg(3, 0, 11, 12, 0)
> > +#define FHWB_BST_BIT_EL1        sys_reg(3, 0, 11, 12, 4)
> > +#define FHWB_ASSIGN_SYNC_W0_EL1 sys_reg(3, 0, 15, 15, 0) #define
> > +FHWB_ASSIGN_SYNC_W1_EL1 sys_reg(3, 0, 15, 15, 1) #define
> > +FHWB_ASSIGN_SYNC_W2_EL1 sys_reg(3, 0, 15, 15, 2) #define
> > +FHWB_ASSIGN_SYNC_W3_EL1 sys_reg(3, 0, 15, 15, 3)
> > +
> > +/* Field definitions for above registers */ #define
> > +FHWB_INIT_SYNC_BB_EL1_MASK_FIELD  GENMASK_ULL(44, 32)
> > +#define FHWB_INIT_SYNC_BB_EL1_BST_FIELD   GENMASK_ULL(12, 0)
> > +#define FHWB_CTRL_EL1_EL1AE               BIT_ULL(63)
> > +#define FHWB_CTRL_EL1_EL0AE               BIT_ULL(62)
> > +#define FHWB_BST_BIT_EL1_CMG_FILED        GENMASK_ULL(5, 4)
> > +#define FHWB_BST_BIT_EL1_PE_FILED         GENMASK_ULL(3, 0)
> > +#define FHWB_ASSIGN_SYNC_W_EL1_VALID      BIT_ULL(63)
> > +
> > +static enum cpuhp_state _hp_state;
> > +
> > +/*
> > + * Each PE has its own CMG and Physical PE number (determined by BST_B=
IT_EL1 register).
> > + * Barrier operation can be performed by PEs which belong to the same =
CMG.
> > + */
> > +struct pe_info {
> > +	/* CMG number of this PE */
> > +	u8 cmg;
> > +	/* Physical PE number of this PE */
> > +	u8 ppe;
> > +};
> > +
> > +/* Hardware information of running system */ struct hwb_hwinfo {
> > +	/* CPU type (part number) */
> > +	unsigned int type;
> > +	/* Number of CMG */
> > +	u8 num_cmg;
> > +	/* Number of barrier blade(BB) per CMG */
> > +	u8 num_bb;
> > +	/* Number of barrier window(BW) per PE */
> > +	u8 num_bw;
> > +	/*
> > +	 * Maximum number of PE per CMG.
> > +	 * Depending on BIOS configuration, each CMG has up to max_pe_per_cmg=
 PEs
> > +	 * and each PE has unique physical PE number between 0 ~ (max_pe_per_=
cmg-1)
> > +	 */
> > +	u8 max_pe_per_cmg;
> > +
> > +	/* Bitmap for currently allocated BB per CMG */
> > +	unsigned long *used_bb_bmap;
> > +	/* Bitmap for currently allocated BW per PE */
> > +	unsigned long *used_bw_bmap;
> > +	/* Mapping table of cpuid -> CMG/PE number */
> > +	struct pe_info *core_map;
> > +};
> > +static struct hwb_hwinfo _hwinfo;
> > +
> > +/* List for barrier blade currently used per FD */ struct
> > +hwb_private_data {
> > +	struct list_head bb_list;
> > +	spinlock_t list_lock;
> > +};
> > +
> > +/* Each barrier blade info */
> > +#define BB_FREEING 1
> > +struct bb_info {
> > +	/* cpumask for PEs which participate synchronization */
> > +	cpumask_var_t pemask;
> > +	/* cpumask for PEs which currently assigned BW for this BB */
> > +	cpumask_var_t assigned_pemask;
> > +	/* Added to hwb_private_data::bb_list */
> > +	struct list_head node;
> > +	/* For indicating if this bb is currently being freed or not */
> > +	unsigned long flag;
> > +	/* For waiting ongoing assign/unassign operation to finish before fre=
eing BB */
> > +	wait_queue_head_t wq;
> > +	/* Track ongoing assign/unassign operation count */
> > +	atomic_t ongoing_assign_count;
> > +	/* CMG  number of this blade */
>=20
> nitpick: Double space currently after CMG that looks inconsistent.

Right. I will fix it.

>=20
> > +	u8 cmg;
> > +	/* BB number of this blade */
> > +	u8 bb;
> > +	/* Hold assigned window number of each PE corresponding to @assigned_=
pemask */
> > +	u8 *bw;
> > +	/* Track usage count as IOC_BB_FREE and IOC_BW_[UN]ASSIGN might be ru=
n in parallel */
> > +	struct kref kref;
> > +};
> > +static struct kmem_cache *bb_info_cachep;
> > +
> > +static const struct file_operations fujitsu_hwb_dev_fops =3D {
> > +	.owner          =3D THIS_MODULE,
> > +};
> > +
> > +static struct miscdevice bar_miscdev =3D {
> > +	.fops  =3D &fujitsu_hwb_dev_fops,
> > +	.minor =3D MISC_DYNAMIC_MINOR,
> > +	.mode  =3D 0666,
> > +	.name  =3D FHWB_DEV_NAME,
> > +};
> > +
> > +static void destroy_bb_info_cachep(void) {
> > +	kmem_cache_destroy(bb_info_cachep);
> > +}
> > +
> > +static int __init init_bb_info_cachep(void) {
> > +	/*
> > +	 * Since cpumask value will be copied from userspace to the beginning=
 of
> > +	 * struct bb_info, use kmem_cache_create_usercopy to mark that region=
.
> > +	 * Otherwise CONFIG_HARDENED_USERCOPY gives user_copy_warn.
> > +	 */
> > +	bb_info_cachep =3D kmem_cache_create_usercopy("bb_info_cache", sizeof=
(struct bb_info),
> > +			0, SLAB_HWCACHE_ALIGN, 0, sizeof(cpumask_var_t), NULL);
> > +	if (bb_info_cachep =3D=3D NULL)
>=20
> inconsistent on ! vs =3D=3D NULL checks.  I personally don't care which y=
ou use, but better to chose one style and use if
> everywhere in a given driver.

OK. I will use "if (!var)" style in everywhere.

>=20
> > +		return -ENOMEM;
> > +
> > +	return 0;
> > +}
> > +
> > +static void free_map(void)
> > +{
> > +	kfree(_hwinfo.used_bw_bmap);
> > +	kfree(_hwinfo.used_bb_bmap);
> > +	kfree(_hwinfo.core_map);
> > +}
> > +
> > +static int __init alloc_map(void)
>=20
> For generic sounding function names, it is better to prefix with somethin=
g driver specific.
> perhaps hwb_alloc_map() or similar?  Both avoids possible clashes of nami=
ng in future and leads to more readable code
> as people then know the function is local.

OK. I will unify to use "hwb" prefix.

>=20
> > +{
> > +	_hwinfo.core_map =3D kcalloc(num_possible_cpus(), sizeof(struct
> > +pe_info), GFP_KERNEL);
>=20
> preferred to use sizeof(*_hwinfo.core_map) as saves reviewer checking the=
 types.  Note applies in other places as well.
OK. I will fix it.

> Whilst it's nice to make these flexible in size, the separate allocations=
 do add overheads.
> Given num_possible_cpus is probably constrained, perhaps better to just m=
ake these fixed size and big enough for all
> plausible usecases?

Well, it might be possible that the number of CPUs may vary in systems (tho=
ugh currently all system has 1 CPU),
I'd rather keep current notation.

>=20
>=20
> > +	_hwinfo.used_bb_bmap =3D kcalloc(_hwinfo.num_cmg, sizeof(unsigned lon=
g), GFP_KERNEL);
> > +	_hwinfo.used_bw_bmap =3D kcalloc(num_possible_cpus(), sizeof(unsigned=
 long), GFP_KERNEL);
> > +	if (!_hwinfo.core_map || !_hwinfo.used_bb_bmap || !_hwinfo.used_bw_bm=
ap)
> > +		goto fail;
>=20
> I'd prefer you check these individually and handle the frees explicitly. =
 Makes for easier reviewing as we can match each
> fail against the clean up.

OK, I will separate them.

>=20
> > +
> > +	/* 0 is valid number for both CMG/PE. Set all bits to 1 to represents=
 uninitialized state */
> > +	memset(_hwinfo.core_map, 0xFF, sizeof(struct pe_info) *
> > +num_possible_cpus());
> > +
> > +	return 0;
> > +
> > +fail:
> > +	free_map();
> > +	return -ENOMEM;
> > +}
> > +
> > +/* Get this system's CPU type (part number). If it is not fujitsu
> > +CPU, return -1 */ static int __init get_cpu_type(void) {
> > +	if (read_cpuid_implementor() !=3D ARM_CPU_IMP_FUJITSU)
> > +		return -1;
>=20
> Better to return a meaningful error code from here, then pass it on at th=
e caller.

OK. I will incorporate this code into hwinfo_setup() and return -ENODEV for=
 error.

>=20
> > +
> > +	return read_cpuid_part_number();
> > +}
> > +
> > +static int __init setup_hwinfo(void)
> > +{
> > +	int type;
> > +
> > +	type =3D get_cpu_type();
> > +	if (type < 0)
>=20
> As above, I'd expect to see return type; here.=09
>=20
> > +		return -ENODEV;
> > +
> > +	_hwinfo.type =3D type;
> > +	switch (type) {
> > +	case FUJITSU_CPU_PART_A64FX:
> > +		_hwinfo.num_cmg =3D 4;
> > +		_hwinfo.num_bb =3D 6;
> > +		_hwinfo.num_bw =3D 4;
> > +		_hwinfo.max_pe_per_cmg =3D 13;
> > +		break;
> > +	default:
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int hwb_cpu_online(unsigned int cpu) {
> > +	u64 val;
> > +	int i;
> > +
> > +	/* Setup core_map by reading BST_BIT_EL1 register of each PE */
> > +	val =3D read_sysreg_s(FHWB_BST_BIT_EL1);
> > +	_hwinfo.core_map[cpu].cmg =3D FIELD_GET(FHWB_BST_BIT_EL1_CMG_FILED, v=
al);
> > +	_hwinfo.core_map[cpu].ppe =3D FIELD_GET(FHWB_BST_BIT_EL1_PE_FILED,
> > +val);
> > +
> > +	/* Since these registers' values are UNKNOWN on reset, explicitly cle=
ar all */
> > +	for (i =3D 0; i < _hwinfo.num_bw; i++)
> > +		write_bw_reg(i, 0);
> > +
> > +	write_sysreg_s(0, FHWB_CTRL_EL1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __init hwb_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret =3D setup_hwinfo();
> > +	if (ret < 0) {
>=20
> As it's not obvious from the function name that the only thing it is doin=
g is checking the cpu type, I'd move this error print
> into that function call or rename setup_hwinfo()

I will remove this error print as following arnd's comment in a different t=
hread.

Thanks,
Misono

>=20
>=20
> > +		pr_err("Unsupported CPU type\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D alloc_map();
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D init_bb_info_cachep();
> > +	if (ret < 0)
> > +		goto out1;
> > +
> > +	/*
> > +	 * Setup cpuhp callback to ensure each PE's resource will be initiali=
zed
> > +	 * even if some PEs are offline at this point
> > +	 */
> > +	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/fujitsu_hwb:onlin=
e",
> > +		hwb_cpu_online, NULL);
> > +	if (ret < 0) {
> > +		pr_err("cpuhp setup failed: %d\n", ret);
> > +		goto out2;
> > +	}
> > +	_hp_state =3D ret;
> > +
> > +	ret =3D misc_register(&bar_miscdev);
> > +	if (ret < 0) {
> > +		pr_err("misc_register failed: %d\n", ret);
> > +		goto out3;
> > +	}
> > +
> > +	return 0;
> > +
> > +out3:
> > +	cpuhp_remove_state(_hp_state);
> > +out2:
> > +	destroy_bb_info_cachep();
> > +out1:
> > +	free_map();
> > +
> > +	return ret;
> > +}
> > +
> > +static void __exit hwb_exit(void)
> > +{
> > +	misc_deregister(&bar_miscdev);
> > +	cpuhp_remove_state(_hp_state);
> > +	destroy_bb_info_cachep();
> > +	free_map();
> > +}
> > +
> > +module_init(hwb_init);
> > +module_exit(hwb_exit);
> > +
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_AUTHOR("FUJITSU LIMITED");
> > +MODULE_DESCRIPTION("FUJITSU HPC Hardware Barrier Driver");

