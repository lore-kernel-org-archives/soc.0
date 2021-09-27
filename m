Return-Path: <SRS0=MvIc=OR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42D4C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 14:56:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ECCF60F24
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 14:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7ECCF60F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zonque.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W9JXM/s7x+N89HaHiKs2GJJJTDXIA2vQ7DJ67eL1Qd0=; b=M9Se1H/ubIEObfFhx1pTpeB4bx
	CQfKBI8uSi0egkMoMIqXksSaTSDzn5vyzsywKrpgsR8TkZ0+kjnfBvtDl4IJSxWzQjicvRY88CeQw
	OsLlH4p/wZlcMXYF1GGie18YHu9BsZVj4ScNE8BJbjG9LRPDJ+mNl2D9ucl/tTRrpPFxyTyhP4qER
	oMGs55NEXLRwSUbuIuFKa/Tw6Pws/wCwgKnVk1Pf+J7Vt74ndx6ICEloUVGFn2HqsgbOg8/Hw7FmV
	hRsGFmWaY95YE31DawRVduvDOYJ5nmpdpdYSDn5iuus0gejw/hvk0FmsnZjviktOF/uihhMgkTjWp
	/Lc1RiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUs2M-002yQt-U9; Mon, 27 Sep 2021 14:55:23 +0000
Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUs2I-002yPZ-Gc
 for linux-arm-kernel@lists.infradead.org; Mon, 27 Sep 2021 14:55:20 +0000
Received: from [192.168.178.130] (p57bc9b61.dip0.t-ipconnect.de
 [87.188.155.97])
 by mail.bugwerft.de (Postfix) with ESMTPSA id A78D13AF4C9;
 Mon, 27 Sep 2021 14:55:13 +0000 (UTC)
Subject: Re: [PATCH] [RESEND] ARM: sharpsl_param: work around
 -Wstringop-overread warning
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210927145332.2784005-1-arnd@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <413f2684-f818-4d0b-bf7c-142f55b3737f@zonque.org>
Date: Mon, 27 Sep 2021 16:55:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927145332.2784005-1-arnd@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_075518_742473_E2C69F2F 
X-CRM114-Status: GOOD (  22.88  )
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

T24gOS8yNy8yMSA0OjUzIFBNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IEZyb206IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gZ2NjIHdhcm5zIHRoYXQgYWNjZXNzaW5nIGEgcG9p
bnRlciBiYXNlZCBvbiBhIG51bWVyaWMgY29uc3RhbnQgbWF5Cj4gYmUgYW4gb2Zmc2V0IGludG8g
YSBOVUxMIHBvaW50ZXIsIGFuZCB3b3VsZCB0aGVyZWZvcmUgaGFzIHplcm8KPiBhY2Nlc3NpYmxl
IGJ5dGVzOgo+IAo+IGFyY2gvYXJtL2NvbW1vbi9zaGFycHNsX3BhcmFtLmM6IEluIGZ1bmN0aW9u
IOKAmHNoYXJwc2xfc2F2ZV9wYXJhbeKAmToKPiBhcmNoL2FybS9jb21tb24vc2hhcnBzbF9wYXJh
bS5jOjQzOjk6IGVycm9yOiDigJhtZW1jcHnigJkgcmVhZGluZyA2NCBieXRlcyBmcm9tIGEgcmVn
aW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KPiAgICA0MyB8ICAgICAg
ICAgbWVtY3B5KCZzaGFycHNsX3BhcmFtLCBwYXJhbV9zdGFydChQQVJBTV9CQVNFKSwgc2l6ZW9m
KHN0cnVjdCBzaGFycHNsX3BhcmFtX2luZm8pKTsKPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+IAo+IEluIHRoaXMgcGFydGljdWxhciBjYXNlLCB0aGUgd2Fybmlu
ZyBpcyBib2d1cyBzaW5jZSB0aGlzIGlzIHRoZSBhY3R1YWwKPiBwb2ludGVyLCBub3QgYW4gb2Zm
c2V0IG9uIGEgTlVMTCBwb2ludGVyLiBBZGQgYSBsb2NhbCB2YXJpYWJsZSB0byBzaHV0Cj4gdXAg
dGhlIHdhcm5pbmcgYW5kIGhvcGUgaXQgZG9lc24ndCBjb21lIGJhY2suCj4gCj4gTGluazogaHR0
cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9OTk1NzgKCkFja2VkLWJ5
OiBEYW5pZWwgTWFjayA8ZGFuaWVsQHpvbnF1ZS5vcmc+CgoKPiBDYzogSGFvamlhbiBaaHVhbmcg
PGhhb2ppYW4uemh1YW5nQGdtYWlsLmNvbT4KPiBDYzogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5q
YXJ6bWlrQGZyZWUuZnI+Cj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVr
Pgo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiBJZiB0aGVyZSBh
cmUgbm8gb2JqZWN0aW9ucywgSSdkIGFwcGx5IHRoaXMgb25lIHRocm91Z2ggdGhlIHNvYyB0cmVl
Lgo+IC0tLQo+ICBhcmNoL2FybS9jb21tb24vc2hhcnBzbF9wYXJhbS5jIHwgNCArKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vY29tbW9uL3NoYXJwc2xfcGFyYW0uYyBiL2FyY2gvYXJtL2NvbW1vbi9z
aGFycHNsX3BhcmFtLmMKPiBpbmRleCBlZmViNTcyNGQ5ZTkuLjYyMzdlZGUyZjBjNyAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybS9jb21tb24vc2hhcnBzbF9wYXJhbS5jCj4gKysrIGIvYXJjaC9hcm0v
Y29tbW9uL3NoYXJwc2xfcGFyYW0uYwo+IEBAIC00MCw3ICs0MCw5IEBAIEVYUE9SVF9TWU1CT0wo
c2hhcnBzbF9wYXJhbSk7Cj4gIAo+ICB2b2lkIHNoYXJwc2xfc2F2ZV9wYXJhbSh2b2lkKQo+ICB7
Cj4gLQltZW1jcHkoJnNoYXJwc2xfcGFyYW0sIHBhcmFtX3N0YXJ0KFBBUkFNX0JBU0UpLCBzaXpl
b2Yoc3RydWN0IHNoYXJwc2xfcGFyYW1faW5mbykpOwo+ICsJc3RydWN0IHNoYXJwc2xfcGFyYW1f
aW5mbyAqcGFyYW1zID0gcGFyYW1fc3RhcnQoUEFSQU1fQkFTRSk7Cj4gKwo+ICsJbWVtY3B5KCZz
aGFycHNsX3BhcmFtLCBwYXJhbXMsIHNpemVvZigqcGFyYW1zKSk7Cj4gIAo+ICAJaWYgKHNoYXJw
c2xfcGFyYW0uY29tYWRqX2tleXdvcmQgIT0gQ09NQURKX01BR0lDKQo+ICAJCXNoYXJwc2xfcGFy
YW0uY29tYWRqPS0xOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
