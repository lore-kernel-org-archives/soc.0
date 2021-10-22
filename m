Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66A7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 10:26:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CCDC611F2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 10:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CCDC611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nquRvx6lgUxQGJgn10lTvqNFGY8zRzq5pfFz6ESUE0=; b=d5ecbZQkmuMRI2
	92bDl7o1/0D/SC1Id0okH0yNR3xDcoZieSJ/vFuKsAdmsM8N/8c6X1DlaLFgt0jMeXg1pieTp8ygz
	AkV7zXBfGjt+A+5fwyF1W9Zrpyo6iYz5i4+5URN6gPaC66RTGRKYzml10oUNvxIGpo582yRo1l76A
	7dcBsq2lK1tTCHN0ViYvKZJiDNRVrzjqMJmO7RZFo7+W+LQEtvWaiPcpG4GC+GW4IjlSo9Nm/+xRU
	F0NlWYaZ7omYUu9WSBicrdAIjKvrNx2EoJP9KEzUsX+BOp5bIyqZOGeAv1kC+/kZy8+1RmJ4lVsGi
	HIjMStBOI/+59gilN/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdrl7-00AVxN-0q; Fri, 22 Oct 2021 10:26:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdrl2-00AVwv-Ru
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 10:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634898400; x=1666434400;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=z0U/KmxnGtJJ+/AhqrBTCbA2EppUcB35yKOGQ/JwpXU=;
 b=hB+ax/39uv2X64T3xZku2qKkZ/m0yfEgtsJZbR/0uF0xQghrlfZw+/+a
 MuOYp7fY8XsaLhxqpTMbtBX83qwtinTALEpGGLG7nkOFKUPSbxG9PawPH
 4nxdjrcoSxk7Fnf+J7VgbrQ0P26MIoxdW6i/QhyiMFMCnsGLMEdUOcU2y
 fOsw+pYxRkWprKD1FkJEVITD5RxYyrgveoXgeaDol7yTva7U9F7pFDbQg
 YCnTQM1V+65EH6Ss/zYcg4bdANuZzdOlGOm3KVY/dLoEHFY0ZEcPVrmuv
 uuy6kboudjCthRbuc5Vjg+rSEPnimALsL5qourK/E4bnQxrE5v0MdFvJm w==;
IronPort-SDR: YMpkXATlP9XJOoo2POj4EEgd+Klq8fthW1XNOKs5GEvd5nniXD3UZNxiVje42TR6WsytjPrAuk
 cS7n3MYkEJAhzo8abYqotS+kZQmBwD50LFI7qY5mhoC5dnvBWDMamfLUgq1kTfSc5lwRYwKnl6
 DfNU+iVFUVZ32YWSVjaBhYV27YGWU5E8a7nQKezVGWsrifPrDnuCbAh4vTnkCurOjuVLb+wXr0
 juAQwOPd7AmnGLGEPJ0Mcu4TsEHNUvHVN3vKt7vLOgIcZzVTPvCpr0Vzv/fY4TQz+TaLhEmQiF
 hAcDI2GIad6jRC8rsgH3cAlp
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="73947177"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2021 03:26:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 03:26:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 03:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jE44ykRaNOAX3jloJAPcXSAJCTlv2lZfQ1H1GkhD0MFSOphgMaWYuc9xAvBCYbY//eMDD1ZJBgVlVB6vl+AvxmIip8BFwrun95wMFvc6AWXqdFOMZL9MHbM+2sCU0rkRurNlxGOQaUawmsrJvSNdFlILNsxrdlxNVKVquApKdmJ2eKoKHNJ1vxR7sBiELPf4g1s7ZqiAODNGafr/27Tqo7XYl9By++4noKLNMaJKxDzRgkzkDNpy0YC9QsPBKDNVFSaQcKkevH31EBtdOBAWHghRIjZJibZ5CViiUJB5Zq05AiWPyIjbGjl2WDyOv42GyMqsHxbUMgFf8ixVn0S/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0U/KmxnGtJJ+/AhqrBTCbA2EppUcB35yKOGQ/JwpXU=;
 b=er7pI6uFOuE1D9wYHjx/j4hoyIG7CW9UpVvTh3jR8P6dx+TvKDzs/rhctu4HPtoMZaDBn0/qShHTL+ap5YxlQh/XPtvJFe0tVh0Hn6Rq0KIqdF23E+UtTTAPx6Z3YtzoBI/qR8qDdQf+JXKpRz2DDprOSNgZhG4CmlWHwxe54+BmMemW9KZsRMRDXS/JgEQYXodO+9URWW1Z/UmguusBPjlrS2wJlNr+V1AwvdDm1IbSsDJhBp8I7mhQh0TaLO76if8eIBXYryFcUuXGcghaD8OIWAU2flieoxtmDZ1s69M4Z92CCSeXXQK3zx9l0NywVUdbvNvfhhuapw475nWpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0U/KmxnGtJJ+/AhqrBTCbA2EppUcB35yKOGQ/JwpXU=;
 b=OiXluX8lihOkNdtyf/ghqATcQCeXqQ83fiJELJnnOTfK2SJFFCCmE/V57Z2NAC4DpoYVet/ZoYj6Xz7HAcI1DdT9hBKKf+fx/kfOduMqLXK9KXxVjpM3QHXhoOJjzZqDjKG5c7NLv3EsVNS/r4DTPQh2pA5Qk07AWokLvOTVRmY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 10:26:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 10:26:24 +0000
