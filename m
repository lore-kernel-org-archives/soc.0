Return-Path: <SRS0=GOBS=O2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F466C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 08:31:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F2F3610FB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Oct 2021 08:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F2F3610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjqPXuFQc1K02PUpRWF93g0LAxvV35iyrYivKT5m1+s=; b=0sfIlHuuWUeHhg
	rQWDc6aecU0QKJvrv+jZiXkJEV0e33hVz+LjESbSqRQ9JlGdgrMfPi7b8lSITqfOOEdhC6brkl0KL
	ewl41uHbTe5CfTe3Uvu9QVkhHkd5WZk6TmTn4IhGSImRtU5s/jn4z1i2lWLatqZEpSd1MGdLAJYDv
	QhBg6zSm+wqKkB3CThqkv76cTUApgp1KvX6i65qF70583Jeu0wQdzHrNQvvYCec+/iKvZaslemcJv
	MRjr3IY0GLrw8DlcmECIgmekAluaM1byml06eeyDCdn6kcxh7JTtzqrIHfp7H0ctPoa06B6WwvK5o
	fBd3qo/LAaEPfmsAJUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY2Ii-00DTHP-Pj; Wed, 06 Oct 2021 08:29:20 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY2Ie-00DTGg-PR
 for linux-arm-kernel@lists.infradead.org; Wed, 06 Oct 2021 08:29:18 +0000
Received: by mail-lf1-x132.google.com with SMTP id i4so7171914lfv.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 06 Oct 2021 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cs32oKjPY880HhRcpboK0pON5dPQmpZCrv3AmYoudi4=;
 b=Y7jduTBLBpq47YNLGK+8Fs1peBjDqtnqaIvJ71rnYHl2LKlBGz14YVXsbSX59h/7Y1
 Mpy86aVzDlMC7vyhQDY0ggy1MsBXlPo/Ri//HkNUdIFfOGLV40yK1Trpb03j940CkDcv
 aAi/bqPh8x4BcyfK9LhFAKp78v/GNsJe/AjNjzTLXl5ez3JblOovjZ2YaxpfDaASzd7K
 kimrxEauFPfupzQ6Nknzw562FDT0tk6D8TVLUU5SA23Moj0PXlw0yo3uP2eWMEzUUkHm
 GFjDlEiJHZj48oW2v7cLjvTKto/78fzY5Td0AE8ohTmVRtoxxTZux0z8S0solecVTL/f
 UYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cs32oKjPY880HhRcpboK0pON5dPQmpZCrv3AmYoudi4=;
 b=26tH3bSQQgGVoupB8wckogfUJlBN2yVyxQasw2kSHfebMhQSLMg6jjdOBAKiXdzVgT
 gUbJzLkiL8rXhm5ApbG38zRVOsH6lVaYK+0VHHtwCyDRkAgxXT96JgKeR4k8j2keG4J1
 L/l+rm98e+/P5Ynxq/NGiXjAXwgmKCrizADhKrLGtbujQwYOBbph3ZWQ+bKFrcTF0+5q
 tRdwXa0WUTt7tlgpRoFp9UZczKxHAEs9u0lxzbmJU5WbBc8i6z1BvRvGVpGJViemlLi2
 YDjy4mKWO8wPniOkh4qz9ILMNLUxm4/XKQeSJUV96DNa+w2BIsi8CPOT3haaAHfTZqFm
 A4fw==
X-Gm-Message-State: AOAM533S8y8BxFkY5Ml+h+zjUebiy+R2p5cCLdAGwjSIwUgNuYP8AImf
 4ILFiGJPzRyN7Ct52o1/id4HWRPcvtCfn+G3lTueNw==
X-Google-Smtp-Source: ABdhPJwgbKRqUWndz/R/ob0yYOvX+zmWUkoW3ELAssaKrTJCToZ4rmrps0L8dLDx2abTjB7pRmhWDo7HUxDlivZuBuU=
X-Received: by 2002:a05:6512:21cb:: with SMTP id
 d11mr8276307lft.579.1633508954553; 
 Wed, 06 Oct 2021 01:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
 <YVx9IMk7cJSCK79/@piout.net>
In-Reply-To: <YVx9IMk7cJSCK79/@piout.net>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Wed, 6 Oct 2021 11:29:03 +0200
Message-ID: <CAF9_jYT7_9Oz-HFSy5z7uiieoHtujUD_En9MTi68PxGb7gxphw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, jarkko.nikula@linux.intel.com, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>, 
 "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Konrad Adamczyk <ka@semihalf.com>, 
 Tomasz Nowicki <tn@semihalf.com>, Jacek Majkowski <jam@semihalf.com>,
 Alexandru Stan <amstan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_012916_849720_B2AFDE53 
