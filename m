Return-Path: <SRS0=Ogrm=LO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB5CC48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jun 2021 08:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659AE60C3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jun 2021 08:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659AE60C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5kzee6iDSkfs859quNIFr1k8sZ9pCYmLJlFP2RpPcSA=; b=OFp3/d/01DeqMm
	ZtH5ryuxuiGJ8AuRP4Pk5CXtuIumDPuZhg2OeJJY/Rd98FrrtapsPUQvEy1yikcnaWVSL9KyDofHJ
	6FSZxJXRI2QwvlKjMfVyo7qLQVezc0Ncfiipi6pxyfiwHb61YKmSsWB3VTN/L376982DSU/PV+xN4
	9gjSvIVkeAZCJ9R0PULQacHPHxCMBHpL/wuuVis1eFEsBzjt9qan6IrsgKbrE5W/WUtYyj0R3CYme
	d9fn/tW98xUgNxx9872Dm0UDm/R9SxqAbXLZMyWA/uviyHFlWhWas7+lPKQMHn9j8EXZUvjpcbbGs
	1PnED4P8xj4u10ZGxJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lutCa-000jwE-SW; Sun, 20 Jun 2021 08:53:12 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lutCW-000jvD-RH
 for linux-arm-kernel@lists.infradead.org; Sun, 20 Jun 2021 08:53:10 +0000
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 329F8240008;
 Sun, 20 Jun 2021 08:53:03 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.14 (#1)
Date: Sun, 20 Jun 2021 10:53:05 +0200
Message-ID: <878s3429zi.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_015309_066378_8AB86C5A 
X-CRM114-Status: UNSURE (   7.86  )
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
Message-ID: <20210620085305.6KMGcaR-YYLiamRJ72gwa9SRiQzuRDA3yPpzJCOKozg@z>

SGksCgpIZXJlIGlzIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QgZm9yIGR0NjQgZm9yIG12ZWJ1IGZv
ciB2NS4xNC4KCkdyZWdvcnkKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNmVm
Yjk0M2I4NjE2ZWM1M2E1ZTQ0NDE5M2RjY2YxYWY5YWQ2MjdiNToKCiAgTGludXggNS4xMy1yYzEg
KDIwMjEtMDUtMDkgMTQ6MTc6NDQgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2djbGVtZW50L212ZWJ1LmdpdCB0YWdzL212ZWJ1LWR0NjQtNS4xNC0xCgpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gZTM4NTA0NjdiZjhjODJkZTRhMDUyNjE5MTM2ODM5ZmU4MDU0
Yjc3NDoKCiAgYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsOiBmaXggTkFORCBwYXJ0aXRpb25p
bmcgc2NoZW1lICgyMDIxLTA2LTE3IDE3OjAxOjIxICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQptdmVidSBkdDY0
IGZvciA1LjE0IChwYXJ0IDEpCgpvbiBBcm1hZGEgMzcwMDoKTW92ZSB0dXJyaXMtbW94LXJ3dG0g
ZmlybXdhcmUgbm9kZSB0byBhIG1vcmUgZ2VuZXJpYyBwbGFjZQoKb24gQVA4MDc6Ck1ha2UgU0Qv
TU1DIGNvbnRyb2xsZXIgc3RpbGwgdXNiYWxlIHdpdGggb2xkZXIga2VybmVsCgpDUDExeDoKdXBk
YXRlIGNvbXBoeSByZWZlcmVuY2VzCgpjbjkxMzA6CkltcHJvdmUgTkFORCBwYXJ0aXRpb25pbmcg
c2NoZW1lIGZvciBjbjkxMzAtZGIKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KR3J6ZWdvcnogSmFzemN6eWsgKDEpOgogICAg
ICBEb2N1bWVudGF0aW9uL2JpbmRpbmdzOiBwaHk6IHVwZGF0ZSByZWZlcmVuY2VzIHRvIGNwMTF4
CgpLb25zdGFudGluIFBvcm90Y2hraW4gKDEpOgogICAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL21h
cnZlbGw6IGZpeCBOQU5EIHBhcnRpdGlvbmluZyBzY2hlbWUKCk1hcmNpbiBXb2p0YXMgKDEpOgog
ICAgICBhcm02NDogZHRzOiBlbnN1cmUgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBvZiB0aGUgQVA4
MDcgWGVub24KClBhbGkgUm9ow6FyICgxKToKICAgICAgYXJtNjQ6IGR0czogbWFydmVsbDogYXJt
YWRhLTM3eHg6IG1vdmUgZmlybXdhcmUgbm9kZSB0byBnZW5lcmljIGR0c2kgZmlsZQoKIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LW12ZWJ1LWNvbXBoeS50eHQgfCAx
MiArKysrKystLS0tLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzcyMC10
dXJyaXMtbW94LmR0cyAgICAgfCAgNiArKy0tLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVs
bC9hcm1hZGEtMzd4eC5kdHNpICAgICAgICAgICAgICAgfCAgOCArKysrKysrKwogYXJjaC9hcm02
NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS1hcDgwNy5kdHNpICAgICAgICAgICAgICB8ICAzICsr
LQogYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2NuOTEzMC1kYi5kdHMgICAgICAgICAgICAg
ICAgICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQoKLS0gCkdyZWdvcnkgQ2xlbWVudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nCmh0dHA6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