From: <Conor.Dooley@microchip.com>
To: <arnd@arndb.de>, <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
CC: <olof@lixom.net>, <soc@kernel.org>, <robh+dt@kernel.org>,
 <Damien.LeMoal@wdc.com>, <jassisinghbrar@gmail.com>, <aou@eecs.berkeley.edu>, 
 <paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>, <Cyril.Jean@microchip.com>,
 <Daire.McNamara@microchip.com>, <Atish.Patra@wdc.com>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <Ludovic.Desroches@microchip.com>
Subject: Re: [PATCH] soc: add polarfire soc system controller
Thread-Topic: [PATCH] soc: add polarfire soc system controller
Thread-Index: AQHXuecsmqsF21x/+Uu/rugU1FwxCqvdh0SAgAAufICAACsgAIABCgKA
Date: Fri, 22 Oct 2021 10:26:23 +0000
Message-ID: <155badcd-80df-862b-ecf6-d6dd6b690a0c@microchip.com>
References: <79ae46c3-c028-2c99-2428-b601e4fb03d4@microchip.com>
 <mhng-a25d4570-1744-44ef-988b-43914d5bc17d@palmerdabbelt-glaptop>
 <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com>
In-Reply-To: <CAK8P3a31Gj-0DgN+ooMZds8_iOJWwGRp4FZLD0kgo9Go=Pzyhw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10c28479-441c-4d8d-b5e1-08d995466606
x-ms-traffictypediagnostic: MW3PR11MB4588:
x-microsoft-antispam-prvs: <MW3PR11MB458801A2A0AA30CFE3BF773998809@MW3PR11MB4588.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t8pu/1+kKYhfEqDCn38Wu9KDRDfS+vWTNbpxPNSGYBBwZ4kBiLLVM2TSz5vwVEdkxMBbRrN/4aHpWr5/hOrBub50SZdeC1mebyl6POB2Bg7tjhhmv9K9JRG6M2Ts2aTPMIn6sq7K2Pi+mcKgIWcd/wNMj7pQEFBeWDHHaY+OW212BDJHcqQ2T6nV5ktJt6hZJuVPtuKtnnktLlByAdreqGlg+m2TOYbSzI90kt0/IGAt5OqlOeA76iDsTyShaTGfsXkTnPVyoMAs8Q2LW14cQr+jvzpoGI7+nE1I29Poy6qAoCT8Vpk4F+MeerY+UIDeQtFlc16cfKHnLwX1Q3UCxjGcQoHoaVHCwEmEaGx4lzb+MbYFuhOlWLKbUdHImbVOSxI3Y7Kb8HvUWnkxzYnsmu2e5l2nkrwByBgBRQdDNofG0WgwH3GzkRTzIP6CPD79ElHMN/TXgahm/wTkWFnjv81SqicFWBvkqnAWTOLPBqQU/ZM78Urzv1I8fy86LLzNmYiiPyzO9+GNgrRQYuxM8XZBz5EoxSM6+yoChBO4da8sv3ZZd/WDvMKrD0XZEjtvMsU1hrhyc9perFKinem/1a/oBGTHTkEM4bUTvUNZG8OhAuziU5qt2pgqWKPZblc794pktduVRK4R1LPHgSi/NFmdKnbJwcrP0tOxI6d9UqIt43pvGF6KP1/LKvXTA/ALiIfr+/YWjpM1vyC30OICenmU6ofFysgK6zZAHMeMINNmpVcy700UivKBNBLJf/bdeLBjPJUxLFmjXini5tdS1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(86362001)(7416002)(4326008)(186003)(66476007)(66556008)(66446008)(53546011)(316002)(31696002)(64756008)(83380400001)(26005)(91956017)(76116006)(54906003)(2616005)(8936002)(8676002)(38100700002)(66946007)(110136005)(6486002)(122000001)(508600001)(5660300002)(2906002)(6512007)(36756003)(107886003)(6506007)(31686004)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXRCRHhiYjJQYVBUZGFiRmV3a1Y4Wi8xQ0hwVVBEK296NXlyazN3SURYamVT?=
 =?utf-8?B?OXExUmc5QWUxcitqM0dlakIwL1p2cmk0TlluRWNvMm5URlhBRzBISE56cUYr?=
 =?utf-8?B?YUdDdVM2aU9GWlEwUmVINWxKSlZ5K1M2ZmpLMkY4QXY2SEpNQ0FJZkZCTXFN?=
 =?utf-8?B?akdHSmYyYTd0eW8zLzZFY2RMV1VZYXdPaHBPOE5LeHk0T0diYk5hY3NLYkNM?=
 =?utf-8?B?TFNScTV5S3dDZE52NDd3VkhHNVdxMDJFbnFHNllNM01BMU9ReXdtMDQwRi9I?=
 =?utf-8?B?aXFBUWVoYzlRWU44SjU3NVhYSHJNelB0c2M3bVdyaVBXWVdpdm9iQ2xUc2JT?=
 =?utf-8?B?b2ZCMVRjcVgySDIrUmVUclRubzJNWC91cW5QNUZjNVNPOUNHMVdWWVRweHR1?=
 =?utf-8?B?SUZoOXROb2ZNczNYSFFVWm9DRDFHL1ZqcThySmUxam9XbVp1VnRQNlEvZHpa?=
 =?utf-8?B?QWc3cGw3SXdQR0d1QmQ5eTBwTXN6Ykp4WnpKRXg2ZWVRMGhOOWlpaVkrSEsz?=
 =?utf-8?B?Q0lZU3owOVVtemdCekVWaXB5TG9ZMDBoQTFJMUtGRHhEdnRZWEc0Rnkvdk1I?=
 =?utf-8?B?Y2o2Ky94T0c0a2NRNXRnZHhWVHBsa2FTTXYybG1CcVI1cVJ0dWR2Mkg2SUI2?=
 =?utf-8?B?NnVPaFJ0bFRWdTVJc0ovK2tSb2pTRGdLZFZxdWF5dUxNVk13TDdiR0Jnbk5k?=
 =?utf-8?B?eWREQzgzZ1h3NmFmc3ExVVFUUHZ4c3d6TjFDSStjNXYzT2FGczRReUVpbm9t?=
 =?utf-8?B?c0RyOFdwVzZaVnFweVdIdjgxdEJxSi9SeFFQM2w4THJ3RG5ONjdWM3JnT3pX?=
 =?utf-8?B?VC9WVE1HYm83a3JRTnZpOUxQSmtrdHVjcGwxdUp0YTNLZzViU0hRRWZyemJ4?=
 =?utf-8?B?LzR6eFpxemZXUC9OekpScW9OQWlhWWFqaXlhYXZ6ajJzS3hoeG9jVThNZ3Zy?=
 =?utf-8?B?d0lRRU5hNEs3amxaNDNmaXZDMlhkL0xkWTNrSHBaTHVCdDNVM0F3TXR1VVR5?=
 =?utf-8?B?aW91T2hnY3ZBS1gydXZsRnlGMWM3TjZEcXNqYVlGY01vaXBXdC9qaGROMTBN?=
 =?utf-8?B?cm1ocDBkSncxQUdTTzlPSVNtam0yNjVXOEs5L1ZMV2FlemtSZk5oemJBRDVF?=
 =?utf-8?B?NElBL1F6RnI1NFB6OE9KVStKeEV1endVRmlwa0d3ekFWcnRTYmVjTHplb1k1?=
 =?utf-8?B?RkxtZWdobGZsczRkRldSYitSNUY3NnFIdloxTmtYVlhNVEJ6MVZhL2hkTmxC?=
 =?utf-8?B?WDkrODJSNytNOFZNWWovSEZGVi82MytCVDNnc2FsejZhUEFCVXpvNUJPWVFI?=
 =?utf-8?B?MXpzUktxRGlSMDY0allSOE5uQk1ERHZOWldVbk1veis4ZVpNM2lpTCtIVm90?=
 =?utf-8?B?OFBHMDhBcGJxYlk1aVVyM0FZdFZvWlJ3TDF4QXd0My9oYnlLUElLSTVTMlFE?=
 =?utf-8?B?dWtSOURZT3FYdGtTQjdDZExla3JxWlE1bnUxR3lTUVRSZVBhZ1pYWERUNFJC?=
 =?utf-8?B?dFFFQmF5aEszbEFoOThNRjFlc2pqNllDT0U2RnM3dkVNN1Rjd0xDR0YxdHRT?=
 =?utf-8?B?YWQvVXdkS2F2NTlrc05TOUJPaTlKbVA2UE9IbzQxZExqVG43Qm5JNUgyaCty?=
 =?utf-8?B?NjNjMmZJN2hSeHM1RzI0REpzMHA1U1djQVFHTTFZYnliWDZ2RERDcjBJV1NX?=
 =?utf-8?B?eE9jOHhHblNidmZpQWh5MW5nenV2VTJuLzliOEZPU0tSSk5YVkxWMitIL2Fs?=
 =?utf-8?B?eE9jL21MaVcrY0RldHVwYVV4Zy9CSWpjTk5sZkFBY0pvSFhtM1k5M1RHNGFM?=
 =?utf-8?B?YnQyQmVVeENkUUdCYThhMzNBT3AwL095RzZtcVhScU9vR0M4MmNpYTRWQmdX?=
 =?utf-8?B?QmhwQitZbm8xMHMyLzRIQzh4MmRVaXozbk9VV29Fdms0RHV1WG5mY1BKT3I3?=
 =?utf-8?Q?N8jQOQmSFUo=3D?=
