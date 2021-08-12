Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB9CC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 07:25:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E0106103A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 07:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E0106103A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PwA3zodm/7vTcdM1yqETGKZgFO3mPGw3Z7/5KGgZ+yw=; b=cfVywByRc6gyrp
	aSy7i4hQVcQeNXolfQExMV32yyFsZcmjUdAm2S0PBAupryxSctvo+lPHXAhXO9KJOrRZ7i82WTKDA
	KLZCq/Mdw++m7ISdUzA5KD0PilAClTK6rmEPIqp4zk2d2F8MnaZiAJKrUx/359CglHtajAiNugk+m
	NIuCdm87UiW+sD3uxnlgKDUcFl8S9Qci89k+xZKijvzoIxgF+dyYSPvA9U8wjF0yijFA/te39kzfE
	vOUdotPkAaB1XG6fFJBg7my2CLKrE3kebA7QDF4oIqDqh3whIN2iPsG6kM1xDskViir5i03JyvpZC
	61idkcbWa/B9LFQvjBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE538-008tAl-QW; Thu, 12 Aug 2021 07:22:47 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4kq-008pgf-RY
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 07:03:54 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 6732380E2;
 Thu, 12 Aug 2021 07:04:08 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] Two missed omap Kconfig patches for v5.15
Date: Thu, 12 Aug 2021 10:03:42 +0300
Message-ID: <pull-1628751694-126144@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000353_002372_F0C9981C 
X-CRM114-Status: UNSURE (   6.24  )
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
Message-ID: <20210812070342.5W1f7ADVNvY-hp83lzUVsSk2gZPYNEdBLYEUz7gC6GQ@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 8d5a937f10ed091e14fc57a4158f59983e2934cf:

  MAINTAINERS: Adopt SanCloud dts files as supported (2021-07-27 11:54:52 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/soc-late-signed

for you to fetch changes up to 4297d1c0834af97fe992ec7bf766f0a262ce5ffc:

  arm: omap2: Drop the unused OMAP_PACKAGE_* KConfig entries (2021-08-06 09:40:26 +0300)

----------------------------------------------------------------
Two missed SoC changes for omaps for v5.15

I managed to miss applying two out of three Kconfig changes earlier
to drop unused entries, here are the missed changes.

----------------------------------------------------------------
Peter Robinson (2):
      arm: omap2: Drop obsolete MACH_OMAP3_PANDORA entry
      arm: omap2: Drop the unused OMAP_PACKAGE_* KConfig entries

 arch/arm/mach-omap2/Kconfig | 18 ------------------
 1 file changed, 18 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
