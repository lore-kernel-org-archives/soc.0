Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47101C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 09:59:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDAFA20725
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 09:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDAFA20725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X6A1M4oXlmj8XHDejwIsZVDq191t2bU5i7CGcDln0Mg=; b=LyTIwSnQBCUk/5kOXsr8TNUON
	KWodTwFjx8gW+7ZrwfzyWJZW6teyAL7WI/SGlVZRYrA+uizHpO9P/8yt5VOG62dHp0QKUkXbRMASy
	5cvBRG/SvBHMi4ELJbSsYNyo+8J0wrLbgRtsbDHDAInlbV6wPM2Tz8HWsefXNr1x+WEoA0AdNeyKu
	kTy1JwemZ0i9UFh0shClFpMsOYNMMBWeFKK8QRut167Kq0Qb6GJ+09pRO38LcbW4D0s5vhIsgi0Gb
	R/cp5Z3OC6W59SaqweX5DyKj585qI4i2XzlIoUTvA8U56UOHhGLAroIg4kQvYvxWnd5K/QHJ9AVmR
	sVJP3KXEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Wik-0000bL-Qn; Thu, 21 Jan 2021 09:57:42 +0000
Received: from mail-mw2nam12on2040.outbound.protection.outlook.com
 ([40.107.244.40] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Wig-0000aR-NT
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 09:57:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJxvou6Kwjc1FmmkLhB79y/2/b3yoTvA9M4hI5dgmU5lpzkGNZkB4416tTM24Tzycd27WrU69FVULq5gyHT40eYtCknvEPM6aGyvYzFNJa/sGCYFyusj42uCJQI7UUzqF6cys3hiDvnH9b8GLmYgW67XxZcL8ZVz7olfDWWwK6rLLlouath8YXMhptNqtRPh7NTSpQrieiNh29QKdAH8p0iRvZxA5D2bporTM0qgMWNYfm6yT6CGS9iqYltkbbGcY/QjwcaZinXfjWlR9g9tuYcoCD57tOE7WhK8oLGBX0sqnfH91FHiGmSBpc2o84uhBKyn3M6u1cAzeJCArakAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YcGb+nlMqM4stOPyw++a32wO/5HqCo1BBZ3WOHTSYA=;
 b=fafRsDVCEcf1gPMdKYzIzz4ihxeM8Fm1tKF8MD/bgpYZ+XUtCUxIiFNhM+KGfJ7R2eW8i+lYpxKag9UFTv4v7Vvn2WpDnhs/9PcuJqV1RcDB2sxVJ0T3cvEapVBDAtL82O5yJdFFdT/RRkgQiubeOsmqbxkqHiWxgPI0mSAlIXYtEBupb7ypNwfBg/kipwvbTrd8OlkL1S+bjyvUBT2pNR/jWXxAHB2WWcNeuU7zm5jkMZ4N6ROd18lpXkuolvKMCdOCVgiAee5qE1p9QJMdAmF3holFWl4k88/89TXsp0/RC32GqtPbyQzsnoknRoyyuQktAh6vh8TqmawR0yOZgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YcGb+nlMqM4stOPyw++a32wO/5HqCo1BBZ3WOHTSYA=;
 b=pxsyONI8yOkWwSVlQpJyK6NdmbREktNhfWP6/4VswR5r64/+lM+WsLhF9thT0ZkCc42BdNRU6xyoHxJvKsuMK3bMcUwSkrVqaUQqXsSnQx2sBVgM6AgqB31UAcw5wxr9FJFjHxHfQblt07/IE7nKm3gMXBkMb25lIsjnBBn+eXU=
Received: from BL1PR13CA0063.namprd13.prod.outlook.com (2603:10b6:208:2b8::8)
 by DM5PR02MB3846.namprd02.prod.outlook.com (2603:10b6:4:b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 09:57:34 +0000
Received: from BL2NAM02FT031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2b8:cafe::7) by BL1PR13CA0063.outlook.office365.com
 (2603:10b6:208:2b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend
 Transport; Thu, 21 Jan 2021 09:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT031.mail.protection.outlook.com (10.152.77.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 09:57:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 21 Jan 2021 01:57:32 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 21 Jan 2021 01:57:32 -0800
Received: from [172.30.17.109] (port=44700)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1l2WiZ-00069C-Rh; Thu, 21 Jan 2021 01:57:32 -0800
To: Michael Walle <michael@walle.cc>, Michal Simek <michal.simek@xilinx.com>
References: <20210120194033.26970-1-michael@walle.cc>
 <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
 <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
Message-ID: <0a1c6ebf-1d5b-4f06-56db-f04e87d2ae9a@xilinx.com>
Date: Thu, 21 Jan 2021 10:57:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2908f50d-fc97-4138-16a0-08d8bdf2f98c
X-MS-TrafficTypeDiagnostic: DM5PR02MB3846:
X-Microsoft-Antispam-PRVS: <DM5PR02MB384660FA4C99F59A7AAD310FC6A10@DM5PR02MB3846.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SYbHzeuE5fuaJ2JwhbVqNTpkkLe5qaXcDWeyy9G+nkMNd9EWUF/jSC3A13RbMpaITgOCM/68sFqt6axJ0RpNI44YfoDa9vouIecsp7sVmdzAkQshuZjG8UIdvkGXYkYJyTefIe4+NR+TEGtSxvgCTwZppYLUYSTMoTBFe6YhZpZakPkgXChC3+AgeoHXdmUnRfJ5EgGCYBjX1mlgF/nuLL5M/JelB49H+DHTBnLBlF7PVMy1hAJgOl5jz/vHLB5yXBTnp9so+jVRLbVc/SYnVeET7qS002qsmc5I9DZXOP78ymjoabyuVwBi5j8bL3bRQzMIi6aYdz2ZuRE4NU7mvAN7pOua0Z7pBWjngBtdvXMfIrr9wUYyr+wxHO94oj6d2K+6xbwGIPEZJXimmi/o3qODSsGXaHfy+vPV6wjLeLbRBsYQDPEDZ4Pb4GvLM+WqfGkAu7iM4Ngq57qvsai7e8h4qRMpkKJb6ECX1L9WatlWCy77w3S4seOVNlVMmPT1DDJnJ6a1plf7f/IgCMjNzXhlM5o02TH7QdrTKGvqcAyUAhfAEHSh46vpYjXT9HJQOnBGs97fBy95EYA4lCj6orlEjaIJ6Y7yAitNSG7gCcE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966006)(54906003)(4326008)(966005)(5660300002)(356005)(36756003)(110136005)(66574015)(82310400003)(6666004)(47076005)(478600001)(336012)(9786002)(7636003)(83380400001)(53546011)(8936002)(186003)(26005)(426003)(44832011)(2906002)(82740400003)(8676002)(31696002)(70206006)(2616005)(316002)(31686004)(70586007)(50156003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 09:57:33.7948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2908f50d-fc97-4138-16a0-08d8bdf2f98c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_045739_085393_DDFDC576 
X-CRM114-Status: GOOD (  25.19  )
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
Message-ID: <20210121095728.WYWMvGtDjaW2CtN-xJ2lfY1FjAEUAaA4cBS637MbF_M@z>

SGksCgpPbiAxLzIxLzIxIDEwOjM1IEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpIE1pY2hh
bCwKPiAKPiBBbSAyMDIxLTAxLTIxIDEwOjI1LCBzY2hyaWViIE1pY2hhbCBTaW1lazoKPj4gT24g
MS8yMC8yMSA4OjQwIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4gQWRkIHN1cHBvcnQgZm9y
IHRoZSBFYmFuZyBFQkFaNDIwNSBib2FyZC4gVGhpcyBib2FyZCB3YXMgb25jZSB1c2VkIGFzIGEK
Pj4+IGNvbnRyb2wgYm9hcmQgZm9yIGEgYml0Y29pbiBtaW5pbmcgZGV2aWNlLiBOb3dhd2RheXMg
aXQgaXMgc29sZCBhcyBhCj4+PiBjaGVhcAo+Pj4gWnlucS03MDAwIGV2YWwgYm9hcmQuCj4+Pgo+
Pj4gTWljaGFlbCBXYWxsZSAoMyk6Cj4+PiDCoCBkdC1iaW5kaW5nczogYWRkIGViYW5nIHZlbmRv
ciBwcmVmaXgKPj4+IMKgIGR0LWJpbmRpbmdzOiBhcm06IGFkZCBFYmFuZyBFQkFaNDIwNSBib2Fy
ZAo+Pj4gwqAgQVJNOiBkdHM6IGFkZCBFYmFuZyBFQkFaNDIwNSBkZXZpY2UgdHJlZQo+Pj4KPj4+
IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3hpbGlueC55YW1swqDCoMKgwqDCoMKgIHzC
oMKgIDEgKwo+Pj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFt
bMKgIHzCoMKgIDIgKwo+Pj4gwqBhcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4gwqBhcmNoL2FybS9ib290
L2R0cy96eW5xLWViYXo0MjA1LmR0c8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTA5ICsrKysrKysr
KysrKysrKysrKwo+Pj4gwqA0IGZpbGVzIGNoYW5nZWQsIDExMyBpbnNlcnRpb25zKCspCj4+PiDC
oGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy96eW5xLWViYXo0MjA1LmR0cwo+
Pj4KPj4KPj4gYW55IGxpbmsgd2l0aCBzY2hlbWF0aWNzPwo+IAo+IGh0dHBzOi8vZ2l0aHViLmNv
bS94anR1ZWNoby9FQkFaNDIwNSwgbG9va3MgbGlrZSB0aGVzZSBhcmUKPiByZXZlcnNlIGVuZ2lu
ZWVyZWQgKGZyb20gYSBsYXlvdXQgZmlsZT8pIHRob3VnaC4KCkludGVyZXN0aW5nIGJ1dCBhdCBs
ZWFzdCBzb21ldGhpbmcuCgo+IAo+PiBJIHdpbGwgbGV0IGR0IGd1eXMgdG8gY29tbWVudCAxLzMg
YnV0IHNlcmllcyBsb29rIGdvb2QgdG8gbWUuCj4+IFRoZSBib2FyZCBkb2Vzbid0IGxvb2sgaW50
ZXJlc3RpbmcgZnJvbSBkZXNjcmlwdGlvbiBwb2ludCBvZiB2aWV3IHRoYXQncwo+PiB3aHkgYWxs
IHRoZSB0aW1lIHRoaW5raW5nIGlmIG1ha2VzIHNlbnNlIHRvIGFkZCBpdCB0byBrZXJuZWwuCj4g
Cj4gV2hhdCBkbyB5b3Ugd2FudCB0byB0ZWxsIG1lPyBUaGF0IGZvciB0aGUgdGltZSBiZWluZywg
aXQgZGlkbid0Cj4gYXBwZWFyIHRvIHlvdSB0byBhZGQgdGhlIGJvYXJkIHlvdXJzZWxmIC0gb3Ig
ZG8geW91IHRoaW5nIGl0Cj4gZG9lc24ndCBtYWtlIHNlbnNlIGF0IGFsbC4gSWYgaXRzIHRoZSBs
YXR0ZXIsIHdoYXQgd291bGQgYmUKPiBhY3R1YWwgcmVhc29uIHRvIGhhdmUgYSBib2FyZCBpbiBt
YWlubGluZT8KCkkgaGF2ZSBiYWQgZXhwZXJpZW5jZSB3aXRoIGZvciBleGFtcGxlIEF2bmV0IGJv
YXJkcyB3aGljaCBwZW9wbGUgYWRkIGFuZApub25lIGlzIHJlYWxseSB1cGRhdGluZyB0aGVtIGFu
ZCB0aGV5IGFyZSBpbiB0aGUgc2FtZSBzdGF0ZSBmb3IgeWVhcnMuCgpMb25nIHRpbWUgYWdvIHdl
IGFncmVlZCB0aGF0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBkZXNjcmliZSBQTCBpbgp1cHN0cmVh
bSBwcm9qZWN0cyBhbmQgd2Ugb25seSBkZXNjcmliZSBQUyBwYXJ0LiBJdCBtZWFucyB5b3UgbGlr
ZWx5IG1pc3MKc2V2ZXJhbCB0aGluZ3Mgd2hpY2ggYXJlIHVzZWZ1bCBhbmQgdGhlIHJlYXNvbiBm
b3IgdXNpbmcgdGhlc2UgU29DcyBpcyBQTC4KCkFzIHlvdSBsaWtlbHkga25vdyBYaWxpbnggaGFz
IFZlcnNhbCBkZXZpY2UgYW5kIEkgZGlkbid0IHB1c2ggYW55IGRldmljZQp0cmVlIHRvIGFueSB1
cHN0cmVhbSBwcm9qZWN0IGFuZCB0aGlua2luZyBub3QgdG8gYWRkIGFueSBkZXNjcmlwdGlvbiBm
b3IKYm9hcmRzIGFuZCBzdGF5IGluIHNvcnQgb2Ygc3BhY2UgdGhhdCAidmlydHVhbCIgZGVzY3Jp
cHRpb24gZm9yIFNvQwpzaG91bGQgYmUgZW5vdWdoLiBNYXliZSBqdXN0IHZlcnNhbC5kdHNpIGFu
ZCBvbmUga2l0Y2hlbiBzaW5rIERUIHNob3VsZApiZSBhZGRlZCBidXQgbm90IGRlc2NyaXB0aW9u
IGZvciBhbGwgYm9hcmRzLgoKVGhlIHNhbWUgaXMgaWYgbWFrZSBzZW5zZSB0byBwdXNoIGFsbCBE
VHMgZm9yIGFsbCBzdGFuZGFyZCB4aWxpbnggenlucW1wCmV2YWx1YXRpb24gYm9hcmRzLiBJZiB0
aGVyZSBpcyBzb21ldGhpbmcgaW50ZXJlc3RpbmcvbmV3IEkgdGhvdWdodCBpdAptYWtlcyBzZW5z
ZSB0byBhZGQgaXQgYXMgcGF0dGVybiB0byBmb2xsb3cuIEJ1dCBmb3IgYm9hcmRzIHdoaWNoIGxv
b2tzCnZlcnkgc2ltaWxhciBmcm9tIFBTIHBvaW50IG9mIHZpZXcgSSBkb24ndCB0aGluayB0aGVy
ZSBpcyByZWFsIHZhbHVlIHRvCmFkZCBhbmQgaW52ZXN0IHRpbWUgZm9yIG1haW50YWluaW5nLgoK
QmFjayB0byB5b3VyIGNhc2UuIEJvYXJkIGlzIGNoZWFwIHdoaWNoIGlzIG5vdCBhbGwgdGhlIHRp
bWUgY2FzZSBmb3IgYW55CnhpbGlueCBib2FyZCBidXQgeW91IGhhdmUgb25seSB1YXJ0LCBzZCBh
bmQgcGFydGlhbGx5IGRlc2NyaWJlZCBldGhlcm5ldAp3aGljaCBkb2Vzbid0IHdvcmsgd2l0aG91
dCBQTC4gSXMgaXQgd29ydGggdG8gaGF2ZSB0aGlzIGRlc2NyaWJlZD8KRXNwZWNpYWxseSB3aGVu
IGl0IGlzIHZpc2libGUgdGhhdCB5b3UgbmVlZCB0byBkZXNjcmliZSBjdXN0b20gUEwgYW5kIERU
Cm92ZXJsYXlzIGFyZSBub3Qgc29saWQgeWV0LgoKVGhhbmtzLApNaWNoYWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
