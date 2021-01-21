Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD90C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 10:25:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15B6D2313E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 10:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15B6D2313E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fc3jyY5rVgEdWHAJibf3JbQoEmD6G5pqw8/8m0Mspq0=; b=B5fKllR12hLWkFCMWIolBNJGO
	fJQwgZeM23ThXerlbmLw6EGAq5U3cBjWKE/0qGdWI+hyS38CIZ66c2WL1PJ/dfqBJCNQKs4X8Is3s
	KQtKsybgmZrsW7f2Hn+xoDvMceojNCrPu8jskPURyXYTW85R+9zJjBMXNRumRdq7OClEuhvgSfG0a
	oW0i9hmFGZg2tFwtJpOOlvZ9IHSsk4kapefqnwGcaW9sg2//LcPoMETtAA13Tbbak0U1oRVz4jgLZ
	LKItaS4dD8VL2a6FpDR3hcnFbpFjFFhmVaAsn6mL7qcfjO+c+sXYFbpxnFQS7VkaIkAuyWgWv5Jz4
	o5Mtb+TZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2X89-0003dh-0J; Thu, 21 Jan 2021 10:23:57 +0000
Received: from mail-dm6nam12on2076.outbound.protection.outlook.com
 ([40.107.243.76] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2X87-0003d3-25
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 10:23:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVmfN/yAxN+P87RfHFz2TS0vVoNy5hbhC8E1xxvtzW4TkEM8pqKh5itWQxaSaYYMjSgttwA/x5uAVSkj01O/KzddohuzHVxou6sMqDnebyOxvK/UuWQV30kQFYABFJ0paCv/rEA92j00DbAYyZzbIivhTwryz9YBKRWccht3aZ8ldJ0Hv3SpRunGA39e63dd6OX7zMKnMpsmK1GQgrNF/RbPezOSAz62QQAU1dceqtxk47+lrTVO3D5UPJhka1sSHNaHER0ALYEW4bYFi/U9dw7qgGuKjuCkwS22FrNZnvHHTlpG+62eBvP6rHkGIOTtJ+ML++BwCAQZwmtvzXHebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcWfjobAP4g+siZtsrLWHUdUVopaAVe8BkuAbpIU3Vw=;
 b=QLenOiKRYfw/5j4XJOEIqzDjZmCOHZDeoe1KqTCjTh39jhQmy9V76XfDXtYUKfeATc+jhLZAt3vHyhIRyZK1SMB994yPdtWo20o7XDOpZxNwH4jHtaZYf04Jy2DG3G3tuBRhAUmfSOmWHMs6fTW4+hhAgu4vCOpceV7Omu1iUzLU+418MyPP4NMlEd/axmlvakeolEbUBChF1GJTEwqyCF8GjFleAMGgDo0CKwROuMg7n/lChz8uO8CAG+vG0EU220pJrdT/q3sK+rZHvJqYVuPlbZigHE2x/hHSn+B0kCkZwlmAYGPnN+AM8dj0k3jlSuAMEOxegHltb00G//JWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcWfjobAP4g+siZtsrLWHUdUVopaAVe8BkuAbpIU3Vw=;
 b=pRU6pnvOUSGZ1golE+NB0+kGQgu++wiLcMOVuyr84qpuC7Hlgjmzg8ukmS+qBiSiYZw/g/QIg+10Kd3a1ZH6YJ7zhiiTk9tlPnkXUzDoMUnuo4Dk5RrOJRHvLGJ/2r1d+oW6IUC6qCQRz0I1EXauC1je8ae3fjK80hMha8mtNTU=
Received: from CY4PR01CA0012.prod.exchangelabs.com (2603:10b6:903:1f::22) by
 MWHPR02MB2400.namprd02.prod.outlook.com (2603:10b6:300:60::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9; Thu, 21 Jan 2021 10:23:51 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:1f:cafe::6c) by CY4PR01CA0012.outlook.office365.com
 (2603:10b6:903:1f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Thu, 21 Jan 2021 10:23:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 10:23:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 21 Jan 2021 02:23:49 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 21 Jan 2021 02:23:49 -0800
Received: from [172.30.17.109] (port=47132)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1l2X81-0005LW-59; Thu, 21 Jan 2021 02:23:49 -0800
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
To: Michael Walle <michael@walle.cc>, Michal Simek <michal.simek@xilinx.com>
References: <20210120194033.26970-1-michael@walle.cc>
 <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
 <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
 <0a1c6ebf-1d5b-4f06-56db-f04e87d2ae9a@xilinx.com>
 <bd86194a13882ce472764d0c91029e33@walle.cc>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <8917c9a1-09e9-0a39-5732-da7f555ae9ad@xilinx.com>
Date: Thu, 21 Jan 2021 11:23:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <bd86194a13882ce472764d0c91029e33@walle.cc>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbd60919-86c8-49f2-53b2-08d8bdf6a5af
X-MS-TrafficTypeDiagnostic: MWHPR02MB2400:
X-Microsoft-Antispam-PRVS: <MWHPR02MB24009EADD74F5A34C870181AC6A10@MWHPR02MB2400.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kDwu1VGyURR8KzMvkl6GblpjG3GSZPHw43jiCPxoMk+4H4PdNcqE0Yj4zij6NuexgHq/klJw+N+JQKmHSCRaxLoIO9MgoyIrVR5IeC8dN82e+zTL57cBLTTZy+pD/kV2cdSSh170onEgFARwxmzHpPN0iXT9e7rQx9mHKL8xXJuWTove9R9ADP59wMAiqguMI+Wm9DyGiu0Djidt8qkgIWFlOzh4t+g08XnwUqKogLkCasPsCqZftHTRhhkKxtJiAl5abosOCsrLpJb68Nc4wRuR5IBVbY2fUsYu6izyD92w4+DWr/sx8WGK9KtOnjOPaVb6InSW5D9vxdSsek8Sbs5N7EG1OrgnuNR9b8DweF6/JpxhJnqT27qNusvuLuXx1VjaLP9vVh3Tq3wMw6D52tbukL8fmKdvTiRS3C4q+BhgIU9vdriFzjOwLipSBJPApkM9UP8apU/2MGMgFdyzHcWPXccxi6aHE4s+ZbvHrBqYe8ZUMudQ1WA7QLaw3r8yDgk/SS2O9ZhnL33w+tNVCNhbBDGDgPRp32W3Ows5g6lGUCsURt4yOvytV8/S/Le2uIOYzgOa0IRE7gIUF48A172SsMpJKAxYPar1U9ZAcfQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966006)(70586007)(4326008)(478600001)(44832011)(36906005)(82310400003)(336012)(47076005)(82740400003)(8676002)(36756003)(70206006)(5660300002)(356005)(83380400001)(66574015)(316002)(9786002)(966005)(54906003)(31696002)(31686004)(26005)(2616005)(186003)(110136005)(7636003)(53546011)(2906002)(426003)(8936002)(6666004)(50156003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 10:23:51.1640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd60919-86c8-49f2-53b2-08d8bdf6a5af
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_052355_128620_B17EB74B 
X-CRM114-Status: GOOD (  32.97  )
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
Cc: devicetree@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121102346.5JLT3JOHBGe3gn2_5Gi9OcpOkViuwcFvjapFc1LDJMk@z>

SGksCgpPbiAxLzIxLzIxIDExOjEzIEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+IAo+
IEFtIDIwMjEtMDEtMjEgMTA6NTcsIHNjaHJpZWIgTWljaGFsIFNpbWVrOgo+PiBIaSwKPj4KPj4g
T24gMS8yMS8yMSAxMDozNSBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEhpIE1pY2hhbCwK
Pj4+Cj4+PiBBbSAyMDIxLTAxLTIxIDEwOjI1LCBzY2hyaWViIE1pY2hhbCBTaW1lazoKPj4+PiBP
biAxLzIwLzIxIDg6NDAgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4+IEFkZCBzdXBwb3J0
IGZvciB0aGUgRWJhbmcgRUJBWjQyMDUgYm9hcmQuIFRoaXMgYm9hcmQgd2FzIG9uY2UgdXNlZAo+
Pj4+PiBhcyBhCj4+Pj4+IGNvbnRyb2wgYm9hcmQgZm9yIGEgYml0Y29pbiBtaW5pbmcgZGV2aWNl
LiBOb3dhd2RheXMgaXQgaXMgc29sZCBhcyBhCj4+Pj4+IGNoZWFwCj4+Pj4+IFp5bnEtNzAwMCBl
dmFsIGJvYXJkLgo+Pj4+Pgo+Pj4+PiBNaWNoYWVsIFdhbGxlICgzKToKPj4+Pj4gwqAgZHQtYmlu
ZGluZ3M6IGFkZCBlYmFuZyB2ZW5kb3IgcHJlZml4Cj4+Pj4+IMKgIGR0LWJpbmRpbmdzOiBhcm06
IGFkZCBFYmFuZyBFQkFaNDIwNSBib2FyZAo+Pj4+PiDCoCBBUk06IGR0czogYWRkIEViYW5nIEVC
QVo0MjA1IGRldmljZSB0cmVlCj4+Pj4+Cj4+Pj4+IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL3hpbGlueC55YW1swqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4+PiDCoC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1swqAgfMKgwqAgMiArCj4+Pj4+IMKgYXJj
aC9hcm0vYm9vdC9kdHMvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAxICsKPj4+Pj4gwqBhcmNoL2FybS9ib290L2R0cy96eW5xLWViYXo0MjA1LmR0
c8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTA5Cj4+Pj4+ICsrKysrKysrKysrKysrKysrKwo+Pj4+
PiDCoDQgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKykKPj4+Pj4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvenlucS1lYmF6NDIwNS5kdHMKPj4+Pj4KPj4+Pgo+
Pj4+IGFueSBsaW5rIHdpdGggc2NoZW1hdGljcz8KPj4+Cj4+PiBodHRwczovL2dpdGh1Yi5jb20v
eGp0dWVjaG8vRUJBWjQyMDUsIGxvb2tzIGxpa2UgdGhlc2UgYXJlCj4+PiByZXZlcnNlIGVuZ2lu
ZWVyZWQgKGZyb20gYSBsYXlvdXQgZmlsZT8pIHRob3VnaC4KPj4KPj4gSW50ZXJlc3RpbmcgYnV0
IGF0IGxlYXN0IHNvbWV0aGluZy4KPj4KPj4+Cj4+Pj4gSSB3aWxsIGxldCBkdCBndXlzIHRvIGNv
bW1lbnQgMS8zIGJ1dCBzZXJpZXMgbG9vayBnb29kIHRvIG1lLgo+Pj4+IFRoZSBib2FyZCBkb2Vz
bid0IGxvb2sgaW50ZXJlc3RpbmcgZnJvbSBkZXNjcmlwdGlvbiBwb2ludCBvZiB2aWV3Cj4+Pj4g
dGhhdCdzCj4+Pj4gd2h5IGFsbCB0aGUgdGltZSB0aGlua2luZyBpZiBtYWtlcyBzZW5zZSB0byBh
ZGQgaXQgdG8ga2VybmVsLgo+Pj4KPj4+IFdoYXQgZG8geW91IHdhbnQgdG8gdGVsbCBtZT8gVGhh
dCBmb3IgdGhlIHRpbWUgYmVpbmcsIGl0IGRpZG4ndAo+Pj4gYXBwZWFyIHRvIHlvdSB0byBhZGQg
dGhlIGJvYXJkIHlvdXJzZWxmIC0gb3IgZG8geW91IHRoaW5nIGl0Cj4+PiBkb2Vzbid0IG1ha2Ug
c2Vuc2UgYXQgYWxsLiBJZiBpdHMgdGhlIGxhdHRlciwgd2hhdCB3b3VsZCBiZQo+Pj4gYWN0dWFs
IHJlYXNvbiB0byBoYXZlIGEgYm9hcmQgaW4gbWFpbmxpbmU/Cj4+Cj4+IEkgaGF2ZSBiYWQgZXhw
ZXJpZW5jZSB3aXRoIGZvciBleGFtcGxlIEF2bmV0IGJvYXJkcyB3aGljaCBwZW9wbGUgYWRkIGFu
ZAo+PiBub25lIGlzIHJlYWxseSB1cGRhdGluZyB0aGVtIGFuZCB0aGV5IGFyZSBpbiB0aGUgc2Ft
ZSBzdGF0ZSBmb3IgeWVhcnMuCj4gCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRoZW4gdG8gcHVs
bCB0aGUgcGx1ZyBhdCBzb21lIHRpbWUgYW5kIHJlbW92ZSB0aGVzZQo+IGJvYXJkcy4KPiAKPiBU
QkggSSB3YXMgYSBiaXQgZGlzYXBwb2ludGVkIGJ5IHlvdXIgc3RhdGVtZW50LiBJdCBzb3VuZGVk
IGxpa2UgIm5haAo+IHRoaXMgYm9hcmQgaXNuJ3Qgd29ydGggaXQiLiBFc3AuIGJlY2F1c2UgaXQg
aXMganVzdCBvbmUgKHNtYWxsKSBmaWxlLgo+IEJ1dCBtb3JlIGJlbG93Lgo+IAo+PiBMb25nIHRp
bWUgYWdvIHdlIGFncmVlZCB0aGF0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBkZXNjcmliZSBQTCBp
bgo+PiB1cHN0cmVhbSBwcm9qZWN0cyBhbmQgd2Ugb25seSBkZXNjcmliZSBQUyBwYXJ0LiBJdCBt
ZWFucyB5b3UgbGlrZWx5IG1pc3MKPj4gc2V2ZXJhbCB0aGluZ3Mgd2hpY2ggYXJlIHVzZWZ1bCBh
bmQgdGhlIHJlYXNvbiBmb3IgdXNpbmcgdGhlc2UgU29DcyBpcwo+PiBQTC4KPj4KPj4gQXMgeW91
IGxpa2VseSBrbm93IFhpbGlueCBoYXMgVmVyc2FsIGRldmljZSBhbmQgSSBkaWRuJ3QgcHVzaCBh
bnkgZGV2aWNlCj4+IHRyZWUgdG8gYW55IHVwc3RyZWFtIHByb2plY3QgYW5kIHRoaW5raW5nIG5v
dCB0byBhZGQgYW55IGRlc2NyaXB0aW9uIGZvcgo+PiBib2FyZHMgYW5kIHN0YXkgaW4gc29ydCBv
ZiBzcGFjZSB0aGF0ICJ2aXJ0dWFsIiBkZXNjcmlwdGlvbiBmb3IgU29DCj4+IHNob3VsZCBiZSBl
bm91Z2guIE1heWJlIGp1c3QgdmVyc2FsLmR0c2kgYW5kIG9uZSBraXRjaGVuIHNpbmsgRFQgc2hv
dWxkCj4+IGJlIGFkZGVkIGJ1dCBub3QgZGVzY3JpcHRpb24gZm9yIGFsbCBib2FyZHMuCj4+Cj4+
IFRoZSBzYW1lIGlzIGlmIG1ha2Ugc2Vuc2UgdG8gcHVzaCBhbGwgRFRzIGZvciBhbGwgc3RhbmRh
cmQgeGlsaW54IHp5bnFtcAo+PiBldmFsdWF0aW9uIGJvYXJkcy4gSWYgdGhlcmUgaXMgc29tZXRo
aW5nIGludGVyZXN0aW5nL25ldyBJIHRob3VnaHQgaXQKPj4gbWFrZXMgc2Vuc2UgdG8gYWRkIGl0
IGFzIHBhdHRlcm4gdG8gZm9sbG93LiBCdXQgZm9yIGJvYXJkcyB3aGljaCBsb29rcwo+PiB2ZXJ5
IHNpbWlsYXIgZnJvbSBQUyBwb2ludCBvZiB2aWV3IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgcmVh
bCB2YWx1ZSB0bwo+PiBhZGQgYW5kIGludmVzdCB0aW1lIGZvciBtYWludGFpbmluZy4KPj4KPj4g
QmFjayB0byB5b3VyIGNhc2UuIEJvYXJkIGlzIGNoZWFwIHdoaWNoIGlzIG5vdCBhbGwgdGhlIHRp
bWUgY2FzZSBmb3IgYW55Cj4+IHhpbGlueCBib2FyZCBidXQgeW91IGhhdmUgb25seSB1YXJ0LCBz
ZCBhbmQgcGFydGlhbGx5IGRlc2NyaWJlZCBldGhlcm5ldAo+PiB3aGljaCBkb2Vzbid0IHdvcmsg
d2l0aG91dCBQTC4gSXMgaXQgd29ydGggdG8gaGF2ZSB0aGlzIGRlc2NyaWJlZD8KPiAKPiBJIGdv
dCB5b3VyIHBvaW50LiBCdXQgaXQgaXMgYXQgbGVhc3QgYSBqdW1wIHN0YXJ0IGZvciB0aGUgdXNl
cnMgaWYgdGhhdAo+IGJvYXJkIGJvb3RzIG91dCBvZiB0aGUgYm94LiBBbmQgeWVzLCBpdHMgdW5m
b3J0dW5hdGUsIHRoYXQgZXRoZXJuZXQKPiBqdXN0IHdvcmtzIGlmIHRoZSBQTCBpcyBjb25maWd1
cmVkLiBUaGlzIGlzIGFscmVhZHkgZG9uZSBieSB0aGUKPiBib290bG9hZGVyLCBiZWNhdXNlIHRo
ZXJlIEkgZG8gaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLgoKWnlucS9aeW5xTVAgYm9hcmRzIGNhbiB1
c2UgVS1Cb290IFNQTC4gIkFkdmFudGFnZSIgb2YgdGhpcyBzb2x1dGlvbgplc3BlY2lhbGx5IGZv
ciBaeW5xIGlzIHRoYXQgaW4gdS1ib290IHRoZXJlIGlzIG9wZW4gYSB3YXkgZm9yIGFkZGluZwpw
czdfaW5pdCBmaWxlIHdoaWNoIGlzIGRldGVybWluZWQgYnkgZGV2aWNlIHRyZWUgbmFtZS4KSSB0
aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGFkZCB0aGVzZSBEVHMgYW5kIGFsc28gcHM3X2lu
aXQgdG8gVS1Cb290CnByb2plY3QgYW5kIHdpcmUgaXQgdXAgd2l0aCB6eW5xX3ZpcnQgcGxhdGZv
cm0gYW5kIHRoZW4geW91IGNhbiBib290CkxpbnV4IHdpdGggdXNpbmcgVS1Cb290J3MgRFQgcG9p
bnRlZCBieSAkZmR0Y29udHJvbGFkZHIuClRoZW4geW91IHdpbGwgZ2V0IHN1cHBvcnQgZnJvbSBz
Y3JhdGNoIHRvIGJlIGFibGUgdG8gYm9vdC4KClRoYW5rcywKTWljaGFsCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWls
aW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