X-CRM114-Status: GOOD (  20.55  )
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
Message-ID: <20211006092903.A-w9OTOPZGWXPAJIqh-5D8g9oKE98CQ5F_LqTxvtFXQ@z>

T24gVHVlLCBPY3QgNSwgMjAyMSBhdCA2OjI4IFBNIEFsZXhhbmRyZSBCZWxsb25pCjxhbGV4YW5k
cmUuYmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAwNS8xMC8yMDIxIDE4OjIyOjEy
KzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCA1LCAyMDIxIGF0IDQ6
MzcgUE0gUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBTb0NGUEdBIHN5c3RlbXMsIGl0J3MgZGVzaXJlYWJsZSB0byBoYXZlIGZpeGVkIG51bWJl
cmluZyBmb3IKPiA+ID4gaTJjIGJ1c3Nlcywgd2hpbGUgYmVpbmcgYWJsZSB0byBlbmFibGUvZGlz
YWJsZSB0aGVtIChlLmcuIGhhdmUgaTJjMQo+ID4gPiBiZSBtYXBwZWQgdG8gL2Rldi9pMmMtMSwg
ZXZlbiB0aG91Z2ggaTJjMCBpcyBkaXNhYmxlZCkuIFRoaXMgY2FuIGFsc28KPiA+ID4gYmUgYWNo
aWV2ZWQgdXNpbmcgZGV2aWNldHJlZSBhbGlhc2VzIChzZWUgaTJjX2FkZF9hZGFwdGVyKS4gSG93
ZXZlciwKPiA+ID4gaGF2aW5nIHRoZSBkcml2ZXIgYmUgc2VsZi1jb250YWluZWQgd2l0aG91dCBy
ZWx5aW5nIG9uIGFsaWFzZXMgaXMgbW9yZQo+ID4gPiByb2J1c3QuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFBhd2XFgiBBbmlraWVsIDxwYW5Ac2VtaWhhbGYuY29tPgo+ID4KPiA+IEkgZG9u
J3Qgc2VlIGhvdyBhZGRpbmcgYSBub25zdGFuZGFyZCBwcm9wZXJ0eSBpbiBvbmUgb2YgdGhlIGky
YyBidXMKPiA+IGRyaXZlcnMgaGVscHMgYXQgYWxsLiBIb3cgZG8geW91IGV4cGVjdCB0aGlzIHRv
IHdvcmsgd2hlbiB0aGVyZSBhcmUKPiA+IG11bHRpcGxlIGkyYyBjb250cm9sbGVycyBpbiB0aGUg
c3lzdGVtIHVzaW5nIGRpZmZlcmVudCBkcml2ZXJzPyBXaGF0Cj4gPiBzaG91bGQgaGFwcGVuIGlm
IGJvdGggYW4gYWxpYXMgYW5kIHRoZSBidXNubyBwcm9wZXJ0eSBhcmUgc2V0Pwo+ID4KPgo+IFdo
YXQgaGFwcGVucyB3aGVuIHR3byBub2RlcyBoYXZlIHRoZSBzYW1lIGJ1c25vIHByb3BlcnR5IGJl
Y2F1c2UgZS5nLgo+IG9uZSBpcyBpbiBhIGR0c2kgYW5kIHRoZSBvdGhlciBvbmUgaXMgaW4gYSBk
dHM/Cj4KCklmIGJ1c25vIGlzIHNldCwgdGhlIGFsaWFzIGlzIGlnbm9yZWQgKHRoZSBjb2RlIHRo
YXQgY2hlY2tzIGFsaWFzZXMKaXMgbmV2ZXIgcmVhY2hlZCkuIElmIHR3byBub2RlcyBoYXZlIHRo
ZSBzYW1lIGJ1c25vIHByb3BlcnR5LCB3ZSBnZXQKYSBXQVJOIGluIGRyaXZlcnMvaTJjL2kyYy1j
b3JlLWJhc2UuYzoxNjM3LCBhbmQgb25seSBvbiBvZiB0aGVtCmdldHMgYXR0YWNoZWQuCgpXaGF0
IGlzIGEgYmV0dGVyIHdheSBvZiBkb2luZyB0aGlzIHRoZW4/IElzIGFkZGluZyBhbGlhc2VzIHRv
IHRoZQpkZXZpY2V0cmVlIGxpa2UgdGhpcyBva2F5PwoKYWxpYXNlcyB7Ci4uLgppMmMwID0gJmky
YzA7CmkyYzEgPSAmaTJjMTsKfTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
