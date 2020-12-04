Return-Path: <SRS0=P42T=FI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79ACAC4361A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Dec 2020 14:26:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37DBA22B37
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Dec 2020 14:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37DBA22B37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h4eLSGNGBEzIAh9Qi1xigGPqjrM6URS0PphfShTOBp0=; b=Nl8/DsFggUjqqNJVPKSpgw4eXz
	bi7uAMtKh7WD07oEkenOe0bwQ4jFGD9OH8i2kh4ZxvwlyiTjiy1mQt6j7Xz/yLuyaNk6+LgDSBuWa
	Lt1CcydPYUL2FtDNmJ27W94WhcyXjjkt16QNu3bdjhzbMveT5FOxz3Xs4wXuODtdU4Ttcft5TOIt3
	2NnQR61Ajf2aIji7m1F+QoyOU1tI8jFxLcKCxsxkbqAjL+aPYh03A0qWkD9K/d35orLHSlo1c6zgT
	6aKLbuwQ7hhf9rqbR0M6RSPMdv0UpAOzdjxIWsrMpbMkH1ganbk8bSWKmpccK6nSc4KmTP/2GwNLF
	zQJNEpBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klC1D-0004iH-21; Fri, 04 Dec 2020 14:25:07 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klC1B-0004hl-2p
 for linux-arm-kernel@lists.infradead.org; Fri, 04 Dec 2020 14:25:06 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1klC19-00021M-98; Fri, 04 Dec 2020 15:25:03 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1klC18-0002Tj-VB; Fri, 04 Dec 2020 15:25:02 +0100
Message-ID: <d586ada0073f2ac50a02274f42bf07bfb0603835.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller changes for v5.11
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Date: Fri, 04 Dec 2020 15:25:02 +0100
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_092505_165789_7BA05C02 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201204142502.sWBrNAdvDCMr3nm_N-Gv1sXxGDjweeAHKynlxyGuSto@z>

Dear SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux tags/reset-for-v5.11

for you to fetch changes up to d06c4dec98b655e2808d2a59681ec24197c59c9d:

  reset-controller: ti: force the write operation when assert or deassert (2020-12-03 08:44:57 +0100)

----------------------------------------------------------------
Reset controller updates for v5.11

This tag adds support for sharing pulsed resets under certain
conditions. For example, when multiple drivers go through a
suspend-resume cycle, a reset line they share can be triggered
again during resume.
Further, the reset-meson driver now can be built as a module, the
reset-socfpga driver properly releases its memory region in the
probe error path, and reset-ti-syscon driver uses regmap_write_bits()
instead of regmap_update_bits() to support devices without status
readback.

----------------------------------------------------------------
Amjad Ouled-Ameur (1):
      reset: make shared pulsed reset controls re-triggerable

Crystal Guo (1):
      reset-controller: ti: force the write operation when assert or deassert

Dinh Nguyen (1):
      reset: socfpga: add error handling and release mem-region

Neil Armstrong (1):
      reset: meson: make it possible to build as a module

 drivers/reset/Kconfig           |  3 +-
 drivers/reset/core.c            | 73 +++++++++++++++++++++++++++++++++++++++++
 drivers/reset/reset-meson.c     |  8 ++++-
 drivers/reset/reset-socfpga.c   | 11 +++++--
 drivers/reset/reset-ti-syscon.c |  4 +--
 include/linux/reset.h           |  1 +
 6 files changed, 94 insertions(+), 6 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
