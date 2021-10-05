Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C3AC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 10:14:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA046113A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 10:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABA046113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkaW45VoyCpbPp3FUSg1qqFmqWtZuDp7iERc21UR2Lo=; b=JuQNQO3TLD0OYc
	Y/esP828DiPV2KNWooEgH6LvH+QON1WFxNigkDCVNAb5PzTyjCUrFxqoChF5mvMnx8AyrEEVtolZ7
	UWmi2g7JSKs5jmSiivY4CCi8FB/JJE6d5ijm/5RZo8RzEwtgVRndvdorNtnOSRJT0pPyAZcLbyWVh
	PLRH0c1s03EPW10c7guvswaLH1ELMqwutdC8yFUUE6NUANgt71YYxEfzNtBkxsryj50g7G6nB2BnJ
	W1Gtg5PBgOe2QC9hmq8t86BsdKCCrTktYMahpSTc6KtIyQyejgQN4OLXwuxp6yX+kZ/DsCthWGMuW
	kH4Fbnt9y5saDdyo7XNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXhR5-009wgx-JV; Tue, 05 Oct 2021 10:12:35 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXhQp-009wcx-Fw
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 10:12:21 +0000
Received: by mail-lf1-x129.google.com with SMTP id u18so84136762lfd.12
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 05 Oct 2021 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fd2bVG3T2aDLLsUGg65DNy9VZxuxLh/QslDXMizwJK8=;
 b=Ez5mYoeEnxP72wgv6au1eWbZZvt7siRLWpI9GsKBKBLepayHvuXHhoBFqZfseuORyY
 h1HA3jABRlKS8tuWaG2UUN4XzRb4Jizd3n+k9ryDkBNUpWyPDxOui77+S9ZqKc3aD0eI
 IhRttz3xOc3IW3LwIjPPFZxivXeffhFA5txSbttH+iOS9g7NO3HrB8pvutVsiiQaPsIG
 1ySZ3kqO9o7Bd1T6MoTMLAQEKlN8iKHV+m5My4Owt13LGlpQFTv1OWpU6AdxUVVKm/bP
 7UXovG3irUPeGNxrJ6iwxCqh0qKa2utVcRhWtScOoJ2MkJj+6XNlVCKFmGij7agmbAVh
 KBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fd2bVG3T2aDLLsUGg65DNy9VZxuxLh/QslDXMizwJK8=;
 b=UpatOuK3egExYBzs160slHWJBR8YKVUJ+H3yU4DvAK9P53jutaVF54ILIuDWciO+wj
 KEGuTRUcIEX4luIOJxupQXxKs7jyL2Mzz4L3G9c/pp1sCOCQaVsFRBJRMzbJnHX/6iiO
 RzyFTRtcqfUjwXCerRk2nKVIakYswhnwlPmcHpEQI8c6CdhgUv7snTUmFFu2R6BoC6WE
 Zz/7+WFlDc73jwq48A8FrkEFGbZZdTPjsP86qk/csbZtniYE2F3ejdpTuRTX0e6yYwMA
 bgeHLjQMbUynZdquy9mz0JSsSVC0jlfs/+0wtt89aMIja4S3fBkJI0IYaKjwTUEwyGdV
 9tHA==
X-Gm-Message-State: AOAM533PhYaxOK3peA39jTQ4zx/VZOt1sXJ7M/3KfgS1kn4IRdXQspIF
 KfP1Miri9lIYtbsbSqKz8IJ+rmWGucnnVTIFVpibIA==
X-Google-Smtp-Source: ABdhPJweYgnhJ9wfwnhC1naOEgjt465iKJfu5aOyclroBOPqShbw0RGuw1NZisfc1hj6jMsbtIvWVkehVRtpOKozveQ=
X-Received: by 2002:a2e:b8cd:: with SMTP id s13mr21300509ljp.44.1633428736539; 
 Tue, 05 Oct 2021 03:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210920124141.1166544-1-pan@semihalf.com>
 <20210920124141.1166544-4-pan@semihalf.com>
 <ce254cc123f2809976c2f2404941a9074c458309.camel@pengutronix.de>
In-Reply-To: <ce254cc123f2809976c2f2404941a9074c458309.camel@pengutronix.de>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Tue, 5 Oct 2021 13:12:05 +0200
Message-ID: <CAF9_jYQVpG8imn3zjAGKeZqZqDPtWRYWLQjNSXi2SXjjzAKvfA@mail.gmail.com>
Subject: Re: [PATCH 3/3] reset: socfpga: add empty driver allowing consumers
 to probe
