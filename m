Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F725C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 22:12:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2319260F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 22:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2319260F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3VfxMUFWvlJ4t0QM6ux/vTOe4ikNdDUi9PEL+AX6b8=; b=pnNP61K2qDA+7smZmYUMTbiVjX
	1t8AmXSEnTdHdVAY7XY1OhN93JqCSmRNCPQ7ZqVeK6cb023cb4bcOinMnzFbA/X8WQXZdbxrigbEl
	BsJ3FElHRTz9upGri8X6LLlIY3AJ79ntDfWkBl/2YgmeRc0jDsgqpkv1cZS6pMuNmktGWa2SsAtwd
	Og5gqkWrnCMk2gCdFAi0jQkh1VcEM6QYqNuD/ZIGZVpyX1KAzYSCLgGPTFUhyyJ7F5Sz8e5JL7Ahe
	EC/o2ta4eg4Q3eCijhaZBJeVxqGHzpYqmyMMVvDy2jMj6df5Ud4kB+Gc6zTsYCP7qhBSHGk6lm+Lk
	aYw8rFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdgGa-009E7L-0J; Thu, 21 Oct 2021 22:10:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdgGW-009E70-3M
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 22:10:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0B3861073;
 Thu, 21 Oct 2021 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634854223;
 bh=GF0wSOnS41VXkjN2xtpwe653+QKWfXg2+En6IL+JZZ0=;
 h=Subject:To:List-Id:Cc:References:From:Date:In-Reply-To:From;
 b=camFxjdhgqdA39oLjPRUAcqoFKGtbzzqQhoO52fvtK+pNN7qGRfTlJLFheCGOZcKj
 y6m1Ej/6hCN/0lqTPc/Ls/DwyjQwAdDt2pJ+YLVmrn138/11glihXS/ILMmQpJ8/di
 ioe4g6Ve+Cnxl97t6dqdhY3WkGLwxeAXYq8TUpQXLqTT7g2seq8yJA5ZrciwJtSDD4
 LjgYiOs0IQ5fifV2Ovf68shhxa9G+kjgg25nEh8r/9xVD0PQWFWXDPMRYaf/WLjsnj
 rJm5xycoj3i3BBoS26P6H14QZGwxPRLFFDdxPEUpkjUUVewlcauZqLAoPNLrUE7Wiq
 tmLhkaPqRgpLQ==
Subject: Re: [PATCH v5 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
To: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pawe=c5=82_Anikiel?=
 <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 upstream@semihalf.com, Marcin Wojtas <mw@semihalf.com>,
 Konrad Adamczyk <ka@semihalf.com>, Jacek Majkowski <jam@semihalf.com>,
 Tomasz Nowicki <tn@semihalf.com>, Alexandru Stan <amstan@google.com>,
 Joanna Brozek <jbrozek@antmicro.com>,
 Mariusz Glebocki <mglebocki@antmicro.com>,
 Tomasz Gorochowik <tgorochowik@antmicro.com>,
 Maciej Mikunda <mmikunda@antmicro.com>
References: <20211021151736.2096926-1-pan@semihalf.com>
 <20211021151736.2096926-2-pan@semihalf.com>
 <CAK8P3a1i_23yBht0f86GoHUeef+XXPg_ahkMy6ndARHqcrhKWA@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <d5f80c87-9dde-fc83-8a2d-e5bb2149ef67@kernel.org>
Date: Thu, 21 Oct 2021 17:10:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1i_23yBht0f86GoHUeef+XXPg_ahkMy6ndARHqcrhKWA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_151024_187302_B09BFF66 
X-CRM114-Status: GOOD (  14.71  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211021221021.6QsTU3tATu3Kgu-dFbqKWfufMW-7ZaZk1TA7zP5lNJE@z>

CgpPbiAxMC8yMS8yMSAxMDozNCBBTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBUaHUsIE9j
dCAyMSwgMjAyMSBhdCA1OjE3IFBNIFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhhbGYuY29tPiB3
cm90ZToKPj4KPj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBNZXJjdXJ5KyBBQTEgbW9kdWxlIGZvciBB
cnJpYSAxMCBTb0MgRlBHQS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF3ZcWCIEFuaWtpZWwgPHBh
bkBzZW1paGFsZi5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvYW5uYSBCcm96ZWsgPGpicm96ZWtA
YW50bWljcm8uY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJpdXN6IEdsZWJvY2tpIDxtZ2xlYm9j
a2lAYW50bWljcm8uY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBUb21hc3ogR29yb2Nob3dpayA8dGdv
cm9jaG93aWtAYW50bWljcm8uY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNYWNpZWogTWlrdW5kYSA8
bW1pa3VuZGFAYW50bWljcm8uY29tPgo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHJlc3BpbiwgbG9v
a3MgZ29vZCB0byBtZSBub3cuCj4gCj4gUmV2aWV3ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4gCj4gRGluaCwgYXJlIHlvdSBwbGFubmluZyB0byBwaWNrIHRoaXMgdXAgaW50
byB5b3VyIHNvY2ZwZ2EgdHJlZSwgb3IKPiBzaG91bGQgSSBhcHBseSBpdCBkaXJlY3RseSB0byB0
aGUgc29jIHRyZWUgdGhpcyB0aW1lPwo+IAoKSWYgeW91IGRvbid0IG1pbmQsIHBsZWFzZSBhcHBs
eSBpdCBkaXJlY3RseSB0byB0aGUgc29jIHRyZWUuCgpUaGFua3MsCkRpbmgKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
