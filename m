Return-Path: <SRS0=BTt4=GW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2336BC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Jan 2021 05:33:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C090C206DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Jan 2021 05:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C090C206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J5L5ndrK1G4cjYEuTGfvfEdyJi1R1y9frTkT2JbrAn4=; b=RsI0d6PfpTO9Sl/Ptbt/qg8TT
	zRqaPAcCIIch6CO1r1R6ShhCvppvnvokxRQav0VHyy7LYlaSpHeza0w62xXgGOcKjjZSDmFGxmOra
	eEd4Kq5ybkDbiH7259QukIkgAEEPLZur0r45Uu12HG4bIPJwFApAwLS2Fm0DqvkqY6cf1QOu2rvA2
	9SlsztNg2Mh1A2grAYtujDNWg87CX9CqTS9jkuKd4/njEsxq1tNrnczT7FFO6s630LeP8Gj/sut7z
	or495mxeCrlLSIZe7C0zrmlO03mCqwi/wevpkqJVHxHYIbkGYn/Tl9G/ku/rdMaFEamQLlKfQUnCW
	kPrhSz31A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1jcf-0000dI-0r; Tue, 19 Jan 2021 05:32:09 +0000
Received: from esa8.fujitsucc.c3s2.iphmx.com ([68.232.159.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1jcb-0000cM-QY
 for linux-arm-kernel@lists.infradead.org; Tue, 19 Jan 2021 05:32:07 +0000
IronPort-SDR: mgpK4JkkPpji97CLZwj1BGq8v1YxvqLnDuAQm7FI/KEPaRzmFD/ACR4amSnDGIzrG1SWXoprCJ
 huvH+aUmuplGWv6Y20WtzTEqNjH1pPVimKTZVDkEV1vOHD7Iuih3O+0/68X5fRSk+kHeXOn/DE
 hdrsgv4AH+QPaOdFjja636YdjgbV+XfcIbBf7OVnjuOYvPCC0LiBe9X4nDnLfIdX5x782B2vK/
 bAytTKyOdP2hYa3OJDcNBRbnpLg+j3jfEXs2F51wovhp5WawtfdI6ByQxHshM5hykPTH1yznvM
 tlI=
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="24630895"
X-IronPort-AV: E=Sophos;i="5.79,357,1602514800"; d="scan'208";a="24630895"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 14:32:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nL4PXTYxdAkOtYi23pHzHm32hoGklUprNkVhL7ZEc+8CZtH3KSoFC0K68+q52IWp7TEd/H2z82V0rwIsNX4J/6/JgDdfjpS2tze/XvP21cQRLTVegjEfyDj87roPAJQmPwWXjzOSre2GME1qzF3Dt7dxeN6CXFxW2K7yY4F8mUqMeTLkRy873V3rVwNZtp42BGisimd+V8SQZAkV38tLrjuENOM0QDbzto/xu9NF5xLPfNuDs75eMX4lV1GckWVQzyxkIPqUEV99VWPnoiHLawq2DwuG2I+Ya8r+gCpSEQMM2Y6Ay9pYcq61f1AeuwoF1idAzUBZkSyU+Rl2dzmg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gOVe1a2yQNeqRYKfb0IkFzHO6WJNkySv9cM2uek6hU=;
 b=j/gSdHKTtDuuVwnSGKlVNu4Dfx1KO51gSkmVwn61WZ7avtr189DUI3a24b1mchzn9OAsiy9nr1UIEpfjuQoXQCgFKh41sMBESGJQ4RQW8ke52zxltc24Qlpx+XGBbDK1FkfLHwuj3EIuiWmUwcd0+f8m0OHB63JiEqG00IJQ5eqjCtKOdnN82Qo0FGMvJ1j5jIA96RLhIyQSWnn4AcHWVys/0vqYmf/FHUNHrOSw8KaNAvrESNtIkU2imQu7TbslwIU/B62ue0LO8pU0/iAGQm9YYl3C+bU6R8bh+Ql283eNUOX65j7isgcYVnC88is8E0gbRuFFRKfipPDjUs2imw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gOVe1a2yQNeqRYKfb0IkFzHO6WJNkySv9cM2uek6hU=;
 b=WNNdT3qZjpzVx4PTbjZPOKGtWHG5u0V0E53uebD8IKMY30Terv7/q2poEfnwVjbfZT4zjHoyJAylAbS/vPRb/lk9FE3Z/Q6dOMQeYFnIObkNJvIb/BnWZWt5sC0ADdIhnDZx8XyOHIKmR363QL1viL13pzj2rn9W7+zht+rsFoo=
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com (2603:1096:604:74::21)
 by OS0PR01MB5698.jpnprd01.prod.outlook.com (2603:1096:604:b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 05:31:57 +0000
Received: from OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f]) by OSBPR01MB4582.jpnprd01.prod.outlook.com
 ([fe80::3d2f:3902:f15b:b01f%5]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 05:31:57 +0000
From: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
To: 'Arnd Bergmann' <arnd@kernel.org>
Subject: RE: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Topic: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
Thread-Index: AQHW5aq63O/w5e6x+kOClsfWvFvpM6odr2EAgAAY7YCABfnJ8IAATzYAgAE118CAA2BUgIAF0OsA
Date: Tue, 19 Jan 2021 05:30:48 +0000
Deferred-Delivery: Tue, 19 Jan 2021 05:31:48 +0000
Message-ID: <OSBPR01MB4582B8BD611C66B999F3A3EDE5A30@OSBPR01MB4582.jpnprd01.prod.outlook.com>
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
In-Reply-To: <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-shieldmailcheckermailid: 39c87aedee614fc1843390dd9335f523
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [218.44.52.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da971039-8d18-4491-c79d-08d8bc3b8996
x-ms-traffictypediagnostic: OS0PR01MB5698:
x-microsoft-antispam-prvs: <OS0PR01MB56986DDEC9D4AB62AC8C02D9E5A30@OS0PR01MB5698.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XJB3NNogeugHwmvsP8hAnziNH0grfmbAwzuG46aPhB0oTNfn3oXfvzu5uiYCXrNDwznn1q2+3IJ/rl+lFFsmVMmETkbtrPYLKpYhyd7xWQvjugx+S0sl5TsY6OG78X9xK9V9FX9SFycB1NfnhMcF5b0nvYP2N7XR2HL7cC+ccodh4wpFytlsF69pBUmlbyoizJhKZ1DL0YIplU8zdJYhyoX6ulRplU8w2yVb4jEPYLEZ71G72ftgvcLQZNqHzPyfGfSButPscWwbPBh5txky43ULpdj+dGhBVFz6C+7wE0AMiPVUz7pZ5Pa1OzN7Xt3QER4PLEyNEyTnyNn4V6KtyKhSykA5nyZ+6Ed70zuBhiUr9ixMF+kWtf/lvncOcqnlUt9k/wON2zZMLeoOwYeJtNzE+d2qwEnWDxt/xj/cFSY6RCxV9Pfjj2cD+WYaYvOL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB4582.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(66476007)(71200400001)(2906002)(8676002)(76116006)(66446008)(478600001)(55016002)(64756008)(86362001)(9686003)(6666004)(66556008)(6506007)(8936002)(52536014)(66946007)(85182001)(83380400001)(5660300002)(4326008)(7696005)(316002)(186003)(26005)(6916009)(54906003)(33656002)(777600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ellPZTVsdkE2cDc3V3pnTUw0WTRyZkVDbWZjaFpQL1JLeXJCUStTNWFyc0w2?=
 =?utf-8?B?TFM5U0VtMnFsVGlHc29uR2FrbWVqQ21YTU1hbjA5YUthcDVJazFkZ1Vrdmxu?=
 =?utf-8?B?eURuTmlQcERvVVppSTZOTkVkRjZVYS9jLzNRZkV6MllxenkwaVdGSVpsU1Jh?=
 =?utf-8?B?b3ZxYkJIL2VISHN5K1YwS25jdjI0QlJITmdmeDJOMFV2eHVYU1JwcFlPMzVw?=
 =?utf-8?B?QVN1bXIzR3RDbXVRYWk2N2oxd0tOaHhZRmpJMTdyRVR3blhBUWs3YlF1OSt5?=
 =?utf-8?B?SVluQVU5c1p2Vk9MK283THFaUy92OFRsaU5GRDJnT3RXRGFGY2htaEdkUGxr?=
 =?utf-8?B?U3M2bitHRE1jdk9XcFFKVTE0R2w3eWMzandES0FTN3pFQkM4Y29TNmoxVVdk?=
 =?utf-8?B?QjFJNXV1a2JyaWRBVG01LzlvdVRJbWdXUXVFZXlSekVMQnBjZUQ5R0E5RVd4?=
 =?utf-8?B?SmtTc3FnMGZmMmZmaFV0NFF1NGtqelBDRFliRjhSUDErWmRBdVVuT3lPR29W?=
 =?utf-8?B?U3pKQnVOZU51SDk3c294dnNXbmU1WWF1bmxCcUVORUs1U0pOK1VBRGdib2ZM?=
 =?utf-8?B?TE1ra0E3WUpQNjlzaERBTjFjNDJDZUZEeXc4TlcxNm9PdUg4ZFNvM3YvdzBv?=
 =?utf-8?B?Vk9GOGhJTnA2UUtoTnhkMDdwWVZoY2swZmplcWxkSi9WaE5kSjNuY1hid3hz?=
 =?utf-8?B?R2VQRXFTOFNiaDBWODV6TnVaZTFaYkg2RlVVUG5aSVpuT1Z1M0NZSUdJbHlJ?=
 =?utf-8?B?VC83TGp6MEVTVjRXNkRDQnBXbHk0dFZGRERPSFdsbmJ6cUNVeXZ2aFlOYVBM?=
 =?utf-8?B?N3FlcDlPSk1TVVZNeVNJbXpKZnpuQlJFYjVITjJJcHBVazVGRUo0cFRXR0Jm?=
 =?utf-8?B?SEkybisxUDRjN2lLRU82MnJWSG11TktoL0tIY1luamtRdmFrR25iVXJmQUxL?=
 =?utf-8?B?UTc0V2wvYzFYRHZMMktsME40YlcxMkhKcGZXeng5Z2ljQnJINUxoUFpCcXl6?=
 =?utf-8?B?UEQvb2Q4d09OallieU5ET3JrTk1KUzRaNzFqSlhOUzN0aFUzT2hnUkg4dVFF?=
 =?utf-8?B?R0hmekM2Z3BtYkhxZWJQNks2ZC84MVp2YWVsdDhlZ2hBV0QxMnRGRHl1V0NH?=
 =?utf-8?B?UUxjeXVoZDNGMUhLQ3l0VklDU3I5WHQxRUcwSWlrZ2tyeFlidlBRNG8ySGI0?=
 =?utf-8?B?T0xPMGIwUzhWZ0xyQkQwVFlGTDZtSUpsWWN5QkNPTlU3aTYyMUIrdDg2eTZR?=
 =?utf-8?B?eTJ3c0lHbW9sbnhTZWh3OVZxTzdoZ3dhem1kM1ZaQW9JTVU1c2UyMnZkcHM4?=
 =?utf-8?Q?PTz16BvC88tcA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB4582.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da971039-8d18-4491-c79d-08d8bc3b8996
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 05:31:56.9797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGKVF7dATBXDkqDd/fs42RYAlhvNCiTL19Ba3BYFdaMtm4ijBMKsb3N4KqROEfrSdIJihGpGbdq0iQ2j1uLFS1HzHEKJSJ6W3oDSXXQQfJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_003206_154897_9A3AADAE 
X-CRM114-Status: GOOD (  35.13  )
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
Message-ID: <20210119053048.WOSaxaSuVZFOFjINn9h4JIoCa11HJ9QizWkOlTKTI-w@z>

> > > > Also, It is common usage that each running thread is bound to one PE in
> > > > multi-threaded HPC applications.
> > >
> > > I think the expectation that all threads are bound to a physical CPU
> > > makes sense for using this feature, but I think it would be necessary
> > > to enforce that, e.g. by allowing only threads to enable it after they
> > > are isolated to a non-shared CPU, and automatically disabling it
> > > if the CPU isolation is changed.
> > >
> > > For the user space interface, something based on process IDs
> > > seems to make more sense to me than something based on CPU
> > > numbers. All of the above does require some level of integration
> > > with the core kernel of course.
> > >
> > > I think the next step would be to try to come up with a high-level
> > > user interface design that has a chance to get merged, rather than
> > > addressing the review comments for the current implementation.
> >
> > Understood. One question is that high-level interface such as process
> > based control could solve several problems (i.e. access control/force binding),
> > I cannot eliminate access to IMP-DEF registers from EL0 as I explained
> > above. Is it acceptable in your sense?
> 
> I think you will get different answers for that depending on who you ask ;-)
> 
> I'm generally ok with it, given that it will only affect a very small
> number of specialized applications that are already built for
> a specific microarchitecture for performance reasons. E.g. when
> using an arm64 BLAS library, you would use different versions
> of the same functions depending on CPU support for NEON,
> SVE, SVE2, Apple AMX (which also uses imp-def instructions),
> ARMv8.6 GEMM extensions, and likely a hand-optimized
> version for the A64FX pipeline. Having a version for A64FX with
> hardware barriers adds (at most) one more code path but hopefully
> does not add complexity to the common code.

Thanks. Btw, to be precise, A64FX doesn't use imp-def instructions.
It provides imp-def registers which can be accessed by system
register access instructions (msr/mrs).

> > > Aside from the user interface question, it would be good to
> > > understand the performance impact of the feature.
> > > As I understand it, the entire purpose is to make things faster, so
> > > to put it in perspective compared to the burden of adding an
> > > interface, there should be some numbers: What are the kinds of
> > > applications that would use it in practice, and how much faster are
> > > they compared to not having it?
> >
> > Microbenchmark shows it takes around 250ns for 1 synchronization for
> > 12 PEs with hardware barrier and it is multiple times faster than software
> > barrier (only measuring core synchronization logic and excluding setup time).
> > I don't have application results at this point and will share when I could get some.
> 
> Thanks. That will be helpful indeed. Please also include information
> about what you are comparing against for the software barrier. E.g.
> Is that based on a futex() system call, or completely implemented
> in user space?

It completely implemented in user space by using shared variables
without system call.
(As all PEs to be synced shares L3, it should cause to access to L3.)

Regards,
Tomohiro
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
