Return-Path: <SRS0=DKgJ=LL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7043BC49361
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jun 2021 12:58:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B82961351
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jun 2021 12:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B82961351
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nZYEjbfyq2TB/WouShXgJKL9Xwz2z5WY7bJ4Af4NeWs=; b=xNGr5R2VWELMQH
	ftBSO+SmyDRX6GwarD8R6fcN7kqLtdb6WZoGTft2RL1zhcdEmVLmYPsu12nBVpSQFAxRck6WU/Xj8
	oezdgO58hN5k83OpEELpJ0XHd3maqu1celdReCu1rUOnZm4nCnfmFfq7zzlFIvTC3l328v6TLRaMZ
	N+Y2UkQtuB9YMkbNt9pP/T94+QZCCwk+1meVrHiwn8gMSGUxNejQcUg06s52/5PSCSi3ImUBnAWnW
	PWr523+QLz0QdNe76WMfmw8v/Rpr9bGYe/6RRtO1Vm6+By6etHJTs+7cfhek6VAgEBC9obmVgfkNY
	Dc7riEob99VvFak0PAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltrZf-00AMZJ-9K; Thu, 17 Jun 2021 12:56:47 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltrZb-00AMZ2-QO
 for linux-arm-kernel@lists.infradead.org; Thu, 17 Jun 2021 12:56:45 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ltrZW-00062I-9U; Thu, 17 Jun 2021 14:56:38 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ltrZV-0008O5-Vc; Thu, 17 Jun 2021 14:56:37 +0200
Message-ID: <14d33ac19b2a107e97ce1ab264987b707baa9ba7.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v5.14, part 2
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Thu, 17 Jun 2021 14:56:37 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_055643_892845_51BBE77B 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210617125637.jzmP_ftS6fN9Q4DNNrcKdTJ_2ggdqSzYlkO3y56KAlQ@z>

Dear SoC maintainers,

The following changes since commit e207457f9045343a24d936fbb67eb4b412f1c6ad:

  reset: brcmstb: Add missing MODULE_DEVICE_TABLE (2021-05-12 08:01:26 +0200)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.14-2

for you to fetch changes up to 48a74b1147f7db4623eaed591cc01eb740b871c0:

  reset: Add compile-test stubs (2021-06-09 13:37:16 +0200)

----------------------------------------------------------------
Reset controller updates for v5.14, part2

This tag contains a few small fixes, allows to build the Berlin reset
driver as a module, and adds stubs to the reset controller API to allow
compile-testing drivers outside of drivers/reset without enabling the
reset framework.

----------------------------------------------------------------
Hao Fang (1):
      reset: hi6220: Use the correct HiSilicon copyright

Jisheng Zhang (1):
      reset: berlin: support module build

Philipp Zabel (1):
      reset: bail if try_module_get() fails

Thierry Reding (1):
      reset: Add compile-test stubs

Wei Yongjun (1):
      reset: mchp: sparx5: fix return value check in mchp_sparx5_map_io()

Yang Yingliang (1):
      reset: lantiq: use devm_reset_controller_register()

 drivers/reset/Kconfig                  |  5 +++--
 drivers/reset/core.c                   |  5 ++++-
 drivers/reset/hisilicon/hi6220_reset.c |  2 +-
 drivers/reset/reset-berlin.c           | 10 ++++++++--
 drivers/reset/reset-lantiq.c           |  2 +-
 drivers/reset/reset-microchip-sparx5.c |  4 ++--
 include/linux/reset-controller.h       | 22 ++++++++++++++++++++++
 7 files changed, 41 insertions(+), 9 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
