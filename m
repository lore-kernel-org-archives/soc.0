Return-Path: <SRS0=wsnO=LT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29316C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:56:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E76A461459
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E76A461459
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xChhWRgphZAVwbvJ4kDJXoW2GVUpPJdY4i9FMJK+k+Q=; b=b6/4wmNUscgm6e
	Sqx3RblginpdbhyLgMM855waUmB/mev0fSxkbkNx96dSdigzcHD61kHfZLu9x0wXUZ6e8NIBRXsvH
	YCFmM1L+t2ty6GdSffQoUDDVJxwytefH6Sz/QYFWGvur3byN/fAdfdn0YwyxABkk2HrwZvrecB+tr
	jE/n7GRV8dvqvyZQGOaIGjsYONHAls4HSNSTx/OCVGnkIftEiFQ+l7ggpr2ZSxRx+cIVxnrhlweBt
	Ct8JYF2CsYB385Fl1RWzuXxkD9RdHE+HJFJlPjs/xHBV8TGdDsKsmiLOBpuvyRCKl9FAw059FO8Qy
	TY9hyOyBhicwLiNPWHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjUC-0018pg-Bo; Fri, 25 Jun 2021 10:55:00 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwj4H-000xko-1P
 for linux-arm-kernel@lists.infradead.org; Fri, 25 Jun 2021 10:28:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43279ED1;
 Fri, 25 Jun 2021 03:28:11 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51E713F719;
 Fri, 25 Jun 2021 03:28:10 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v5.14(part 2)
Date: Fri, 25 Jun 2021 11:28:07 +0100
Message-ID: <20210625102807.206112-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_032813_172379_F29BB39F 
X-CRM114-Status: UNSURE (   9.26  )
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
Message-ID: <20210625102807.pfzk6bTdcO-XbxkCCG7SPvNWtcew34tu406WEeKPWx4@z>

SGkgQVJNIFNvQyBUZWFtLAoKUGxlYXNlIHB1bGwgIQoKUmVnYXJkcywKU3VkZWVwCgotLT44CgpU
aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGNjMjE5NWZlNTM2YzI4ZTE5MmRmNWQw
N2U2ZGQyNzdhZjM2ODE0YjQ6CgogIGZpcm13YXJlOiBhcm1fZmZhOiBBZGQgc3VwcG9ydCBmb3Ig
TUVNXyogaW50ZXJmYWNlcyAoMjAyMS0wNS0yNiAyMjozODo0MyArMDEwMCkKCmFyZSBhdmFpbGFi
bGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvc3VkZWVwLmhvbGxhL2xpbnV4LmdpdCB0YWdzL2FybS1mZmEt
NS4xNC0yCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYTk5MGVkYzI0ODExMjQwMDlm
MTE0MTZlOWYwYmQzMmI3MjdjOTI1NToKCiAgZmlybXdhcmU6IGFybV9mZmE6IEZpeCB0aGUgY29t
bWVudCBzdHlsZSAoMjAyMS0wNi0yMiAxNzoyNToxMSArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQXJtIEZGLUEg
dXBkYXRlcyBmb3IgdjUuMTQKCkNvdXBsZSBvZiBmaXhlczogb25lIGFkZGluZyBjaGVjayBmb3Ig
cHJlc2VuY2Ugb2YgcHJvYmUgd2hpbGUgcmVnaXN0ZXJpbmcKdGhlIGRyaXZlciB0byBwcmV2ZW50
IE5VTEwgcG9pbnRlciBhY2Nlc3MgYW5kIG90aGVyIGZpeGluZyBzb21lIGNvZGUKY29tbWVudCBz
dHlsZSByZXBvcnRlZCBieSBjbGFuZyBhcyB3YXJuaW5nLiBUaGVyZSBpcyBhbHNvIGEgbWlub3Ig
Y2xlYW51cApkcm9wcGluZyB0aGUgZHVwbGljYXRlIGNoZWNrIGFzIHRoZSBkcml2ZXIgY29yZSBh
bHJlYWR5IHRha2VzIGNhcmUgb2YgaXQuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN1ZGVlcCBIb2xsYSAoMSk6CiAgICAg
IGZpcm13YXJlOiBhcm1fZmZhOiBGaXggdGhlIGNvbW1lbnQgc3R5bGUKClV3ZSBLbGVpbmUtS8O2
bmlnICgyKToKICAgICAgZmlybXdhcmU6IGFybV9mZmE6IEVuc3VyZSBkcml2ZXJzIHByb3ZpZGUg
YSBwcm9iZSBmdW5jdGlvbgogICAgICBmaXJtd2FyZTogYXJtX2ZmYTogU2ltcGxpZnkgcHJvYmUg
ZnVuY3Rpb24KCiBkcml2ZXJzL2Zpcm13YXJlL2FybV9mZmEvYnVzLmMgICAgfCA2ICsrKy0tLQog
ZHJpdmVycy9maXJtd2FyZS9hcm1fZmZhL2RyaXZlci5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAps
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