Content-ID: <4D2FB07745101F4CAF25A824E8F104F3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c28479-441c-4d8d-b5e1-08d995466606
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 10:26:24.0147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: conor.dooley@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_032641_060236_E604F58D 
X-CRM114-Status: GOOD (  32.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20211022102623.wbqYZPgUq6UMk4-NNsPNfEmNDRpRePSGnQCDT_P73-8@z>

resending, think i accidentally clicked a formatting option and the mail 
got converted to html.

On 21/10/2021 19:34, Arnd Bergmann wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Oct 21, 2021 at 6:00 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Thu, 21 Oct 2021 06:13:35 PDT (-0700), Conor.Dooley@microchip.com wrote:
>
>> +Arnd, Olof, and the SOC list.  They probably understand this better
>> than I do, we're kind of new to having SOCs in RISC-V land.
>>
>> I guess I was assuming that someone maintained drivers/soc, but from
>> poking around it seems like there's no entry for it and instead it's
>> just a bunch of entries for the sub-directories.  As a result the
>> scripts aren't picking up anyone to send these too, and I'd assuming
>> that because they're not in arch/riscv that they're not for the RISC-V
>> tree.
>>
>> That said, it looks like I put the Kendryte stuff in there (so sorry if
>> I screwed anything up).  I'm happy to take these via the RISC-V tree as
>> well, I'm assuming that means there should be a MAINTAINERS entry for
>> this new sub-directory so changes to it are less likely to get lost.
>> Sorry if I was confusing before, I guess I forgot about how this fits
>> together.
>>
>> Arnd: aside from the lack of a maintainer, these generally look fine to
>> me.  LMK if you were expecting this kind of stuff to go through the
>> RISC-V tree.
> 
> It probably helps avoid merge conflicts to go through the soc tree,
> as there are generally more changes for arm specific socs in there.
Yeah, that sounds like a good idea. Spoke to Nicolas this morning and 
will send a revised version of this w/ your comments addressed and 
future polarfire soc additions via the at91/sam tree.
> 
> However, we usually take pull requests from platform maintainers,
> not individual patches. For Microchip's ARM based platforms, those
> patches would go through the AT91/SAMA5 maintainers (added to
> Cc). You can ask them if they are willing to take future patches for
> the polarfire soc as well and forward them to soc@kernel.org along
> with the other stuff.
> 
>>>> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    mutex_lock_interruptible(&transaction_lock);
> 
> When you do a mutex_lock_interruptible(), you have to check its return code and
> handle the interruption, usually by passing down -EINTR to the caller.
> 
>>>> +struct mpfs_sys_controller *
>>>> +mpfs_sys_controller_get(struct device_node *mss_node)
>>>> +{
>>>> +    struct platform_device *pdev = of_find_device_by_node(mss_node);
>>>> +
>>>> +    if (!pdev)
>>>> +            return NULL;
>>>> +
>>>> +    return platform_get_drvdata(pdev);
>>>> +}
>>>> +EXPORT_SYMBOL(mpfs_sys_controller_get);
> 
> There should probably be a check in here to ensure that this is actually
> a system controller and it's bound do this driver, rather than returning a
> random device's driver data.
> 
> It might also help to make this take a phandle instead of a device node
> for lookup, to spare the client the extra phandle to node conversion.
> 
>         Arnd
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
