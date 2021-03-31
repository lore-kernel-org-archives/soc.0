Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE98C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 08:54:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DDC260235
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 08:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DDC260235
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wKDW2cmqXEQAlF+0yagwYkJYE4A1P4yl6/2S1rIu+Lk=; b=QTtpfnf2dbWHaP80ShRBWROTO
	r5T1o6jRijC4wt9uYWAkcTox7t1+qhhFx3Lbvx2ai+3NO0wbsfdL5pC9mKXXVbMt96EMdETqFQ2mN
	GTchx4RVfWSuA32y8iZ6Yziutyppbys5ebP/Ic+IXx8hKNxoyfPVpApQAxVEHzCneZlicblhXR0uo
	EzcocAL61DFhPcX4a4SHStcH4ksUkrSlAbZeGsyZemIQy70UbT8LGof4Wb9/LX67z+/CjxOW8te/J
	Kvu3Q3EwXl5RM/S1OZu4alXC4YBs/RfYDk9q8gPnUWQ4sCzPQWCRNKkNAaob7w/fmpMiGfrW1/MIe
	Bjt/6M6qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWaU-0062JS-24; Wed, 31 Mar 2021 08:52:30 +0000
Received: from esa16.fujitsucc.c3s2.iphmx.com ([216.71.158.33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWaO-0062Ie-00
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 08:52:26 +0000
IronPort-SDR: VyV/ZGxPuwL1mZPqMxyYTzydx395RIJmNZjypw8RxFHGrcIhw9A7j3n/PWBymnydJYrDhdmTil
 5PiFoU0+6LSVgnecFp+f/YEAWPwYfI3GwgCqe2yqhVfqigJQgiYDpTgonDgcNpzEVi1F4jan4l
 XY3NpeiM13tfm24fVrIN9OjA15Z0EMA7nF+f+0aI+R0cB1TBL+TexIQ7CfnYKrwZvTXtnlbzdq
 k6a3utncUunxTaknPbk1d0UiJkVnp/kUc+gRloD+y8xSH56R8yN4fCeNyWKRjFnv9d+UmXlBRb
 hpQ=
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="28831334"
X-IronPort-AV: E=Sophos;i="5.81,293,1610377200"; d="scan'208";a="28831334"
Received: from mail-os2jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 17:52:19 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGfHcj4c4kdRY6xcK+Ig8DQECeghH3FcHK63s7LbWvg/wQcSWn6WWdeu7kQ/roqKP0DGROC2y2TYUPf8kJx7jzHte86sp8euON/aapslM4c+maBg5V00T/ylRGDkl/sPl43fZYTJPayFELLCV0RJJT7JGqEv31dzgnFjbwry5TFwSEU3xt0G5hLZ/go8rwctVXVYHSgIX+gQR6E21OShi4ZolGezXzxGhekOt7s7rqmlV48cbosoIFdmjqeuZFCp4g2gAn4b7UbspbIc1yEuHp+qaOUs5D/iiTT5tis2edq1iNq0jlykyLUsqJlrw5ZU+Moo021tuWrK7deIO8uBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZPfbS4VZPtiLlQEOG8xhqgnfmSIbP1qumNKz7LD1fE=;
 b=VjfhK26Ft8NyhSFMt9SJbgAJb/2lloy4KlrVAd234ldAlOrcXBSsASakm5UbnPrRNJNGzQfET/+ozhqpSf/w/SMMrXAuoad5WrndTSh0u8STGcvd6yi/YCFIpVRVuDUdYdvb/GBYW+8/5XyjG6Y532T3mJ46GOMSYQ+lVPMfm5YzGE27rw/+/roRm1u7jEL97Rqh2XDr6tjHm/GT+t7FLJzYYk/Fc4Ik5IuQqxae1THzSuGz20o6cInAhv+wJ0QOJ2vnJkJp86V97vvNJTX0H9AxJkxLu3i/a3n+7pAsbWNyhRDP7n0SYhXxvmgtpYcLTiKS3U4u//LkHWTeM4N2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZPfbS4VZPtiLlQEOG8xhqgnfmSIbP1qumNKz7LD1fE=;
 b=moFLjjVugxBxcm6T5sua4274svChCEgKR6XQj+IY33DU2wxUtkLMP2IoWiOMawnEEfyG3OEXSHtHH1hj/hqeNlyFPA0kipFbRFnDh73103d3/l3XL19deTd4j3Nj4a6VPLqmCHcnM18AFtQMar1jugIdp5xm0Wv7UF98LisZaz4=
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com (2603:1096:603:15::15)
 by OSAPR01MB1604.jpnprd01.prod.outlook.com (2603:1096:603:31::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 08:52:16 +0000
Received: from OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d]) by OSAPR01MB2146.jpnprd01.prod.outlook.com
 ([fe80::6876:99f3:9288:691d%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 08:52:16 +0000
From: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>
To: James Morse <james.morse@arm.com>
List-Id: <soc.lore.kernel.org>
CC: 'Arnd Bergmann' <arnd@arndb.de>, Will Deacon <will@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>,
 "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
Subject: RE: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Topic: [PATCH RFC] soc: fujitsu: Add cache driver code
Thread-Index: AQHXEBESAJcmfc8h0U6q78FjB96JBapyH1gAgAGCoFCAAAVDgIAAAz8AgCpFWZA=
Date: Wed, 31 Mar 2021 08:52:16 +0000
Message-ID: <OSAPR01MB21463C735D4A07344F35E7CC8B7C9@OSAPR01MB2146.jpnprd01.prod.outlook.com>
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <20210304104650.GA20843@willie-the-truck>
 <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
In-Reply-To: <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05629943-0dbd-4711-b25b-08d8f422491d
x-ms-traffictypediagnostic: OSAPR01MB1604:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB16043AE26AC50F402D6879D68B7C9@OSAPR01MB1604.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +E4oDaGPxO6L47QqanAYYz9RR+KldLJTIZFZT78oTQDWKVAcUhga6B5xuYiTPPHbcrzznDLHasfB+lmBfTuxA8N2TBA6nIbQ86+EfT3ZenjLXGGbHxQ9x8nLTgXULgPih0eUGb1igLxjKvYCTDAa6eNo8lWfpIfb0iWYfhrvFocrCf9Q2f0IzCb5eesd9Ue5YesIAttiNeiy8zHthKBZGktzg/aAqwdqAfpg7VVJkegY/aud9+2XC4LNiVB7n5vxaBtWCJUlERmH5l800ylTjSOUNrlJOWcLZ8xGM8LZdbUFM7NEwfi6I5kyRn5WdDNcjArlOIQYJhq5BrkW86lGOr+woDUXVQ4HRPJWtnAm6fsvGDC4YuZCCJs/vFN/EZ2I74FWyYDq9TheLNNt8zuIvhoEHJP0iQ2wdbHOsmMy2uOGFHCJJxz11L0b8gfmOMaB3YAGMYWEmMQMwhQYcLPl4Lk1X5eNme/TIVq0BpJyk3zlvjK0fC+1VJhP69sPHvQ2jpR0NJ9bIV/4fQtw2Ai4T4kuAAP2nLjJiw5gSBDOfcDvXDpVkdELhWvo59N3ZEWDsgMXyyWPf+mmv6Vz5pPdP4aAAS8e0Ngg8sepQO7ZtpIAdn5hnZp0F8ch3nvgHjSVpNfVJ5jl8bC2MSLPklD1F0/TcNn2wGATvcgz/X0oPp0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB2146.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(107886003)(316002)(9686003)(38100700001)(6506007)(55016002)(66556008)(478600001)(52536014)(86362001)(8936002)(64756008)(83380400001)(8676002)(5660300002)(4326008)(66946007)(85182001)(7696005)(76116006)(186003)(6916009)(54906003)(71200400001)(33656002)(26005)(66476007)(66446008)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OGJ2UHlHWnB1aTYvbS9nMktEVVJrQk53aFlRMFhOSm1IWU5tbGg5RHRYSHc0?=
 =?utf-8?B?ZVpxcnRZL0dTL2FDRm1CV1U1NVQrM1A5VnVCVGllcEpobERrQjdQMkpMaTZw?=
 =?utf-8?B?bm82NkFCVGxzeXJxWmlTYi9XUmxhdU1uWFFlWUxtZTZUSC9hanMyTEhnMjVo?=
 =?utf-8?B?UXhFZXk2TXZRYVJqeGJrRm5sMnh2dTA0cmZTa3l3Um1YNVNteCtrenN2bWNQ?=
 =?utf-8?B?N0tJZGFDL1NBY05kUTZOeFZleEtZczRJalNXNFFBb01nSitvTlpGSDU4WEhX?=
 =?utf-8?B?cDI2T1pwb0lZUHJhVjEwS2JDazF6emxWamwrVG1Hcld0SVMyQURZb2Q2N1pq?=
 =?utf-8?B?N1crYmNodm9QZnVyNFI1cHZzUCtGdDRON1NTU21lNDFFMWJSVk5qclJWR1ZU?=
 =?utf-8?B?Q3pVMUlPdGZLdGZYN3JCRlFHWVFlQUZPbGMyZU5LcHhXdkJ4TnhBRm5UTFJU?=
 =?utf-8?B?YkpSNjdoMG4vK1RDYWsyS2w0ZS8rS3ZqSllSVVh0OTZ0RUQzZG56WHlHYjFF?=
 =?utf-8?B?bTRkWElQT0tjZGEzTW42aUxibU9DMmxBZGduZVRqM3JrVkZaMUROcWZLdGU0?=
 =?utf-8?B?Q3I1TlYxMTE5RWE1STJFaG5oVHdLM1pWSksrRGc0MG5KckE5Nk1MU3Nvbm9H?=
 =?utf-8?B?TVFDL25LWnBCTWErVG1uYUdpemtIQjArTDBWbVpEK0hKa2J4VVBRT0dBZ2FP?=
 =?utf-8?B?MFFiY1ZOWU9MWDFYdjNLaUZWV1l2VjZSU3V6ajFua2cwTUkxTmpMQlM0SzFN?=
 =?utf-8?B?WUl6MUNIUnR0VmxROUJiZU8yaVc5OWl0Wm1Ra1Z2dGpoUmt3MmNUSit5OSsy?=
 =?utf-8?B?UUZZYVllNVdhWGtBTlpRUXFHdnFGQ2RqUjFGemRDUkY1TVpuTzZXVG94a1F2?=
 =?utf-8?B?Uld3RThhTVVydS9Ob3lNM1k5aGVoSWxBZGpjUTNXL1dQUG5nS1FLL3ptM1Fr?=
 =?utf-8?B?ZVZZeURQQTZwZWcxRWVKWHFFWVRiNzZFRU1JTGx0a3BmUGFvYlY0d1pFT2ho?=
 =?utf-8?B?T0I1anhWaDZ1SkZ5ZXdZQXVpaHNKaUhHWFBxYURnRU9HQnZuN0RvODg5N0V0?=
 =?utf-8?B?YWhueE5qSlluRHUxRWNIVXZQVUZiMHd3UUpnYnVxUEtkWHFVQUxxVFFyWTBI?=
 =?utf-8?B?dExEYUdobnZSWEVFaWtCSDMxaDdPOXRadW1SZ3A5SHloVWJxNjNYcUwrNW9B?=
 =?utf-8?B?OHpTSlEyZXZ6bGVhbjZLR3FuNVk2NkVVQTF0eXhkeWNJci9SbW5iOTN1TWtK?=
 =?utf-8?B?M1g2SEphWi9mcFhlK2pmSDE5Tzg2UC9YRnIyajY2NWVRSXdZWkE5eGpMdGd2?=
 =?utf-8?B?ZmhXek9HVSt1MkUrUmVDMzRrZWo3VVltQjJVNklzMWhKZXl6Ly9sMFEza3B6?=
 =?utf-8?B?QW01WXRYSXRFeG9HK2JxYlpyZUJBK0RvdXViRitMMWlLVElvaDQ1K1lrVHV2?=
 =?utf-8?B?ZWhOcHArYzhYSUNzaktGTEEwVmdwVGdRZGRKdlJXQ1BUOVQ1eEc3U3EwT2Nr?=
 =?utf-8?B?bUZGRVdmQWpPVVF1K0FadWJ6QkY1cVN4M0JEajdrTDZlYW5YRmZHc2JTc0tr?=
 =?utf-8?B?SnFDV0hqNFVjdTJSa0xOZ0d3djJ5bzJWbGJjQmo2YW13WXVkNDJtNVIzSEta?=
 =?utf-8?B?YU10MzV0elkwc1IwOWc2T2orMTA1UCtDbk1peGZRc01wQWFGSm1HdUYvUm5h?=
 =?utf-8?B?YVlsWmFPSnE5YzhBRmplTEdlQ3dIUVpHSzcybEZqVWlNME1vSmRwbU1IWWhG?=
 =?utf-8?Q?m5l5MyNdr9nyD5lIOUYUbwU4P6b5izixmJNGA3A?=
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2146.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05629943-0dbd-4711-b25b-08d8f422491d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 08:52:16.5369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6y+WFTt6nxIFuTh8M2tutnNOFPFvVcJxGUKYFNiVNjCBU4+XEXMKpQqvaVyv3mi2YLxzpyUOYbPFoz8h4o/rChpCtM5jImrPwFffXZ5t4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_095224_691116_9A01B1D7 
X-CRM114-Status: GOOD (  14.92  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210331085216.WcLv2N5kFPPuPD0Act8ktQXooz_PZCwAzC_yoWElKEY@z>

Dear James Morse

> > Given that all of this is outside of the scope of the architecture, I
> > don't think that arch/arm64/ is the right place for it. Perhaps this
> > would fit into the resctrl rework that James has been doing for MPAM?
> 
> Indeed, that sounds like a good starting point. I don't understand enough about
> either of the two to be sure, but it sounds like there is some overlap in
> functionality, and ideally we would have one user interface that can deal with
> all the hardware implementations (intel, arm, fujitsu and any future ones).

According to my study, it seems possible to add A64FX's sector cache function
to resctrl. I heard you are working on resctrl rework for MPAM , 
but I cannot find related patches on ML archive. Therefore, 
I would like to know the status about MPAM support. 

(1) I think the first step is to support resctrl for ARM arch. 
   Have you finished the work of arm support and when will you release it? 
(2) When will you release MPAM patch?

Best regards
Tan Shaopeng
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
