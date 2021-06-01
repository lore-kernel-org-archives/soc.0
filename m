Return-Path: <SRS0=hZ7m=K3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E027C47080
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 09:44:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17EF3601FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 09:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17EF3601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmotl2fQ+ckE9EgDOSC18iZtYIwNzPqKWigMhD2naXM=; b=JsTxHvmg4uBq/T
	E95jaV2AJIJf5eNBc/KaaPmM3hxazSqtarN1jXyrRt9ucKX1JLMA3F8aobNLmhoJLfVmPuRzCjL3P
	xldMLDY5NnBd2EEC34UIBpVDxsOlS+D+ZEXe0yKJSqD5a8XwCqyfltX1g4ZUp3iB9IepfjVjAsFRh
	cuLzt/eNWvodAdLs10dELUJ7DjwfNi6DxdrE6wOZwgdH0ivsPQRPEq6bcdtlm56WGNsNheeeTNBqd
	gagPBkfP46y/ZjIhFKLHzPSRpAq2IIR1651zERNAHxBNaNR7oQQT5VlCH9xTr79yzKbw8hQSAJ6AV
	Oh9Qy0S/QVh6hVUw04Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0vw-00Fhph-SV; Tue, 01 Jun 2021 09:43:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0vt-00Fhoz-FP; Tue, 01 Jun 2021 09:43:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7CCF601FF;
 Tue,  1 Jun 2021 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622540613;
 bh=qlJI01KJ0TTGsYoAHunzAq6G5S1oyHceEVrUWUNT/Rc=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=QMTmM+1Cv1EngwvVQDxzQeB4PTlN1b+zrjj0GcOuaOZ6plBGlDAJXCZOY4l92LAPf
 Q4hmySykGYZOUHeyiQVp5BUkLdeTLZeKh9hL+fUI9ZBTnsrPXYUCWLvD8n0Q0J18LZ
 Z/WR0AOfLwOVa+UWsmHV6k0hQ0g3AaaQEFtLwmyggNq5mAXAYQBravWKUlNj93MJry
 HgO0GHio//TaC1xi0n8t8NYSjjeatpMad0N1V5+6c1T+ZUg1LTEhf6+KuDEuogqXXk
 ilo9o5mhoVEy0vyeMZnfzBZboxiQRKFUhbqWftorW0cAd8IkEsLHH/lsgp6UlOOxPb
 CobY9rCXbAZag==
Message-ID: <e61ba6f5b906fd26a61e9c79ef4dcf4792a364d7.camel@kernel.org>
Subject: Re: [PATCH 2/6] watchdog: bcm2835_wdt: consider
 system-power-controller property
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,  Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Date: Tue, 01 Jun 2021 11:43:27 +0200
In-Reply-To: <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_024333_556688_758C4CE8 
X-CRM114-Status: GOOD (  18.39  )
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
Message-ID: <20210601094327.yW5uukjt1SSIboWlWgRKk0PrleAWzfGudPQZGElzZxI@z>

T24gU3VuLCAyMDIxLTA1LTMwIGF0IDExOjI2ICswMjAwLCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+
IFVudGlsIG5vdyBhbGwgUmFzcGJlcnJ5IFBpIGJvYXJkcyB1c2VkIHRoZSBwb3dlciBvZmYgZnVu
Y3Rpb24gb2YgdGhlIFNvQy4KPiBCdXQgdGhlIFJhc3BiZXJyeSBQaSA0MDAgdXNlcyBncGlvLXBv
d2Vyb2ZmIGZvciB0aGUgd2hvbGUgYm9hcmQgd2hpY2gKPiBwb3NzaWJseSBjYW5ub3QgcmVnaXN0
ZXIgdGhlIHBvd2Vyb2ZmIGhhbmRsZXIgYmVjYXVzZSB0aGUgaXQncwo+IGFscmVhZHkgcmVnaXN0
ZXJlZCBieSB0aGlzIHdhdGNoZG9nIGRyaXZlci4gU28gY29uc2lkZXIgdGhlCj4gc3lzdGVtLXBv
d2VyLWNvbnRyb2xsZXIgcHJvcGVydHkgZm9yIHJlZ2lzdGVyaW5nLCB3aGljaCBpcyBhbHJlYWR5
Cj4gZGVmaW5lZCBpbiBzb2MvYmNtL2JyY20sYmNtMjgzNS1wbS50eHQgLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbiBXYWhyZW4gPHN0ZWZhbi53YWhyZW5AaTJzZS5jb20+Cj4gLS0tCj4gwqBk
cml2ZXJzL3dhdGNoZG9nL2JjbTI4MzVfd2R0LmMgfCAxMCArKysrKysrLS0tCj4gwqAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3dhdGNoZG9nL2JjbTI4MzVfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL2JjbTI4
MzVfd2R0LmMKPiBpbmRleCBkZWM2Y2EwLi45NDkwNzE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
d2F0Y2hkb2cvYmNtMjgzNV93ZHQuYwo+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvYmNtMjgzNV93
ZHQuYwo+IEBAIC0yMDUsOSArMjA1LDEzIEBAIHN0YXRpYyBpbnQgYmNtMjgzNV93ZHRfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiDCoAlpZiAoZXJyKQo+IMKgCQlyZXR1cm4g
ZXJyOwo+IMKgCj4gCj4gLQlpZiAocG1fcG93ZXJfb2ZmID09IE5VTEwpIHsKPiAtCQlwbV9wb3dl
cl9vZmYgPSBiY20yODM1X3Bvd2VyX29mZjsKPiAtCQliY20yODM1X3Bvd2VyX29mZl93ZHQgPSB3
ZHQ7Cj4gKwlpZiAob2ZfZGV2aWNlX2lzX3N5c3RlbV9wb3dlcl9jb250cm9sbGVyKHBkZXYtPmRl
di5wYXJlbnQtPm9mX25vZGUpKSB7Cj4gKwkJaWYgKCFwbV9wb3dlcl9vZmYpIHsKPiArCQkJcG1f
cG93ZXJfb2ZmID0gYmNtMjgzNV9wb3dlcl9vZmY7Cj4gKwkJCWJjbTI4MzVfcG93ZXJfb2ZmX3dk
dCA9IHdkdDsKPiArCQl9IGVsc2Ugewo+ICsJCQlkZXZfaW5mbyhkZXYsICJQb3dlcm9mZiBoYW5k
bGVyIGFscmVhZHkgcHJlc2VudCFcbiIpOwoKbml0OiBzaG91ZGxuJ3QgdGhpcyBiZSBhIHdhcm5p
bmc/CgpPdGhlciB0aGFuIHRoYXQsCgpSZXZpZXdlZC1ieTogTmljb2xhcyBTYWVueiBKdWxpZW5u
ZSA8bnNhZW56QGtlcm5lbC5vcmc+CgpSZWdhcmRzLApOaWNvbGFzCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
