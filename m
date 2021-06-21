Return-Path: <SRS0=5Wg8=LP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FB0C4743C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jun 2021 20:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E98761164
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jun 2021 20:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E98761164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rCyskMZFO81IvEJ0wJdvZUjx2+XrNRlMr3K3RecUQrc=; b=tOldqh3J3VED88
	NiRK/GajuBkIErp0IsIHv2p77lLWDku2FxVlM2S6JoJdypRfvj2EJ/8xA39lkcBZKaXb+GyRSTzNO
	FobLYoFOz3GpPhkpEgf/xmih+LIRR45eu6zJqOhTzqo9vDYeuKopSnosdYjc9rqtQo57RGt/RUYvR
	NOjwUPYjOxAr+4ceauWKUtmkWdDCpKRl6IzBWNTZUDjLeYebBGqOWhpLeHpbOwNhRNlPe/INvyOe2
	0u9KZRPCagyTDdnEgqU5zCYeUkSUpPTy6gDMLSHeH/OenHAv1NPkVbjWAcqkcd6aCAHswXRYqubGr
	P+fiPDrZOTgm0FBWUvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvQQO-004mpk-Gn; Mon, 21 Jun 2021 20:21:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvQQK-004mp9-QW
 for linux-arm-kernel@lists.infradead.org; Mon, 21 Jun 2021 20:21:38 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lvQQI-0004Fp-76; Mon, 21 Jun 2021 22:21:34 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lvQQH-0000Vu-R8; Mon, 21 Jun 2021 22:21:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Alexey Charkov <alchark@gmail.com>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] MAINTAINERS: Drop ARM/VT8500 entry
Date: Mon, 21 Jun 2021 22:21:31 +0200
Message-ID: <20210621202131.127802-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_132136_902931_7A0EC5D6 
X-CRM114-Status: GOOD (  14.06  )
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
Message-ID: <20210621202131.ENLKgxv2bV1x0V1tGNVdB9M3If7OzCZjupJwaC6DrFk@z>

VG9ueSdzIGVtYWlsIGFkZHJlc3NlcyBib3VuY2VzIHNpbmNlIGF0IGxlYXN0IEphbnVhcnkgMjAy
MSBhbmQgQWxleGV5CkNoYXJrb3YgY2xhaW1zIGFscmVhZHkgdGhlbiBoZSB3YXMgTUlBIGZvciBx
dWl0ZSBhIHdoaWxlLiBTbyBkcm9wIHRoZQplbnRyeS4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQpJIG1pc3R5cGVk
IHRoZSBhZGRyZXNzIG9mIHRoZSBsYWttbCBpbiBteSBmaXJzdCB0cnksIHNvIHJlc2VuZCB0byB0
aGUKcmlnaHQgYWRkcmVzcyBub3cuIFNvcnJ5IHRvIHRob3NlIG9mIHlvdSB3aG8gZ2V0IHRoZSBw
YXRjaCBhIHNlY29uZCB0aW1lCm5vdyA6LVwKCkhlbGxvIEFsZXhleSwKCmJhY2sgaW4gSmFudWFy
eSB5b3Ugc2FpZCB0aGVyZSB3ZXJlIHN0aWxsIHVzZXJzIGFuZCBzbyB0aGUgcGxhdGZvcm0Kd2Fz
bid0IHJlbW92ZWQuIEFybmQgYXNrZWQgeW91IGZvciBhIE1BSU5UQUlORVJTIHVwZGF0ZSB3aGlj
aCBkaWRuJ3QKaGFwcGVuIHRob3VnaC4KCklmIHlvdSB0aGluayB0aGUgZW50cnkgc2hvdWxkIHN0
YXkgYW5kIHlvdSB3YW50IHRvIGJlIGxpc3RlZCAoYXMgZWl0aGVyCm1haW50YWluZXIgb3Igb2Rk
IGZpeGVyPykgcGxlYXNlIHNwZWFrIHVwLgoKSWYgeW91IHdhbnQgdG8gZ2V0IGFjdGl2ZSwgcGxl
YXNlIGhhdmUgYSBsb29rIGF0IHRoZSB0d28gcGF0Y2hlcyBJIHNlbnQKdG9kYXk6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyMTA2MjExMzA0NTguMTE4NTMwLTEtdS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlCgpCZXN0IHJlZ2FyZHMKVXdlCgogTUFJTlRBSU5FUlMgfCAxOCAtLS0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGJkN2FmZjBjMTIwZi4uYjU5MzA4
YTc2NDZjIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMjcy
NiwyNCArMjcyNiw2IEBAIFM6CU1haW50YWluZWQKIEY6CWFyY2gvYXJtL21hY2gtcHhhL2luY2x1
ZGUvbWFjaC92cGFjMjcwLmgKIEY6CWFyY2gvYXJtL21hY2gtcHhhL3ZwYWMyNzAuYwogCi1BUk0v
VlQ4NTAwIEFSTSBBUkNISVRFQ1RVUkUKLU06CVRvbnkgUHJpc2sgPGxpbnV4QHByaXNrdGVjaC5j
by5uej4KLUw6CWxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJhdGVk
IGZvciBub24tc3Vic2NyaWJlcnMpCi1TOglNYWludGFpbmVkCi1GOglEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy13bXQudHh0Ci1GOglhcmNoL2FybS9tYWNoLXZ0ODUw
MC8KLUY6CWRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItdnQ4NTAwLmMKLUY6CWRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtd210LmMKLUY6CWRyaXZlcnMvbW1jL2hvc3Qvd210LXNkbW1jLmMKLUY6CWRy
aXZlcnMvcHdtL3B3bS12dDg1MDAuYwotRjoJZHJpdmVycy9ydGMvcnRjLXZ0ODUwMC5jCi1GOglk
cml2ZXJzL3R0eS9zZXJpYWwvdnQ4NTAwX3NlcmlhbC5jCi1GOglkcml2ZXJzL3VzYi9ob3N0L2Vo
Y2ktcGxhdGZvcm0uYwotRjoJZHJpdmVycy91c2IvaG9zdC91aGNpLXBsYXRmb3JtLmMKLUY6CWRy
aXZlcnMvdmlkZW8vZmJkZXYvdnQ4NTAwbGNkZmIuKgotRjoJZHJpdmVycy92aWRlby9mYmRldi93
bTg1MDVmYioKLUY6CWRyaXZlcnMvdmlkZW8vZmJkZXYvd210X2dlX3JvcHMuKgotCiBBUk0vWklQ
SVQgWjIgU1VQUE9SVAogTToJTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0QGdtYWlsLmNvbT4KIEw6
CWxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJhdGVkIGZvciBub24t
c3Vic2NyaWJlcnMpCi0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
