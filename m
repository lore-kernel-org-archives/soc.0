Return-Path: <SRS0=cQz6=H7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FE5C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 07:56:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E78E64E42
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 07:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E78E64E42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mzzlHz3R4PHl4eT6d0c2ys/JtiTT6/5bLDNKEeTOrIU=; b=liBSoI0cpR87pMeQJZUufLmNL
	kfRrXIaV9oHhxybs673Jc5kJBFthBAfOk/y7PM2EpIKONha0dNh/4J8f9veylcE8hgBI0RU159OxQ
	C3aXrMAajEGvJq23BNaHBgkoP5P0IWj3rOuVFjwkTkvdPRLTkItc+NOemC+X4yAHFC0WtyPlgzUJn
	SbAmwf4H6+mN4LIuT8sPyy3lq6OOc9Lp9G1w92gxiknfllNfbvC5qZ1LZEurBhP+Oj+dVDtDLY9fK
	UM8nPz0UiAJesJCgfInQ/CEtx2c1DDKzJm9lxitjMvc1dlPruayOHtRhFO1niP/+gBqU0LrLZkyRF
	BImLViAwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGdNn-0004VO-MH; Mon, 01 Mar 2021 07:54:23 +0000
Received: from esa16.fujitsucc.c3s2.iphmx.com ([216.71.158.33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGdNl-0004Ul-0d
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Mar 2021 07:54:22 +0000
IronPort-SDR: hVUT48hBo+WFXaVhB4WKXA/JZkYfKEkdWrdEVFR0cR99aqcyeyF5ta1vzvpniDDBBmjPHDX8Q8
 RidqlwYC5097ZIrOQp3YaXBcwMdgH560oj2sAOQv7ZWpX58oo9pKnWBTiy7pSCQsjzxNBCeDFb
 pebl4253Aythb2TvrY9ntyC77soO4bSeEhQmMyd2EOKj1sOEPajnpMVKCbUGBAmkwbW4LnZU2w
 OHCnOLkepFcBvtQ6LdL54eU47xxhpGXpZyKdqievzZBRYmqORP5x45rWDBSf2w2zg0qu0vz/t8
 mK4=
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="26983376"
X-IronPort-AV: E=Sophos;i="5.81,214,1610377200"; d="scan'208";a="26983376"
Received: from mail-os2jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:54:15 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngifSCTjxB/D8HsHWnYE8DIrrKLznut0jlc7s6FMYn7aJroav0UbpA5C0P8nC3I7FXQOw/Rs5rSxQIt9CwqL0gzyn4xdjdIiQ5gG3ymvNunbrBeipxhmCV7hi1dsaCIcfUwmgKXUSQMUavzr5OxiC57iq0ZTgn7hN2eX8imetN+vOxn6aFSlJB+KvRcW0xE6pShRbze5aCizOZelVGxEMJKeod0XoyuJhtWikSBZHIA5AK3a9z9OESmQcYdkjW2aK1jwOFbAJcZgz6S8GlI+Hgi5DwGpu4gk/IrGG4YqCa0nqzhwQY/n+LVduIxUko/mbozB0kUM5Lrjzr+Cu1cS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9oiKtfuYdyuP1eOIWwEhps0ixhA5f05xK9V+OM+ooY=;
 b=a9PEK56AUSLXBCVIXLrsQSIXMct3XU3hS6wVvc7GHnNNOt8QFDosm5LVnatVUKzIxqXnBjy6XjdKi4/D3RB2TX5kyNTHfEycfqUtZ/QzR36shjyrzTuh/Ax/s/f5rXGd/rTHY4Gyb0/NemQvXFbf4DZURnT1Gq3bZRJMMlW1VBetV//LUmPP/cea0tmERc2yBQ4RfcvqTX8NAl6JdNXd+JOO3kd+MdFPZtYIuN3AtKk6M0tJaXDUswdc1yLkY2UT08nNXRP41sAzJR3/jnqj5DjBrF7WUZo4YjW4FWZF5G0fiWSug7HBXPIk5XH5BCfyVbHOxEDp/8CYnPn/uM59NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9oiKtfuYdyuP1eOIWwEhps0ixhA5f05xK9V+OM+ooY=;
 b=E/wGq/MrRrIepkUgOlG3WL5ewauNQSbu0flvnP/InOaS8F2TLqfOscDodtNKxCX6cneJrPWnUJKOyKPzI6kyKvSnYdmrGCVWM6Glx7TQmkxJkKjUcd5kPrd63heIABArnQFGv3iHnCi99DSZJ/VRCVBtjkoDVX/0zDOARqZlDDc=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OSAPR01MB5041.jpnprd01.prod.outlook.com (2603:1096:604:66::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 07:54:12 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::e8ec:399a:e6ab:7056%6]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 07:54:12 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Topic: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Index: AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8IAATzYAgAE118CAA2BUgIA1QadggBEpAYA=
Date: Mon, 1 Mar 2021 07:53:02 +0000
Deferred-Delivery: Mon, 1 Mar 2021 07:54:00 +0000
Message-ID: <OSBPR01MB4582A2BE4DB31289996E5044E59A9@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
 <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB4582A4399A25EBC65F8B0626E5859@OSBPR01MB4582.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-shieldmailcheckermailid: ce577e172fae4a12a5ed0ecd576de2d8
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c92c11e-d4d3-46d7-2839-08d8dc873402
x-ms-traffictypediagnostic: OSAPR01MB5041:
x-ms-exchange-minimumurldomainage: kernel.org#8760
x-microsoft-antispam-prvs: <OSAPR01MB504183C4C5D6600EF2FE8166E59A9@OSAPR01MB5041.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rb1Elic+bopFeTeCTI7hVxSd1N+nH70iV1OM5NCdenlXW/vvJZqws0yWzHVPg6Zog8pIaSaZz+aBkSRYTRUCqhnyaKeIhXsZolY0z8xRuC9T0I8zhr5oYG7yeLjubWqlKE8PVBYXSHuRIJbGr3EgqEku2K33QOsymrRVDkk6uw8ZuddXlJMgnW04eXXNpU9Vt91jyU56nbnM53epBo20cGyraWIWWSpybPW0zXlOh3Wr4h/CVZf2/AUsvSmWabEbfcbwWWfk2T/Wf2aJLSrMrdwHg4BLoUPxf7BJAwO0IypEnvJjHuHLbipCcwLxUBpY1dtxnfNJGBbNAgWwE95vffGQdsBLQyHQhjwuc9/ZwQGsGM5/BTqcNnXYOqu+fffam4M6Ql2uaBDSEXRWq2vIv03lts1u+y3hgFLCTQ+RN0OvEFWN4ii9Q4CsgvPJ3bXULR4EGCD1cRoFlKzkUQa8J3C6MN+t848U2WphgAXA3NlpmWTLir6Ss7urN/RJ/s1d5SPFCo2GxLEwYDttTgruPBr3M0/8dMcDwf6Dt/6qDxmxcJDGIdosp7p62TYXVBGAmVHqoyYeTPvtMGtrtoShvXpP8TrcdOlvEIwwJ5x4hw4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(66476007)(6916009)(85182001)(76116006)(54906003)(8676002)(71200400001)(64756008)(5660300002)(86362001)(66946007)(66556008)(966005)(66446008)(478600001)(55016002)(7696005)(6506007)(6666004)(316002)(8936002)(52536014)(33656002)(4326008)(2906002)(9686003)(186003)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?ZkFrQ2FVUUJvSmE4WWZJMWRMWnJhcGFFbEgyMU41VzN4ajZuRFZWTVAv?=
 =?iso-2022-jp?B?T2pMTG1TMmxyYjdUeEpwK05mRzJYQWhKUmNDRm9qS0pCQmVxajVrUmNx?=
 =?iso-2022-jp?B?UFZLRWVZQ1Y1ampCTThVSWo3NUplOWkzenFQMzJYZjNZdU9laTBMei9N?=
 =?iso-2022-jp?B?MzQ0TW8vL1Bmc0VRMXJrRUZPYko3Tm5kYUFYWlU1M1lsdWlhTEN5SWRl?=
 =?iso-2022-jp?B?ZmhvOVVyNGtqMXU1dTVIWEc0cVNaM1BuZ0tSTmpwblE3ZEhQSzBIL3dR?=
 =?iso-2022-jp?B?d1k3VkJ3QWJaSWVGYVVqaDRpejU4Q3JsQ210cFc5ek5aNStrZk82cXUx?=
 =?iso-2022-jp?B?aG9Nanh0bkJKYk5jNkFxWm9kN3ovN1pEVXFDT2YyTVlIWG5pSThtRVBI?=
 =?iso-2022-jp?B?TWlLcWxHTGRwZ0hvcXlVZmV5R2p4U01KSC93YVdJVjBraTA1dVFSMnZI?=
 =?iso-2022-jp?B?REV4akJMSUlSNFQ1Q3NSZTNnRUhwdHZwYUdkN0hGcjIxZ3lKcmdidHBv?=
 =?iso-2022-jp?B?VS9NbVMyL3BCeCsxK2pSQ3BtaFNGQlUrcjc3clVFSEh1RDZnV3hKKy90?=
 =?iso-2022-jp?B?bXF0VjU5eTNUclF6OUppS0tKenJwNU5iTEtHMVlMLzdwUGJ4UmpjQnpC?=
 =?iso-2022-jp?B?ck5mQXJPOHlVeHgwYURodlNGL3oxWEpUMUUyUU1JV0FuTE9sZ2ljeHdC?=
 =?iso-2022-jp?B?RkRseStKVU1HOE1GWXNjV05MbVlpQS83RC91Q1Q5R3NJdkM1L2xtWFJB?=
 =?iso-2022-jp?B?eHp5M2V0cWo0c25iU29VWnlvYWRtRDRwU2txRk9xVEF1K0pKeE5mbVUz?=
 =?iso-2022-jp?B?bU5Kd3hVRWhiRzZaSHhtSGQ2bVp4K2YySGtNNkpsWkgxdmVPM24wVE9Z?=
 =?iso-2022-jp?B?RDVsWVA3b3VGRGVsVjZMdXdrQzk4YmU3aENRcmR1UXd2ZERaZDk5eEZI?=
 =?iso-2022-jp?B?UDBscHAyRFhSUEp5Ty9zbGVncXlmeFBXbW15SFo5V1JKak1vMVBxTnlz?=
 =?iso-2022-jp?B?SVhBckpWVlEwYW9jbUpDTVhUbkU5NjUwK0tCRlgzOGFWajUyUEVReU9U?=
 =?iso-2022-jp?B?SnlDcnNsNFJMYSsyQjJCdnRsYjlqdVFjSGpDNURTemlmbzFHMHdOZ0o0?=
 =?iso-2022-jp?B?VFFLNmNKaHVFOEZVbktWN1dkUDlMTFRBQ3FUcGZrN0Q5WWpicTBOREQv?=
 =?iso-2022-jp?B?RndpRWMwOGYrTzVVVTlCdWxTQ2JNS3UvZExMRzU5ZmpDUnU5MnNqc213?=
 =?iso-2022-jp?B?RnEwbjlLdWpUZ1A3Y3EvWnVxajVOd0xrUzcyS0pNeTdDNEdJMDVBRVlW?=
 =?iso-2022-jp?B?ZVhxVWFTL1IvZnZXMCtsck5XNCt0UVFSTTEyZXpSUTYycmNnMjJzNmtk?=
 =?iso-2022-jp?B?Smw2QUYxVkxvUXRTT0pRODFkZTgvZ25HWWlXTFJKb0pMeUI5VzgrTkxR?=
 =?iso-2022-jp?B?RHdqMlZSSkd3U0lJSjN1Q0xRK3F2ekZhbFdxbFU0YmRSdTZObUdGQmZ4?=
 =?iso-2022-jp?B?OUVGV1N3T01MN3Rpbm5wZUtSamI2ZWowd1JMM05CK0V3N3puU0ZuT1pR?=
 =?iso-2022-jp?B?OHFVRmt3OHVyeW5OM2ltVzBOUHEzeDB1cjF3N282Y3ZxdWVJZTQ2czR3?=
 =?iso-2022-jp?B?SEF0ZDdKcDd2eVN3cGg0dVh3cy9xUVhPYzZaa1MwcDZ4Q0ZhSmdBRVRP?=
 =?iso-2022-jp?B?aFIvUkxxRGhJRHk4emRJUW95RiswR2JpZ3VBZFc4ZXB6YkhCSlh3NXhh?=
 =?iso-2022-jp?B?cUxCZWJWSHd2VTRZNG91VnNkaTdqYzlnbXRibEc3RVFub2tRUDYzazZO?=
 =?iso-2022-jp?B?ZUVZdkxGdUFXN3M0Ukl4dFE4eEgrQ3o5NUJuQzBDMHNaNTVqY3pSUThD?=
 =?iso-2022-jp?B?Z211WldWazRiY05oaFpCWWQ3YkxMaTdDZllQQlpyMVl1MGgvQi9HQm9n?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c92c11e-d4d3-46d7-2839-08d8dc873402
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 07:54:12.3437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAIl7yrjWvPUMFHUloWwW3ojKaivxJBx2bkaqjlymhPox9pGE0PiD8/KlwExXEodIcXbJ3OPTahEmBfJInQTOLCcsrU5pVLYRzVBCreg2no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_025421_373986_D3302CDC 
X-CRM114-Status: GOOD (  31.42  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210301075302.s-U9JERhVgaYvn4ewz1dQoWXTlrsvsZ_RA8vVbWPn1U@z>

Hi,

Gentle Ping?
Tomohiro

> Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver
> 
> > > > > Also, It is common usage that each running thread is bound to one PE in
> > > > > multi-threaded HPC applications.
> > > >
> > > > I think the expectation that all threads are bound to a physical CPU
> > > > makes sense for using this feature, but I think it would be necessary
> > > > to enforce that, e.g. by allowing only threads to enable it after they
> > > > are isolated to a non-shared CPU, and automatically disabling it
> > > > if the CPU isolation is changed.
> > > >
> > > > For the user space interface, something based on process IDs
> > > > seems to make more sense to me than something based on CPU
> > > > numbers. All of the above does require some level of integration
> > > > with the core kernel of course.
> > > >
> > > > I think the next step would be to try to come up with a high-level
> > > > user interface design that has a chance to get merged, rather than
> > > > addressing the review comments for the current implementation.
> 
> Hello,
> 
> Sorry for late response but while thinking new approaches, I come up with
> some different idea and want to hear your opinions. How about offload
> all control to user space while the driver just offers read/write access
> to the needed registers? Let me explain in detail.
> 
> Although I searched similar functions in other products, I could not find
> it. Also, this hardware barrier performs intra-numa synchronization and
> it is hard to be used for general inter-process barrier. So I think
> generalizing this feature in kernel does not go well.
> 
> As I said this is mainly for HPC application. In the usual situations, the
> user has full control of the PC nodes when running HPC application and
> thus the user has full responsibility of running processes on the machine.
> Offloading all controls to these registers to the user is acceptable in that
> case (i.e. the driver just offers access to the registers and does not control it).
> This is the safe for the kernel operation as manipulating barrier related
> registers just affects user application.
> 
> In this approach we could remove ioctls or control logic in the driver but
> we need some way to access the needed registers. I firstly think if I can
> use x86's MSR driver like approach but I know the idea is rejected
> recently for security concerns:
>  https://lore.kernel.org/linux-arm-kernel/20201130174833.41315-1-rongwei.wang@linux.alibaba.com/
> 
> Based on these observations, I have two ideas currently:
>  1) make the driver to only expose sysfs interface for reading/writing
>    A64FX's barrier registers
> or
>  2) generalizing (1) in some way; To make some mechanism to expose
>    CPU defined registers which can be safely accessed from user space
> 
> Are these idea acceptable ways to explore to get merged in upstream?
> I'd appreciate any criticism/comments.
> 
> Regards,
> Tomohiro


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
