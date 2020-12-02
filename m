Return-Path: <SRS0=P2QD=FG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DF5C64E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF3521D7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF3521D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ydU1YqHepgpbqvI0vVKrEHnw5OmZYf+spjuHwdDyeA=; b=cqIhnaBRsgwmqSI7Fg1KNbSqt
	sAUlErkeIqYCE7L9C3FxdKMy6COFXckdTGLBFyr5TvDcx1kz/4JpaFfrXgTO9+Ku1JCqirR3zFH5U
	TJSfJozzCuXlCtejPSS1cnl5I2SDOuITdAejnHzspQUaSP4YdINaC98nDrFenXX/Cpao/TaoTqyai
	ZTVviEzgNLM2Q31IVXETfKNgtpuMBy5c2ht36M5RPOJbvTJRaej3plVYdTcaHDJ9w3ilP0dgOR/cI
	C0yV5w0MxiyIke7RyF0W4m45i7F5sj33VhJUZ6BtxTatzK/gb4zDR1z+I3wYBuH8NRzEakZMTUYBT
	l6cw4k1rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkT6y-0005Q3-Fu; Wed, 02 Dec 2020 14:28:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkT6t-0005OG-7I
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Dec 2020 14:28:00 +0000
From: Shawn Guo <shawnguo@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Subject: [GIT PULL 6/6] i.MX defconfig update for 5.11
Date: Wed,  2 Dec 2020 22:27:17 +0800
Message-Id: <20201202142717.9262-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142717.9262-1-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_092759_392463_54ABBDA0 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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
Cc: Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzNjUwYjIyOGY4M2FkZGE3ZTVlZTUz
MmUyYjkwNDI5YzAzZjdiOWVjOgoKICBMaW51eCA1LjEwLXJjMSAoMjAyMC0xMC0yNSAxNToxNDox
MSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2hhd25ndW8vbGludXgu
Z2l0IHRhZ3MvaW14LWRlZmNvbmZpZy01LjExCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gZWVjYzY2MmZmMzhiNDk4ZTFmY2Q5NzFjYWVjM2NlNDQ4ZTcxMWQwZToKCiAgYXJtNjQ6IGRl
ZmNvbmZpZzogRW5hYmxlIG1vcmUgTGlicmVtIDUgaGFyZHdhcmUgKDIwMjAtMTItMDEgMDk6MTM6
MzkgKzA4MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCmkuTVggZGVmY29uZmlnIHVwZGF0ZSBmb3IgNS4xMToKCi0gQSBj
b3VwbGUgb2YgcGF0Y2hlcyB0aGF0IGVuYWJsZSB2YXJpb3VzIGkuTVggYXVkaW8gZHJpdmVycyBm
b3IgaS5NWDhNLgotIEVuYWJsZSBtb3JlIGRyaXZlcnMgdGhhdCBhcmUgdXNlZnVsIG9uIExpYnJl
bSA1IGhhcmR3YXJlLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBZGFtIEZvcmQgKDIpOgogICAgICBhcm02NDogZGVmY29u
ZmlnOiBFbmFibGUgYWRkaXRpb25hbCBzb3VuZCBkcml2ZXJzIG9uIGkuTVg4TSBNaW5pCiAgICAg
IGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBBU1JDIGFuZCBFQVNSQwoKR3VpZG8gR8O8bnRoZXIg
KDEpOgogICAgICBhcm02NDogZGVmY29uZmlnOiBFbmFibGUgbW9yZSBMaWJyZW0gNSBoYXJkd2Fy
ZQoKIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgfCAxOCArKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAps
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
