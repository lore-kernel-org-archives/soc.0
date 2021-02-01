Return-Path: <SRS0=ZBoG=HD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33BAC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 16:27:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFD564D9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Feb 2021 16:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFD564D9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q6WZbaVuheqZjYIWWE0n7NzrOgH/+DNAy7fZbW5tOFY=; b=HZ4D1IekTFHMMOYvvexKnctrIP
	c46G+eZwv4dED/kCbb6QnXuySuBBmsr/d2pGBsyvA5ykig72nZoJuk2XhiIozu+V2qUle0jthMp0O
	dWCADZthcQFohK1ArMX71wA7MAt0cISM6BurDadc7sNC2NEaYMQmnWGiHnqXc8g6omnKgEltP2fxa
	dO1zuc3kz4jHHq1pxlSQW644mO3mD6npX2kaQNp9hnwF6/TKZPgj3sUVf5ytD2aZQn7SGs0H/ZSl+
	AsyHHLe1mNmfLBjJ1CBoVIpDZ8Yd+2/IZlPwww/oJy6nTIORILG1QFN7JH3X2I1yDkAJHaYK7BVr2
	6X2o0Wsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6c2O-0000zq-Kd; Mon, 01 Feb 2021 16:26:52 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6c2M-0000yy-2T
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Feb 2021 16:26:50 +0000
X-Originating-IP: 90.65.91.141
Received: from localhost (lfbn-lyo-1-1912-141.w90-65.abo.wanadoo.fr
 [90.65.91.141]) (Authenticated sender: gregory.clement@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 12FD320007;
 Mon,  1 Feb 2021 16:26:43 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.12 (#1)
Date: Mon, 01 Feb 2021 17:26:43 +0100
Message-ID: <87pn1jn48s.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_112650_266548_131E512B 
X-CRM114-Status: GOOD (  11.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210201162643.J68fqLPJKgpttJ24YZbnwHVc4ldLRh2to7nYaKRbCtM@z>

SGksCgpIZXJlIGlzIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QgZm9yIGR0NjQgZm9yIG12ZWJ1IGZv
ciB2NS4xMi4KCkdyZWdvcnkKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNWM4
ZmU1ODNjY2U1NDJhYTBiODRhZGM5MzljZTg1MjkzZGUzNmU1ZToKCiAgTGludXggNS4xMS1yYzEg
KDIwMjAtMTItMjcgMTU6MzA6MjIgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2djbGVtZW50L212ZWJ1LmdpdCB0YWdzL212ZWJ1LWR0NjQtNS4xMi0xCgpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gMzVkYjVlMzJlYmMxNjMzMGFlNjI3NWMyNDc4M2VmYTQwOTFh
ZjFiYzoKCiAgYXJtNjQ6IGR0czogYXJtYWRhOiBhZGQgcHdtIG9mZnNldHMgZm9yIGFwL2NwIGdw
aW9zICgyMDIxLTAxLTI5IDE2OjU0OjQ4ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQptdmVidSBkdDY0IGZvciA1
LjEyIChwYXJ0IDEpCgogLSByZW5hbWUgdS1ib290IG10ZCBwYXJ0aXRpb24gdG8gYTUzLWZpcm13
YXJlIG9uIFR1cnJpcyBNb3ggKEFybWFkYSAzNzIwIGJhc2VkKQogLSBpbXByb3ZlIFNESENJIHN1
cHBvcnQgb24gQVA4MDcgYmFzZWQgYm9hcmQKIC0gbW92ZSBTQVRBIGNvbXBoeSBpbnRvIG1haW4g
YXJtYWRhLTM3eHguZHRzaQogLSBhZGQgQXJtYWRhIDhLLzdLIFBXTSBzdXBwb3J0CgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkJhcnVjaCBTaWFjaCAoMSk6CiAgICAgIGFybTY0OiBkdHM6IGFybWFkYTogYWRkIHB3bSBvZmZz
ZXRzIGZvciBhcC9jcCBncGlvcwoKS29uc3RhbnRpbiBQb3JvdGNoa2luICgxKToKICAgICAgYXJt
NjQ6IGR0czogY2hhbmdlIEFQODA3IFNESENJIGNvbXBhdGliaWxpdHkgc3RyaW5nCgpNYXJjaW4g
V29qdGFzICgxKToKICAgICAgYXJtNjQ6IGR0czogY245MTN4LWRiOiBlbmFibGUgTU1DIEhTNDAw
CgpNYXJlayBCZWjDum4gKDEpOgogICAgICBhcm02NDogZHRzOiBhcm1hZGEtMzcyMC10dXJyaXMt
bW94OiByZW5hbWUgdS1ib290IG10ZCBwYXJ0aXRpb24gdG8gYTUzLWZpcm13YXJlCgpQYWxpIFJv
aMOhciAoMSk6CiAgICAgIGFybTY0OiBkdHM6IG1hcnZlbGw6IGFybWFkYS0zN3h4OiBBZGQgU0FU
QSBjb21waHkgaW50byBtYWluIGFybWFkYS0zN3h4LmR0c2kgZmlsZQoKIGFyY2gvYXJtNjQvYm9v
dC9kdHMvbWFydmVsbC9hcm1hZGEtMzcyMC1lc3ByZXNzb2Jpbi5kdHNpIHwgIDIgLS0KIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzcyMC10dXJyaXMtbW94LmR0cyAgIHwgIDIg
Ky0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzd4eC5kdHNpICAgICAgICAg
ICAgIHwgIDIgKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtYXA4MDcuZHRz
aSAgICAgICAgICAgIHwgIDUgKysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1h
ZGEtYXA4MHguZHRzaSAgICAgICAgICAgIHwgIDMgKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21h
cnZlbGwvYXJtYWRhLWNwMTF4LmR0c2kgICAgICAgICAgICB8IDEwICsrKysrKysrKysKIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWFydmVsbC9jbjkxMzAtZGIuZHRzICAgICAgICAgICAgICAgIHwgIDIg
KysKIDcgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK
