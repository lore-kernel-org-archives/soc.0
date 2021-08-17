Return-Path: <SRS0=cSn/=NI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396B4C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 16:55:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA23260F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 16:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA23260F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c6axJ3b4YkjeSv9v6a+3tEYEKFNT9TMiFEmr2DP9244=; b=xcFB3/APW8nH5z
	edJv3gY6myFORdTcYcOX3I/2OCxALEgKc8HwEDa1FHRC7kiyhjxs0VRor/IgR+J3goT5ciP2JYPQv
	yeLX1eVX7jDwfSF2umcQoeWR8j+jTESj+cHNGALo70D6JVc1gLfB8XZ78rwBpwmPzqQTlkRfoTP2P
	8Vk2+UILIw6k14XoweqRi5jFFmStbXp11AO6uMj9uycSKKcxtb7ODiNq8VIcjM22izJOXCGcluqib
	ykC7m18Nm23ug4crwW3bxAUNOMvlICTj6sgu2g9sXJE1+9szCXWBbeLYlZxIToL2zuqYIPR/oIjvp
	x7JC/OOLdQgIQUGCwUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG2Kl-0032ga-VM; Tue, 17 Aug 2021 16:53:04 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG2K3-0032Tq-Tl
 for linux-arm-kernel@lists.infradead.org; Tue, 17 Aug 2021 16:52:24 +0000
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BCBA2E0009;
 Tue, 17 Aug 2021 16:52:13 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.15 (#1)
Date: Tue, 17 Aug 2021 18:52:13 +0200
Message-ID: <878s10ypxe.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_095220_307549_326E748E 
X-CRM114-Status: GOOD (  11.33  )
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
Message-ID: <20210817165213.ZjD2XqYtptEUpBvVlQedFHUzZjda91K6lX7xjmw2xzs@z>

SGksCgpIZXJlIGlzIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QgZm9yIGR0NjQgZm9yIG12ZWJ1IGZv
ciB2NS4xNS4KCkdyZWdvcnkKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZTcz
ZjBmMGVlNzU0MTE3MWQ4OWYyZTI0OTExMzBjNzc3MWJhNThkMzoKCiAgTGludXggNS4xNC1yYzEg
KDIwMjEtMDctMTEgMTU6MDc6NDAgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2djbGVtZW50L212ZWJ1LmdpdCB0YWdzL212ZWJ1LWR0NjQtNS4xNS0xCgpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gNTE0ZWYxZTYyZDY1MjFjMjE5OWQxOTJiMWM3MWI3OWQyYWEy
MWQ1YToKCiAgYXJtNjQ6IGR0czogbWFydmVsbDogYXJtYWRhLTM3eHg6IEV4dGVuZCBQQ0llIE1F
TSBzcGFjZSAoMjAyMS0wOC0xNyAxODozMDoxNCArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KbXZlYnUgZHQ2NCBm
b3IgNS4xNSAocGFydCAxKQoKIC0gRFRTIHVwZGF0ZXMgZm9yIE1hcnZlbGwgQXJtYWRhIENOOTEz
eCBwbGF0Zm9ybXMKCiAgICsgQWRkIHN1cHBvcnQgZm9yIEFybWFkYSBDTjkxM3ggRGV2ZWxvcG1l
bnQgQm9hcmQgdG9wb2xvZ3kgIkIiCiAgICsgQWRkIHN1cHBvcnQgZm9yIEFybWFkYSBDTjkxM3gg
UmVmZXJlbmNlIERlc2lnbiBib2FyZHMgKENSQikKICAgKyBGaXhlcyB0aGUgTkFORCBwYXJ0aXRp
b25pbmcgc2NoZW1lIGluIERUUyBlbGltaW5hdGluZyBnYXAgYmV0d2VlbgogICAgIGNvbnNlY3V0
aXZlIHBhcnRpdGlvbnMKICAgKyBGaXggMTBHYiBwb3J0cyBQSFkgbW9kZSBuYW1lcwoKIC0gRXh0
ZW5kIFBDSWUgTUVNIHNwYWNlIG9uIEFybWFkYSAzN3h4OiB1c2VmdWwgZm9yIHNvbWUgY29tYmlu
YXRpb24KICAgIG9mIFBDSWUgY2FyZHMgd2hlcmUgdGhlIGluaXRpYWwgMTZNQiB3YXMgbm90IGVu
b3VnaAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpLb25zdGFudGluIFBvcm90Y2hraW4gKDMpOgogICAgICBhcm02NDogZHRz
OiBjbjkxM3g6IGFkZCBkZXZpY2UgdHJlZXMgZm9yIHRvcG9sb2d5IEIgYm9hcmRzCiAgICAgIGFy
bTY0OiBkdHM6IGFkZCBzdXBwb3J0IGZvciBNYXJ2ZWxsIGNuOTEzMC1jcmIgcGxhdGZvcm0KICAg
ICAgYXJjaC9hcm02NDogZHRzOiBjaGFuZ2UgMTBnYmFzZS1rciB0byAxMGdiYXNlLXIgaW4gQXJt
YWRhCgpQYWxpIFJvaMOhciAoMSk6CiAgICAgIGFybTY0OiBkdHM6IG1hcnZlbGw6IGFybWFkYS0z
N3h4OiBFeHRlbmQgUENJZSBNRU0gc3BhY2UKClN0ZWZhbiBDaHVsc2tpICgxKToKICAgICAgZHRz
OiBtYXJ2ZWxsOiBFbmFibGUgMTBHIGludGVyZmFjZXMgb24gOTEzMC1EQiBhbmQgOTEzMS1EQiBi
b2FyZHMKCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvTWFrZWZpbGUgICAgICAgICAgICAg
ICB8ICAgNSArCiAuLi4vYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzcyMC10dXJyaXMtbW94LmR0
cyAgICB8ICAxNyArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvYXJtYWRhLTM3eHguZHRz
aSAgICAgICB8ICAxMSArLQogYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS03MDQw
LWRiLmR0cyAgICAgfCAgIDIgKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEt
ODA0MC1kYi5kdHMgICAgIHwgICA0ICstCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvY245
MTMwLWNyYi1BLmR0cyAgICAgICB8ICAzOCArKwogYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxs
L2NuOTEzMC1jcmItQi5kdHMgICAgICAgfCAgNDYgKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21h
cnZlbGwvY245MTMwLWNyYi5kdHNpICAgICAgICB8IDIyMiArKysrKysrKysrKwogYXJjaC9hcm02
NC9ib290L2R0cy9tYXJ2ZWxsL2NuOTEzMC1kYi1CLmR0cyAgICAgICAgfCAgMjIgKysKIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWFydmVsbC9jbjkxMzAtZGIuZHRzICAgICAgICAgIHwgNDAzICstLS0t
LS0tLS0tLS0tLS0tLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvY245MTMwLWRiLmR0
c2kgICAgICAgICB8IDQxMCArKysrKysrKysrKysrKysrKysrKysKIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWFydmVsbC9jbjkxMzEtZGItQi5kdHMgICAgICAgIHwgIDIyICsrCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL21hcnZlbGwvY245MTMxLWRiLmR0cyAgICAgICAgICB8IDE5NyArLS0tLS0tLS0tCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvY245MTMxLWRiLmR0c2kgICAgICAgICB8IDIwNiAr
KysrKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2NuOTEzMi1kYi1CLmR0cyAg
ICAgICAgfCAgMjIgKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9jbjkxMzItZGIuZHRz
ICAgICAgICAgIHwgMjE4ICstLS0tLS0tLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwv
Y245MTMyLWRiLmR0c2kgICAgICAgICB8IDIyNyArKysrKysrKysrKysKIDE3IGZpbGVzIGNoYW5n
ZWQsIDEyNjcgaW5zZXJ0aW9ucygrKSwgODA1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9jbjkxMzAtY3JiLUEuZHRzCiBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2NuOTEzMC1jcmItQi5kdHMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvY245MTMwLWNy
Yi5kdHNpCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2Nu
OTEzMC1kYi1CLmR0cwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFy
dmVsbC9jbjkxMzAtZGIuZHRzaQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWFydmVsbC9jbjkxMzEtZGItQi5kdHMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0
L2Jvb3QvZHRzL21hcnZlbGwvY245MTMxLWRiLmR0c2kKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvY245MTMyLWRiLUIuZHRzCiBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2NuOTEzMi1kYi5kdHNpCi0tIApHcmVnb3J5
IENsZW1lbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
