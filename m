Return-Path: <SRS0=BD2L=MW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75705C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 14:38:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4272260184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 14:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4272260184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ca2ugUrnBxos14sIw4H36DIbH5oYwm78nzv3sD/Kkf8=; b=ZX/nalIR7/nneo
	GlGraquyK2tJ0XGsRL65R/jOGgu66KV8DjQAwtMAw0lf5hohGET7aiSikjvWkHmZ4kfuE7WSlNF1O
	lsA8R7iPRYHUZBW3Yzt68Z7Pqjf2/rtj6az1BWa5mswvpG4IazDwGc+G8o+lhG6xySwWwYc03fjtd
	HShPelPI9Dnnx18/AynzGIgvpRXVtOt6X/Zv4rV0Zc1saVzvANWAmqOLfEaT3CGcvpSYlH6QFqnYZ
	MRq5JaxCZyozCVqff7G96kvyuhtap6coRqVr57yZd4U1FwvK+VTbYWodKvYTmpzqfs10DxIz16BIH
	fVXHNKhZgoS0QlkRu5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9TdF-008zna-AL; Fri, 30 Jul 2021 14:37:01 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Td8-008zku-LJ
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Jul 2021 14:36:57 +0000
Received: (Authenticated sender: gregory.clement@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 13A4B40006;
 Fri, 30 Jul 2021 14:36:48 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v5.14 (#1)
Date: Fri, 30 Jul 2021 16:36:48 +0200
Message-ID: <87k0l7zx4v.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_073654_936949_44C1E990 
X-CRM114-Status: UNSURE (   7.97  )
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
Message-ID: <20210730143648.1wn8fkskWPsbBC1uNFdAVwCSgPT_BD6CvBFUS8YcGSc@z>

SGksCgpIZXJlIGlzIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QgZm9yIGZpeGVzIGZvciBtdmVidSBm
b3IgdjUuMTQuCgpHcmVnb3J5CgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU3
M2YwZjBlZTc1NDExNzFkODlmMmUyNDkxMTMwYzc3NzFiYTU4ZDM6CgogIExpbnV4IDUuMTQtcmMx
ICgyMDIxLTA3LTExIDE1OjA3OjQwIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9nY2xlbWVudC9tdmVidS5naXQgdGFncy9tdmVidS1maXhlcy01LjE0LTEKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlZTdhYjNmMjYzZjgxMzE3MjJjZmYzODcxYjk2MThiMWU3
NDc4ZjA3OgoKICBhcm02NDogZHRzOiBhcm1hZGEtMzcyMC10dXJyaXMtbW94OiByZW1vdmUgbXJ2
bCxpMmMtZmFzdC1tb2RlICgyMDIxLTA3LTIzIDE0OjQwOjExICswMjAwKQoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQptdmVi
dSBmaXhlcyBmb3IgNS4xNCAocGFydCAxKQoKLSBGaXggaTJjIHByb3BlcnR5IGZvciBhcm1hZGEt
MzcyMC10dXJyaXMtbW94IGluIG9yZGVyIHRvIHVzZSBTRlAKCi0gQWRkIG1tYyBhbGlhcyBvbiBh
cm1hZGEtMzcyMC10dXJyaXMtbW94IHRvIGFsbG93IHJvb3RmcyB1c2luZyB0aGUKICByaWdodCBt
bWMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KUGFsaSBSb2jDoXIgKDEpOgogICAgICBhcm02NDogZHRzOiBhcm1hZGEtMzcy
MC10dXJyaXMtbW94OiByZW1vdmUgbXJ2bCxpMmMtZmFzdC1tb2RlCgpWbGFkaW1pciBPbHRlYW4g
KDEpOgogICAgICBhcm02NDogZHRzOiBhcm1hZGEtMzcyMC10dXJyaXMtbW94OiBmaXhlZCBpbmRp
Y2VzIGZvciB0aGUgU0RIQyBjb250cm9sbGVycwoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVs
bC9hcm1hZGEtMzcyMC10dXJyaXMtbW94LmR0cyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgotLSAKR3JlZ29yeSBDbGVtZW50LCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cDovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
