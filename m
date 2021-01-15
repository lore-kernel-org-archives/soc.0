Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E851C43331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 15:53:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237B92388B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 15:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 237B92388B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uzuE1w1SJ/OMCvpaO6ct/PWG6PTP5NdaNPkntCb+V6k=; b=jngnqw8kp9nVaKB+tZxqCnQVp
	V9ah5rdrlMK/XZHDjnDDblpMQr+EAn7mHHQGY25hSQmFrXDmZJy+xrohHBj6NlqnuIQ43QPhbaAAt
	qpt+8AZLxNFtJDTdEcZ0vH3bl4gZL/3SINllCIwGHqAEyzzx0/DY1yj+2IcW/zT3lkI8bCuIaAcQh
	iSsdXontzdOWudjtISuidMKrdjwlRCeJ8bU2cqlt8kp2cB7c1+v9syVt9lS3g2yj2Mk6iqvEXs4z3
	7V/kM/gfpnD3dELBXUWR41sEjkATge/LggQjjo0Gw1CLMigN+lVgFbcRj8m6UVOwj9+rC0DzBSQsd
	xihhVmEZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0RO9-0007Lo-FS; Fri, 15 Jan 2021 15:51:49 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0RNw-0007I3-SD
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 15:51:39 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l0RNu-0003OM-56; Fri, 15 Jan 2021 16:51:34 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l0RNt-0008Lc-Qt; Fri, 15 Jan 2021 16:51:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH v2 7/7] MAINTAINERS: Remove deleted platform efm32
Date: Fri, 15 Jan 2021 16:51:30 +0100
Message-ID: <20210115155130.185010-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_105136_937416_6FDBAD14 
X-CRM114-Status: GOOD (  11.98  )
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
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115155130.9HCDDUOKszYuNVAdxO1a9FsGFX4xZb89gdX6WQ7Q8bk@z>

VGhlcmUgYXJlIG5vIGZpbGVzIGxlZnQgdG8gYmUgbWFpbnRhaW5lZCwgdG8gcmVtb3ZlIHRoZSBt
YWludGFpbmVyCmVudHJ5LCB0b28uCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIE1BSU5UQUlORVJTIHwgNyAtLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDU0NmFhNjY0MjhjOS4uOTNlNTYyMzNjNmRlIDEwMDY0
NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTgwNywxMyArMTgwNyw2
IEBAIEY6CWRyaXZlcnMvZmlybXdhcmUvdHVycmlzLW1veC1yd3RtLmMKIEY6CWRyaXZlcnMvZ3Bp
by9ncGlvLW1veHRldC5jCiBGOglpbmNsdWRlL2xpbnV4L21veHRldC5oCiAKLUFSTS9FTkVSR1kg
TUlDUk8gKFNJTElDT04gTEFCUykgRUZNMzIgU1VQUE9SVAotTToJVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLVI6CVBlbmd1dHJvbml4IEtlcm5lbCBU
ZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+Ci1MOglsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJzKQotUzoJTWFpbnRhaW5l
ZAotTjoJZWZtMzIKLQogQVJNL0VaWCBTTUFSVFBIT05FUyAoQTc4MCwgQTkxMCwgQTEyMDAsIEU2
ODAsIFJPS1IgRTIgYW5kIFJPS1IgRTYpCiBNOglSb2JlcnQgSmFyem1payA8cm9iZXJ0Lmphcnpt
aWtAZnJlZS5mcj4KIEw6CWxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9k
ZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCi0tIAoyLjI5LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
