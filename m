Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF33C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 16:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EAA961381
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 16:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EAA961381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dxw1N+ZLDrJh/C9eBPeexkRfYBYUcyptptWvPjcswaY=; b=YlXGDfG9Oo5xaB
	UIte8nnbuqvFzRno23R88x4rFRytnFmM0KIa/x1D0gTAle/PgFm/234wAdDs29Cqd0KQMysKGEj0n
	r6Wr9Tga+YH4XkWw9gx0rU7fWvJeNnJuuk+V6On7KMBCnLRMLJbu9SIYrRE7Xg72fcOoP3MClOYYw
	enWupIP0fvm67Ox3RbY3lioH4OW5B6VxwWwCmWOnsQ9KgyDRfR7WHCMG2LZLhEOpDG1fhMANFxRuJ
	jpJmtISDL53HJp2E922kk9edWB4UOk1Mxj1fb9P+7GKjsbDZiNsss9eqGbtfZnlFNKZM8GGA6hv9L
	HmYMT6DiuOA2u5TOI/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXnIp-00BHYH-P1; Tue, 05 Oct 2021 16:28:27 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXnIm-00BHXm-4O
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 16:28:26 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CD54AFF806;
 Tue,  5 Oct 2021 16:28:16 +0000 (UTC)
Date: Tue, 5 Oct 2021 18:28:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>,
 jarkko.nikula@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Pratyush Yadav <p.yadav@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, ka@semihalf.com,
 Tomasz Nowicki <tn@semihalf.com>, jam@semihalf.com, amstan@google.com
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
Message-ID: <YVx9IMk7cJSCK79/@piout.net>
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_092824_354007_F2177641 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211005162816.BPDIv2pF16bxw77sA5vfuNPngDocmoVgJebhwWNW2TA@z>

T24gMDUvMTAvMjAyMSAxODoyMjoxMiswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IE9uIFR1
ZSwgT2N0IDUsIDIwMjEgYXQgNDozNyBQTSBQYXdlxYIgQW5pa2llbCA8cGFuQHNlbWloYWxmLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gT24gU29DRlBHQSBzeXN0ZW1zLCBpdCdzIGRlc2lyZWFibGUgdG8g
aGF2ZSBmaXhlZCBudW1iZXJpbmcgZm9yCj4gPiBpMmMgYnVzc2VzLCB3aGlsZSBiZWluZyBhYmxl
IHRvIGVuYWJsZS9kaXNhYmxlIHRoZW0gKGUuZy4gaGF2ZSBpMmMxCj4gPiBiZSBtYXBwZWQgdG8g
L2Rldi9pMmMtMSwgZXZlbiB0aG91Z2ggaTJjMCBpcyBkaXNhYmxlZCkuIFRoaXMgY2FuIGFsc28K
PiA+IGJlIGFjaGlldmVkIHVzaW5nIGRldmljZXRyZWUgYWxpYXNlcyAoc2VlIGkyY19hZGRfYWRh
cHRlcikuIEhvd2V2ZXIsCj4gPiBoYXZpbmcgdGhlIGRyaXZlciBiZSBzZWxmLWNvbnRhaW5lZCB3
aXRob3V0IHJlbHlpbmcgb24gYWxpYXNlcyBpcyBtb3JlCj4gPiByb2J1c3QuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+Cj4gCj4gSSBkb24n
dCBzZWUgaG93IGFkZGluZyBhIG5vbnN0YW5kYXJkIHByb3BlcnR5IGluIG9uZSBvZiB0aGUgaTJj
IGJ1cwo+IGRyaXZlcnMgaGVscHMgYXQgYWxsLiBIb3cgZG8geW91IGV4cGVjdCB0aGlzIHRvIHdv
cmsgd2hlbiB0aGVyZSBhcmUKPiBtdWx0aXBsZSBpMmMgY29udHJvbGxlcnMgaW4gdGhlIHN5c3Rl
bSB1c2luZyBkaWZmZXJlbnQgZHJpdmVycz8gV2hhdAo+IHNob3VsZCBoYXBwZW4gaWYgYm90aCBh
biBhbGlhcyBhbmQgdGhlIGJ1c25vIHByb3BlcnR5IGFyZSBzZXQ/Cj4gCgpXaGF0IGhhcHBlbnMg
d2hlbiB0d28gbm9kZXMgaGF2ZSB0aGUgc2FtZSBidXNubyBwcm9wZXJ0eSBiZWNhdXNlIGUuZy4K
b25lIGlzIGluIGEgZHRzaSBhbmQgdGhlIG90aGVyIG9uZSBpcyBpbiBhIGR0cz8KCgotLSAKQWxl
eGFuZHJlIEJlbGxvbmksIGNvLW93bmVyIGFuZCBDT08sIEJvb3RsaW4KRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
