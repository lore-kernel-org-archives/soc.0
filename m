Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDCFC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 16:24:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED65F61372
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED65F61372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IKA4B53ealIlOWT8/KV+eK3G/nqK55rh9XiBepirZQ=; b=QJ4ajt3wHgIYHZ
	bsofJTNz5tceh09Xw7PfCE5JdC15ZYJtvIGW8gQUBWEHdCaxp0YLdcumTrVx9ag4tZqw13+qbdPCS
	QPNXlch9TmmNyzHlNduKSM+3lkc6HFvaCPyUEBJNXxhIn2SjCUYLK1cfxUzs/21rsRI5LYXvet1/X
	uUb0HtmMMyO7q1NYeBMeKIDVPJlSfr6jO+XtZFAd/dnvUZElvcWmpXNg7gJPJNVSGbozOTad7UhZh
	DyGyvAMlU+MK+uxOIX4p6ZZAqMmR4JLawr/6ydWmdCxTGCcFtvAeK8vJ+FYNFuHsYhU7HfMi2gIKA
	A+WT3zVxPgvticLLMKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXnD9-00BGv3-Qi; Tue, 05 Oct 2021 16:22:36 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXnD6-00BGuJ-2y
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 16:22:33 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MUY5o-1mOtF720Qa-00QTKw for <linux-arm-kernel@lists.infradead.org>; Tue, 05
 Oct 2021 18:22:29 +0200
Received: by mail-wr1-f46.google.com with SMTP id m22so32934818wrb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 05 Oct 2021 09:22:28 -0700 (PDT)
X-Gm-Message-State: AOAM532uszWCuXRWJuyJAgRQepF+j8fykubtyBLNMYXT87HBM6UjokZ+
 WXYOOCggzEU1DjlHXK2IIfXPVVSVbDvzQfo7w6o=
X-Google-Smtp-Source: ABdhPJyKDaaY9N196wCOwS/aWHGILrM0TAfc16cprPxSzk6zz0pLue1dKsba6g/4ViVzYX6me24gdE9gUYPGJrVBfqA=
X-Received: by 2002:adf:f481:: with SMTP id l1mr22496230wro.411.1633450948179; 
 Tue, 05 Oct 2021 09:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143748.2471647-3-pan@semihalf.com>
In-Reply-To: <20211005143748.2471647-3-pan@semihalf.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 Oct 2021 18:22:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
Message-ID: <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: jarkko.nikula@linux.intel.com, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, 
 SoC Team <soc@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, 
 "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, ka@semihalf.com, 
 Tomasz Nowicki <tn@semihalf.com>, jam@semihalf.com, amstan@google.com
