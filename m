Return-Path: <SRS0=Ogrm=LO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98340C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jun 2021 08:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5825661042
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jun 2021 08:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5825661042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9aFjVbQWQ7OxN37ens+q/nSv296/Vn492chhjyTQp2E=; b=3Ymp1A/B73lKP3
	5m+CrtcCay0uxvy48Qu6kVciSUj9rVlO+HtptQM7MbHZ5eOom4bOgzgZqIbUWLlizcIXQR/nLyHkv
	IyzYi3RcHOK9T3ARGdbACDy7kJkkECOjsHNYEFSEXktvmtl0YH2YF7/SSS1tek9nrkzjN3MBkEvDm
	2pJqAxg2Stbj5kFybGOnrWGvg586AbFkpAlzRoTd9yWS0nFL/KsvJ5DG7dKq92mHPCwjriVzx9bSJ
	ffdNyAjQori0jvaDejLV4TbLZW9Ygf2bMe8/ylx6rsxtJaSImHVqy3c7wqNYQcMg2V20+JhfrIcpN
	LgAAmcRdi6+I/Oi0E5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luswW-000iL4-Rc; Sun, 20 Jun 2021 08:36:36 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luswS-000iK1-AA
 for linux-arm-kernel@lists.infradead.org; Sun, 20 Jun 2021 08:36:34 +0000
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A45D6C000A;
 Sun, 20 Jun 2021 08:36:26 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v5.13 (#1)
Date: Sun, 20 Jun 2021 10:36:27 +0200
Message-ID: <87eecx0w6s.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_013632_519255_D523843C 
X-CRM114-Status: UNSURE (   5.48  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210620083627.B0JUZBFv9Iw4MUD5IyoZVvdlkA05IyabmJ3HMrL7hHY@z>

SGksCgpIZXJlIGlzIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QgZm9yIGZpeGVzIGZvciBtdmVidSBm
b3IgdjUuMTMuCgpHcmVnb3J5CgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDZl
ZmI5NDNiODYxNmVjNTNhNWU0NDQxOTNkY2NmMWFmOWFkNjI3YjU6CgogIExpbnV4IDUuMTMtcmMx
ICgyMDIxLTA1LTA5IDE0OjE3OjQ0IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9nY2xlbWVudC9tdmVidS5naXQgdGFncy9tdmVidS1maXhlcy01LjEzLTEKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBmYWUyMDE2MDk5MjI2OTQzMTUwNzcwOGZiNzRjMWZkOWYz
YzMwOWMxOgoKICBmaXJtd2FyZTogdHVycmlzLW1veC1yd3RtOiBzaG93IG1lc3NhZ2UgYWJvdXQg
SFdSTkcgcmVnaXN0cmF0aW9uICgyMDIxLTA2LTE3IDE0OjU1OjA5ICswMjAwKQoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpt
dmVidSBmaXhlcyBmb3IgNS4xMyAocGFydCAxKQoKRmV3IGZpeGVzIGZvciB0aGUgVHVycmlzIE1v
eCByV1RNIGZpcm13YXJlIGZvdW5kIG9uIHRoZSBBcm1hZGEgMzcwMApTb0NzLgoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpN
YXJlayBCZWjDum4gKDIpOgogICAgICBmaXJtd2FyZTogdHVycmlzLW1veC1yd3RtOiBmaXggcmVw
bHkgc3RhdHVzIGRlY29kaW5nIGZ1bmN0aW9uCiAgICAgIGZpcm13YXJlOiB0dXJyaXMtbW94LXJ3
dG06IHJlcG9ydCBmYWlsdXJlcyBiZXR0ZXIKClBhbGkgUm9ow6FyICgyKToKICAgICAgZmlybXdh
cmU6IHR1cnJpcy1tb3gtcnd0bTogZmFpbCBwcm9iaW5nIHdoZW4gZmlybXdhcmUgZG9lcyBub3Qg
c3VwcG9ydCBod3JuZwogICAgICBmaXJtd2FyZTogdHVycmlzLW1veC1yd3RtOiBzaG93IG1lc3Nh
Z2UgYWJvdXQgSFdSTkcgcmVnaXN0cmF0aW9uCgogZHJpdmVycy9maXJtd2FyZS90dXJyaXMtbW94
LXJ3dG0uYyB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCi0tIApHcmVnb3J5
IENsZW1lbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
