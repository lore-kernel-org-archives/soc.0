Return-Path: <SRS0=MvIc=OR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C071AC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 14:55:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B19F60EE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 14:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B19F60EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mCA9ryqeSwJcnPa30+GrIgP+reYNIPcjHOiPcXV2QvA=; b=dvhCysXeAHbfEk
	v1Y595n5R1q9AWPOhnZI0IYkaiXT2wao9CTmKauLTmVg646rng0D9CDhsVpgx4qYE/oTKh5PqFO1P
	x2cR/ye5tTGQm8zen10gyag2HmzRYjpv7Txs+JeTtxJAsUUp/Db8Khg3nFAYUbeUrBaz6XTSn+SKN
	mW88aqQnGdLI0WXq0cIyo/21pg3DvN00uKfvvHK/RhcCnXjHon0howzYp9U11rVXbyezJcuuEOYp2
	kxXIpWmjSe/52e8uhGP7Midb5UjiytD6izzGxiawmsHRfp7dibzoSsT3TMXCxw2/sfJZtxvo6nV0p
	2dF1QDBauIBQhgDraBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUs0l-002y9V-J0; Mon, 27 Sep 2021 14:53:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUs0i-002y8r-4N
 for linux-arm-kernel@lists.infradead.org; Mon, 27 Sep 2021 14:53:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C4DD60FD7;
 Mon, 27 Sep 2021 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632754419;
 bh=cF5T2TlDxPW2aCrkwNwJXmbL3iVCdgO2agfHOyQPUZA=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=mp8h9LP4IaWp953vvnItgiSCgSCnXosokidNr6Kwc2RR9srlN2N6+Sui178UgXUal
 0LQWeFmFzcoHh19nLI9cF+PSeBQxTV+KFnqXvSnGOCCh1qupU6Mz1ckvUGFZbnv3Ky
 04LSStFHkPlgUAgwrcso4JVNryqwAfnuB/G85pYn9oxedcjciOWE+iKaXVOs3lnYM3
 edKBGpnLvLMtorqAQi+MPiYzCP9voQ58uxgBhT+FncYFuxb0kXyWe048i3Iy0rapDa
 VSGIWaRXdDGLAZvgnA9j4Xv1Jok6acXL4T2sTBbFwAAJg3Zd+eLnm5JCg2FffBQmY1
 1eBZqy0WB6JfQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] ARM: sharpsl_param: work around -Wstringop-overread
 warning
Date: Mon, 27 Sep 2021 16:53:25 +0200
Message-ID: <20210927145332.2784005-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_075340_213504_5E1685F4 
X-CRM114-Status: GOOD (  14.58  )
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
Message-ID: <20210927145325.fpy1IvPSZQe68Uw1SU5rGsm_8qGQqXW9_wGT9hHj0v4@z>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYyB3YXJucyB0aGF0IGFjY2Vz
c2luZyBhIHBvaW50ZXIgYmFzZWQgb24gYSBudW1lcmljIGNvbnN0YW50IG1heQpiZSBhbiBvZmZz
ZXQgaW50byBhIE5VTEwgcG9pbnRlciwgYW5kIHdvdWxkIHRoZXJlZm9yZSBoYXMgemVybwphY2Nl
c3NpYmxlIGJ5dGVzOgoKYXJjaC9hcm0vY29tbW9uL3NoYXJwc2xfcGFyYW0uYzogSW4gZnVuY3Rp
b24g4oCYc2hhcnBzbF9zYXZlX3BhcmFt4oCZOgphcmNoL2FybS9jb21tb24vc2hhcnBzbF9wYXJh
bS5jOjQzOjk6IGVycm9yOiDigJhtZW1jcHnigJkgcmVhZGluZyA2NCBieXRlcyBmcm9tIGEgcmVn
aW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KICAgNDMgfCAgICAgICAg
IG1lbWNweSgmc2hhcnBzbF9wYXJhbSwgcGFyYW1fc3RhcnQoUEFSQU1fQkFTRSksIHNpemVvZihz
dHJ1Y3Qgc2hhcnBzbF9wYXJhbV9pbmZvKSk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+CgpJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIHdhcm5pbmcgaXMgYm9n
dXMgc2luY2UgdGhpcyBpcyB0aGUgYWN0dWFsCnBvaW50ZXIsIG5vdCBhbiBvZmZzZXQgb24gYSBO
VUxMIHBvaW50ZXIuIEFkZCBhIGxvY2FsIHZhcmlhYmxlIHRvIHNodXQKdXAgdGhlIHdhcm5pbmcg
YW5kIGhvcGUgaXQgZG9lc24ndCBjb21lIGJhY2suCgpMaW5rOiBodHRwczovL2djYy5nbnUub3Jn
L2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05OTU3OApDYzogRGFuaWVsIE1hY2sgPGRhbmllbEB6
b25xdWUub3JnPgpDYzogSGFvamlhbiBaaHVhbmcgPGhhb2ppYW4uemh1YW5nQGdtYWlsLmNvbT4K
Q2M6IFJvYmVydCBKYXJ6bWlrIDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPgpDYzogUnVzc2VsbCBL
aW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+CkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Ci0tLQpJZiB0aGVyZSBhcmUgbm8gb2JqZWN0aW9ucywgSSdkIGFwcGx5IHRoaXMgb25lIHRo
cm91Z2ggdGhlIHNvYyB0cmVlLgotLS0KIGFyY2gvYXJtL2NvbW1vbi9zaGFycHNsX3BhcmFtLmMg
fCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb21tb24vc2hhcnBzbF9wYXJhbS5jIGIvYXJjaC9hcm0v
Y29tbW9uL3NoYXJwc2xfcGFyYW0uYwppbmRleCBlZmViNTcyNGQ5ZTkuLjYyMzdlZGUyZjBjNyAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vY29tbW9uL3NoYXJwc2xfcGFyYW0uYworKysgYi9hcmNoL2Fy
bS9jb21tb24vc2hhcnBzbF9wYXJhbS5jCkBAIC00MCw3ICs0MCw5IEBAIEVYUE9SVF9TWU1CT0wo
c2hhcnBzbF9wYXJhbSk7CiAKIHZvaWQgc2hhcnBzbF9zYXZlX3BhcmFtKHZvaWQpCiB7Ci0JbWVt
Y3B5KCZzaGFycHNsX3BhcmFtLCBwYXJhbV9zdGFydChQQVJBTV9CQVNFKSwgc2l6ZW9mKHN0cnVj
dCBzaGFycHNsX3BhcmFtX2luZm8pKTsKKwlzdHJ1Y3Qgc2hhcnBzbF9wYXJhbV9pbmZvICpwYXJh
bXMgPSBwYXJhbV9zdGFydChQQVJBTV9CQVNFKTsKKworCW1lbWNweSgmc2hhcnBzbF9wYXJhbSwg
cGFyYW1zLCBzaXplb2YoKnBhcmFtcykpOwogCiAJaWYgKHNoYXJwc2xfcGFyYW0uY29tYWRqX2tl
eXdvcmQgIT0gQ09NQURKX01BR0lDKQogCQlzaGFycHNsX3BhcmFtLmNvbWFkaj0tMTsKLS0gCjIu
MjkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