X-Provags-ID: V03:K1:sz+ewTu8QRVN4oWuY0JUG2XCtxNUz7m4HWWqceu1LtrwNvyBDAy
 C7TERkfrD7GdyoojTlb3eGoDoIsuR3AE1oq8W+FRNqA0GXtYht1t2jo/BAv91a8SkqkSEEg
 SR0fiAoucr7p3GOe2i01Mjxrs5qfRF1iE0q7PiOkThfvc/40h1bh/OaK8e6HC8f60QKZ9CO
 kLKdxY2kk+KJ6TaIHpdwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B10PGnu86WA=:I9T+U8gGhVXIPksIabbEbK
 jUYBQjnXoPbCKl7GwiB1YNp2NFbHED/1K6gOa+zXZii0oFAjAuGCXjnmKWISCYwDTlJaFgfBh
 gAuXuTI2cWG+l2CsjWoTFs033IT5cqe9XMwLNwOQfD1gcWTLrcXleKkmKQe/WWY6kO1RwLl7V
 QvULLBTDMZ9BTgdCs3h3/q8xDsjYBWwK6fMef7voAe/qHl1Mddia+5s+6OhG3IEsdAsETDvjP
 m1nrnD9pnJqCdHp754CT424201VpQ2aF28C3W+g4CSlV7L1HAlUlCeQZB1URblYgFL7SvrsuO
 Xlu36WPwJWl/QJrvYJgfVsz10epIUOdP+FdM5efZCjazbniRUUcFOTjWAUepCSkYkuf8LrZDl
 /KlYS1L9O39QxGBylH96EhKMSN5l9PtHMFv6Wt5lTqvJQdtfGbFfTZk5dSYFms5kOwUqXPzCC
 zOGuluv6ISiXa0EGn8om/0iN3EBLPUZ0p9MXi/2xpvCtpVtt5gpVOmtzwQ+FG8hO233+vT5Re
 AY4uQ1GiMjRt68m0IrEHdKU1R5DHxkrnhwYA1wbz2ZP3WndG1QP7dxval27dwSayn7yVSqzZL
 qJQIp2sBCjINMWj/o/KxPUjvoy1mcRSrSHnLgHo0bJy28Gaw/lWsGNpO97cqWxOCmy7i80lBi
 6EXNHMLikXBqB65VPBTMx8yYc6CGOIeLOsBe8zsyBCKSUJaOCNwKBaJXk0iYUaNNwW+T7OOgn
 yFQLbSDvn1xZ+sZ91D8bMJLbgEnVoI+NQMRfdw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_092232_447575_63E7D55B 
X-CRM114-Status: GOOD (  14.84  )
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
Message-ID: <20211005162212.TBayj1cRWFPMW12JtO9UGqTBB0s8Z9dPi6yMlWIFDu4@z>

T24gVHVlLCBPY3QgNSwgMjAyMSBhdCA0OjM3IFBNIFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhh
bGYuY29tPiB3cm90ZToKPgo+IE9uIFNvQ0ZQR0Egc3lzdGVtcywgaXQncyBkZXNpcmVhYmxlIHRv
IGhhdmUgZml4ZWQgbnVtYmVyaW5nIGZvcgo+IGkyYyBidXNzZXMsIHdoaWxlIGJlaW5nIGFibGUg
dG8gZW5hYmxlL2Rpc2FibGUgdGhlbSAoZS5nLiBoYXZlIGkyYzEKPiBiZSBtYXBwZWQgdG8gL2Rl
di9pMmMtMSwgZXZlbiB0aG91Z2ggaTJjMCBpcyBkaXNhYmxlZCkuIFRoaXMgY2FuIGFsc28KPiBi
ZSBhY2hpZXZlZCB1c2luZyBkZXZpY2V0cmVlIGFsaWFzZXMgKHNlZSBpMmNfYWRkX2FkYXB0ZXIp
LiBIb3dldmVyLAo+IGhhdmluZyB0aGUgZHJpdmVyIGJlIHNlbGYtY29udGFpbmVkIHdpdGhvdXQg
cmVseWluZyBvbiBhbGlhc2VzIGlzIG1vcmUKPiByb2J1c3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQ
YXdlxYIgQW5pa2llbCA8cGFuQHNlbWloYWxmLmNvbT4KCkkgZG9uJ3Qgc2VlIGhvdyBhZGRpbmcg
YSBub25zdGFuZGFyZCBwcm9wZXJ0eSBpbiBvbmUgb2YgdGhlIGkyYyBidXMKZHJpdmVycyBoZWxw
cyBhdCBhbGwuIEhvdyBkbyB5b3UgZXhwZWN0IHRoaXMgdG8gd29yayB3aGVuIHRoZXJlIGFyZQpt
dWx0aXBsZSBpMmMgY29udHJvbGxlcnMgaW4gdGhlIHN5c3RlbSB1c2luZyBkaWZmZXJlbnQgZHJp
dmVycz8gV2hhdApzaG91bGQgaGFwcGVuIGlmIGJvdGggYW4gYWxpYXMgYW5kIHRoZSBidXNubyBw
cm9wZXJ0eSBhcmUgc2V0PwoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
