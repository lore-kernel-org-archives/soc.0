Return-Path: <SRS0=GAqo=NO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673EFC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Aug 2021 16:14:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C4B6124D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Aug 2021 16:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39C4B6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=psb3YJa0pRDTfWYQrdJ/WUeaDlsJvIeMl5RV+BIXufI=; b=EfCYCkF79hmy/h
	OLJiA7at3bq38fLIEMTsA97hwHN9k9wLTfveQXgmvVozOsD2uD2qbSzV90PNeWazkHFa/Owy19B9U
	pC7uROIttTOBvbkU8JDNfV2sZR/DbNZF5LIUi00XnMGDr7+5uXOi8/ys6UaiwgkZDc6cdiKEgz0Q5
	MGYqfa0DwG+lnizXvyrGYH8g0SBW2IgDAqLklyvl0w4mNZkRIVa6Xa/xOirRFBU67AECQjFY1r72w
	tf/TuDpn3fo8+jYM9bH4h68eyzQkt7uRbstCSQGdVcoa+jvMFEBZ0PKuvz0nHtlhLw4LeBmGeH1eG
	PG6vksdkHF+W9RO7RfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mICZ7-00HY00-D5; Mon, 23 Aug 2021 16:12:49 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mICZ0-00HXxt-Uy
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Aug 2021 16:12:46 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mICYp-0008Nz-CJ; Mon, 23 Aug 2021 18:12:31 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mICYp-0002hr-1f; Mon, 23 Aug 2021 18:12:31 +0200
Message-ID: <e543959c5b5ee7b25686f81049bf187d602daeda.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v5.14
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Mon, 23 Aug 2021 18:12:30 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_091243_033635_05A29382 
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
Message-ID: <20210823161230.TuQ_c8to_CDATeKdSD085nTyMunaewpETWf8P6P_QqU@z>

Dear SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux tags/reset-fixes-for-v5.14

for you to fetch changes up to ed104ca4bd9c405b41e968ad4ece51f6462e90b6:

  reset: reset-zynqmp: Fixed the argument data type (2021-08-23 12:55:18 +0200)

----------------------------------------------------------------
Reset controller fixes for v5.14

Hide the Sparx5 reset driver unless the ARCH_SPARX5 or COMPILE_TEST
options are enabled, to avoid unnecessarily asking users about this
driver. Fix a return value argument type in the ZynqMP reset driver.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      reset: RESET_MCHP_SPARX5 should depend on ARCH_SPARX5

Sai Krishna Potthuri (1):
      reset: reset-zynqmp: Fixed the argument data type

 drivers/reset/Kconfig        | 2 +-
 drivers/reset/reset-zynqmp.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
