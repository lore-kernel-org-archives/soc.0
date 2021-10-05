Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BFFC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 16:22:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4886C61354
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 16:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4886C61354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ig2Kv7oLokDdWxpywJqfs/NBsPkQ9jW+MokSaCbfrI4=; b=dwX6Wx9mm0lc+6
	0xJl4lRn6W8VUXky5tCCaJv47RmUVtRqEA9Nvi9DXiPM3SS3CWaN/hF8SW6hF96EmbYwDGXMjdZc/
	px1AmO0Ax3sR/aLp0lJbeuKnZ7eFKzUti2yWClydD8gsVlWraegF8jZmpASs3mD7tBDbKgKQmarAa
	Gvrw+VkNa7VP1JEP5J0kim/4JsZYkCM+XyQb6Q0tfob1PujzBX84sC8pgRLEmjal8vLGuOcx7ezKZ
	uNO5eLnUw/GcbFXy6VqolaCiRZIZSl3sqw9nQQu5ZraztL/ZDMrVRPkMvbaQv/3TLxkZADk9pINQT
	zq8tFnJiysXuWdC5EtyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXnAo-00BGci-F8; Tue, 05 Oct 2021 16:20:10 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXnAl-00BGbm-H5
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 16:20:08 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="224564838"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="224564838"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 09:20:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="559379000"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 09:20:01 -0700
Received: from andy by smile with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mXnAb-008vgs-4v; Tue, 05 Oct 2021 19:19:57 +0300
Date: Tue, 5 Oct 2021 19:19:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
 robh+dt@kernel.org, p.zabel@pengutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, dinguyen@kernel.org, p.yadav@ti.com,
 Tudor.Ambarus@microchip.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
 sre@kernel.org, thunder.leizhen@huawei.com,
 Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ka@semihalf.com,
 tn@semihalf.com, jam@semihalf.com, amstan@google.com
Subject: Re: [PATCH v2 1/4] i2c: check bus number property in DesignWare I2C
 Controller
Message-ID: <YVx7LdKo1f1KBpqr@smile.fi.intel.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143748.2471647-2-pan@semihalf.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211005143748.2471647-2-pan@semihalf.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_092007_598599_90AE2F8D 
X-CRM114-Status: GOOD (  10.28  )
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
Message-ID: <20211005161957.T5wmze4erQwVaJ_Qz6HuYpG-tazZVAsCNsrUKO-yStE@z>

T24gVHVlLCBPY3QgMDUsIDIwMjEgYXQgMDQ6Mzc6NDVQTSArMDIwMCwgUGF3ZcWCIEFuaWtpZWwg
d3JvdGU6Cj4gT24gU29DRlBHQSBzeXN0ZW1zLCBpdCdzIGRlc2lyZWFibGUgdG8gaGF2ZSBmaXhl
ZCBudW1iZXJpbmcgZm9yCj4gaTJjIGJ1c3Nlcywgd2hpbGUgYmVpbmcgYWJsZSB0byBlbmFibGUv
ZGlzYWJsZSB0aGVtIChlLmcuIGhhdmUgaTJjMQo+IGJlIG1hcHBlZCB0byAvZGV2L2kyYy0xLCBl
dmVuIHRob3VnaCBpMmMwIGlzIGRpc2FibGVkKS4gVGhpcyBjYW4gYWxzbwo+IGJlIGFjaGlldmVk
IHVzaW5nIGRldmljZXRyZWUgYWxpYXNlcyAoc2VlIGkyY19hZGRfYWRhcHRlcikuIEhvd2V2ZXIs
Cj4gaGF2aW5nIHRoZSBkcml2ZXIgYmUgc2VsZi1jb250YWluZWQgd2l0aG91dCByZWx5aW5nIG9u
IGFsaWFzZXMgaXMgbW9yZQo+IHJvYnVzdC4KCldoeT8gVGhpcyBudW1iZXIgbWVhbnMgbm90aGlu
ZywgdXNlciBzcGFjZSBoYXMgYW5vdGhlciBtZWFucyB0byBoYXZlCnRoaXMgYmVpbmcgcm9idXN0
LiBTb3JyeSwgYnV0IEkgZG9uJ3Qgc2VlIGFueSBldmVuIGNsb3NlIHRvIGdvb2QgZW5vdWdoCmp1
c3RpZmljYXRpb24sIE5BSy4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtv
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFy
bS1rZXJuZWwK