List-Id: <soc.lore.kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, miquel.raynal@bootlin.com,
 richard@nod.at, 
 vigneshr@ti.com, robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, 
 soc@kernel.org, dinguyen@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomasz Nowicki <tn@semihalf.com>, Konrad Adamczyk <ka@semihalf.com>,
 Jacek Majkowski <jam@semihalf.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_031219_544213_43DE9E09 
X-CRM114-Status: GOOD (  33.16  )
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
Message-ID: <20211005111205.yhacoo2AdAdnUkQ86NaPU0ASEexP3rjoqfZSlZF-dlI@z>

T24gVHVlLCBPY3QgNSwgMjAyMSBhdCAxMTozNCBBTSBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhpIFBhd2XFgiwKPgo+IE9uIE1vbiwgMjAyMS0wOS0y
MCBhdCAxNDo0MSArMDIwMCwgUGF3ZcWCIEFuaWtpZWwgd3JvdGU6Cj4gPiBUaGUgZWFybHkgcmVz
ZXQgZHJpdmVyIGRvZXNuJ3QgZXZlciBwcm9iZSwgd2hpY2ggY2F1c2VzIGNvbnN1bWluZwo+ID4g
ZGV2aWNlcyB0byBiZSB1bmFibGUgdG8gcHJvYmUuIEFkZCBhbiBlbXB0eSBkcml2ZXIgdG8gc2V0
IHRoaXMgZGV2aWNlCj4gPiBhcyBhdmFpbGFibGUsIGFsbG93aW5nIGNvbnN1bWVycyB0byBwcm9i
ZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgQW5pa2llbCA8cGFuQHNlbWloYWxmLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcmVzZXQvcmVzZXQtc29jZnBnYS5jIHwgMjYgKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygr
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYyBiL2Ry
aXZlcnMvcmVzZXQvcmVzZXQtc29jZnBnYS5jCj4gPiBpbmRleCAyYTcyZjg2MWY3OTguLjhjNjQ5
MmU1NjkzYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtc29jZnBnYS5jCj4g
PiArKysgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYwo+ID4gQEAgLTkyLDMgKzkyLDI5
IEBAIHZvaWQgX19pbml0IHNvY2ZwZ2FfcmVzZXRfaW5pdCh2b2lkKQo+ID4gICAgICAgZm9yX2Vh
Y2hfbWF0Y2hpbmdfbm9kZShucCwgc29jZnBnYV9lYXJseV9yZXNldF9kdF9pZHMpCj4gPiAgICAg
ICAgICAgICAgIGExMF9yZXNldF9pbml0KG5wKTsKPiA+ICB9Cj4gPiArCj4gPiArLyoKPiA+ICsg
KiBUaGUgZWFybHkgZHJpdmVyIGlzIHByb2JsZW1hdGljLCBiZWNhdXNlIGl0IGRvZXNuJ3QgcmVn
aXN0ZXIKPiA+ICsgKiBpdHNlbGYgYXMgYSBkcml2ZXIuIFRoaXMgY2F1c2VzIGNlcnRhaW4gZGV2
aWNlIGxpbmtzIHRvIHByZXZlbnQKPiA+ICsgKiBjb25zdW1lciBkZXZpY2VzIGZyb20gcHJvYmlu
Zy4gVGhlIGhhY2t5IHNvbHV0aW9uIGlzIHRvIHJlZ2lzdGVyCj4gPiArICogYW4gZW1wdHkgZHJp
dmVyLCB3aG9zZSBvbmx5IGpvYiBpcyB0byBhdHRhY2ggaXRzZWxmIHRvIHRoZSByZXNldAo+ID4g
KyAqIG1hbmFnZXIgYW5kIGNhbGwgcHJvYmUuCj4gPiArICovCj4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgc29jZnBnYV9yZXNldF9kdF9pZHNbXSA9IHsKPiA+ICsgICAgIHsg
LmNvbXBhdGlibGUgPSAiYWx0cixyc3QtbWdyIiwgfSwKPiA+ICsgICAgIHsgLyogc2VudGluZWwg
Ki8gfSwKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgcmVzZXRfc2ltcGxlX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIDA7Cj4g
PiArfQo+ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJlc2V0X3NvY2Zw
Z2FfZHJpdmVyID0gewo+ID4gKyAgICAgLnByb2JlICA9IHJlc2V0X3NpbXBsZV9wcm9iZSwKPiA+
ICsgICAgIC5kcml2ZXIgPSB7Cj4gPiArICAgICAgICAgICAgIC5uYW1lICAgICAgICAgICA9ICJz
b2NmcGdhLXJlc2V0IiwKPiA+ICsgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gc29jZnBn
YV9yZXNldF9kdF9pZHMsCj4gPiArICAgICB9LAo+ID4gK307Cj4gPiArYnVpbHRpbl9wbGF0Zm9y
bV9kcml2ZXIocmVzZXRfc29jZnBnYV9kcml2ZXIpOwo+Cj4gSWYgd2UgY2FuIGp1c3QgbGV0IGRl
dmxpbmsgZGVsYXkgYWxsIGNvbnN1bWVycyB1bnRpbCB0aGUgZW1wdHkgZHJpdmVyIGlzCj4gcHJv
YmVkLCBkb2VzIHRoZSByZXNldCBjb250cm9sbGVyIGhhdmUgdG8gYmUgcmVnaXN0ZXJlZCBlYXJs
eSBhdCBhbGw/Cj4KPiByZWdhcmRzCj4gUGhpbGlwcAoKSSBhc2tlZCBEaW5oIGlmIHRoZSByZXNl
dCBjb250cm9sbGVyIGNvZGUgbmVlZHMgdG8gYmUgY2FsbGVkIGVhcmx5OgoKPlRoYXQncyBjb3Jy
ZWN0LiBJdCdzIGZvciBvbmUgb2YgdGhlIFNQIHRpbWVycy4KPgo+T24gOS8xNi8yMSA2OjEzIEFN
LCBQYXdlxYIgQW5pa2llbCB3cm90ZToKPj4gSGksCj4+Cj4+IEkgd291bGQgbGlrZSB0byBhc2sg
eW91IGFib3V0IHRoZSBmb2xsb3dpbmcgY29tbWl0Ogo+Pj4gY29tbWl0IGIzY2E5ODg4ZjM1ZmE2
OTE5NTY5Y2YyN2M5MjlkYzBhYzQ5ZTk3MTYKPj4+IEF1dGhvcjogRGluaCBOZ3V5ZW4gPGRpbmd1
eWVuQGtlcm5lbC5vcmc+Cj4+PiBEYXRlOiAgIFR1ZSBOb3YgMTMgMTI6NTA6NDggMjAxOCAtMDYw
MAo+Pj4KPj4+ICAgICAgcmVzZXQ6IHNvY2ZwZ2E6IGFkZCBhbiBlYXJseSByZXNldCBkcml2ZXIg
Zm9yIFNvQ0ZQR0EKPj4+Cj4+PiAgICAgIENyZWF0ZSBhIHNlcGFyYXRlIHJlc2V0IGRyaXZlciB0
aGF0IHVzZXMgdGhlIHJlc2V0IG9wZXJhdGlvbnMgaW4KPj4+ICAgICAgcmVzZXQtc2ltcGxlLiBU
aGUgcmVzZXQgZHJpdmVyIGZvciB0aGUgU29DRlBHQSBwbGF0Zm9ybSBuZWVkcyB0bwo+Pj4gICAg
ICByZWdpc3RlciBlYXJseSBpbiBvcmRlciB0byBiZSBhYmxlIGJyaW5nIG9ubGluZSB0aW1lcnMg
dGhhdCBuZWVkZWQKPj4+ICAgICAgZWFybHkgaW4gdGhlIGtlcm5lbCBib290dXAuCj4+PiAgICAg
IFsuLi5dCj4+IFdoaWNoIG9ubGluZSB0aW1lcnMgaXMgdGhpcyBjb21taXQgbWVzc2FnZSByZWZl
cnJpbmcgdG8/IEkgY291bGRuJ3QgZmluZAo+PiBhbnkgaW5mb3JtYXRpb24gYWJvdXQgdGhpcy4g
V2l0aG91dCB0aGlzIHBhdGNoIHRoZSBrZXJuZWwgc2VlbXMgdG8gd29yawo+PiBmaW5lIG9uIGFu
IEFycmlhIDEwICh3aXRoIE1lcmN1cnkgQUExIG1vZHVsZSkuIFdoYXQncyB0aGUgZXhhY3QgcmVh
c29uCj4+IGEgcmVndWxhciBwbGF0Zm9ybSBkcml2ZXIgaXNuJ3Qgc3VmZmljaWVudD8KPj4KPj4g
QmVzdCByZWdhcmRzLAo+PiBQYXdlxYIKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
