Return-Path: <SRS0=Tcyv=NL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794E4C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Aug 2021 06:59:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4826561053
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Aug 2021 06:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4826561053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f1IwDSVVPNkHU/8W7+guxJYJJRGIop0FrwddPlq4Ma4=; b=zWDcOsNILzzXwX
	xzVdGiTtIuMEbQLXqukV0TVuRbwGHAIcWGfqEsLv6xv85hCyru/dfsmhEndutrQHQdy2v0HvwXBW+
	brXkwDgNyi8JgkqKLJm+s6fkJW9CTGu0QDwY9Teqm7JoX6Bq3K17ZFin+wDl3onTYeiEyMEH4Pb5+
	yqpGpdqfc4TX9/NHzKp1kV72Wsce6pKFl/xkuENbOQd8SW22Jn6XlW/emjmcpxg7LXRLrvdene3IR
	Op7+BFxXAqAWhLnyBxj6R2gQ9/DKS73nMr3fNu/DUTbeIHwl6shzE4NUhOYzEMx1Ot67UhZRe2S1m
	tqsU3bHpEGYzap9/Sa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGyTI-00ACDq-3L; Fri, 20 Aug 2021 06:57:44 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGyTB-00ACBz-Fx
 for linux-arm-kernel@lists.infradead.org; Fri, 20 Aug 2021 06:57:41 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id eh1so5009925qvb.11
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 19 Aug 2021 23:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=lkqLAJOtyy+YUdhrYPA+bRzMAzOf22GDg+DJ02DtLVc=;
 b=ez0h2GnAsw9nyE6vHO8RTsKE7gM+sQUsTEeXabzp3YmS25OfoZLxlpR4L/D7yWeEIe
 uspj/QajhSi908C79vGMfY6GEk6fH3/h3oGGSJncmlbOJEEzO5UfZU6UUkz90WY2bCJB
 qmSQlbolBZgfAe3wg+3Lct26+ViHXBvax6/Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=lkqLAJOtyy+YUdhrYPA+bRzMAzOf22GDg+DJ02DtLVc=;
 b=kJTajE4v59U4v8R5u4Dv9RxP/SSOjfimJjHfGCiFtqA/XUfV22NcTOdMH4xfDi9CWS
 bQFO3tkKb4xa7kUoAWUKOmiFF/BBoOO8PuKAH/Q77nTgYYffczTygCgikZsMylKADmQq
 MMwChzRdJF95s/UJAXYb1bHXBR++tuDtvcUhN4VuqZ1fNPeOWK9gXhdGtBTb77hHVyih
 0lYLWyNdXODs4mzzoFojGA2iFc4YXCdxJ/yHUTy9K6ebw19fcCFdjtO3pWBVjsdeWybl
 uyGXQQU1AnZPtBdz3l7O56ohWVws4UATolmViEkXsRJmRE+In76/z17TghjyX+pkasFI
 MeNw==
X-Gm-Message-State: AOAM531Hf6LrFUEXN/3xUS/sxBQWJ/T2DulbobrZId3xqyUwA6J05Z89
 ckxnLgOw9vJLJQke/i5QiCYs9yBgk/0K4Zxamy6UEFjJx1g=
X-Google-Smtp-Source: ABdhPJz6OTbflJCYACZ7DsAZ4MzA345+fqJTPHx13X/1ctgZxWuqPYzlVf9y9O4aPTz7L1d2eL6e/6Tkw7sevDTQTeo=
X-Received: by 2002:a05:6214:cc9:: with SMTP id
 9mr18358394qvx.43.1629442655136; 
 Thu, 19 Aug 2021 23:57:35 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Aug 2021 06:57:24 +0000
Message-ID: <CACPK8XdzKdnyrpjKukGWieBhLgQnBs+y=LuSr_weot=Ovy3+9A@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_235737_623240_02241493 
X-CRM114-Status: UNSURE (   8.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210820065724.wEP4MVOr3HG2MxqoqPzC9HGDQ7fwRZv7RGxDG_X1xdY@z>

Dear Soc maintainers,

This is the last of the aspeed pull requests for v5.15.

Apologies for drip feeding them, I was pressed for time so I started
with the most important and worked down the list.

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.15-defconfig

for you to fetch changes up to a4836d5ad127fe31fecb29878d81f2e9b4a5591c:

  ARM: config: aspeed: Regenerate defconfigs (2021-08-19 16:33:43 +0930)

----------------------------------------------------------------
ASPEED defconfig updates for 5.15

 - Enable new KCS SerIO driver

 - Enable SGPIO and EDAC for AST2400 now they are supported there

 - Switch to SLUB and enable SLAB_FREELIST_HARDENED

 - Regenerate defconfigs atop v5.14-rc2

----------------------------------------------------------------
Joel Stanley (4):
      ARM: config: aspeed: Enable hardened allocator feature
      ARM: config: aspeed: Enable KCS adapter for raw SerIO
      ARM: config: aspeed_g4: Enable EDAC and SPGIO
      ARM: config: aspeed: Regenerate defconfigs

 arch/arm/configs/aspeed_g4_defconfig | 16 +++++-----------
 arch/arm/configs/aspeed_g5_defconfig | 25 +++++++++----------------
 2 files changed, 14 insertions(+), 27 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
