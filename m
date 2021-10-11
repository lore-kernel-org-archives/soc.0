Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4966C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 11:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 720ED60EB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 11:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 720ED60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOBXzaq+cIGriBeD+LFy6G+EsbkAj92M6janIML6hNY=; b=VOCdQP11j6rQgX
	Ij8Q2NwBfWEfsv7070iG4lw9WAckPnL7VXhKAsYXo/wCVlAKa0yYDJLC41pqoxAPoilbYULPKjgaF
	UOMSCexkazCYG8nAkhXzcMC2Df8MpQ0lIfOTTlclGt44OKma6/qRrnQPnw1MlMefI16RUk70pA5ty
	T2PaP/GQRtczDWSkTkYgTP0wzvAhvPU6QpuZZZo3RqRM7AkBnMx/5LNWxcr/xI3HWR9nU06nPreJ7
	EdrEzTTadWeV36P4AFP8nVh5VWDYIZzvdUEEmU/aWuBrbx+cvPvnhpabvg6EFvnHf/12thiKHS1Qx
	Nhn78On4F4K95mIjvwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZt5Z-008ybo-SM; Mon, 11 Oct 2021 11:03:26 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZt52-008yTB-59
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 11:02:53 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 5A9F28102;
 Mon, 11 Oct 2021 11:03:22 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Driver changes for ti-sysc for v5.16
Date: Mon, 11 Oct 2021 14:02:43 +0300
Message-ID: <pull-1633950030-501948@atomide.com-2>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <pull-1633950030-501948@atomide.com>
References: <pull-1633950030-501948@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_040252_271258_B3757DD1 
X-CRM114-Status: GOOD (  10.35  )
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
Message-ID: <20211011110243.DopdNCPPplW4SyMC2NfbbIdfCNq91qiMZaQgamZfevg@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/ti-sysc-signed

for you to fetch changes up to 1b1da99b845337362a3dafe0f7b49927ab4ae041:

  bus: ti-sysc: Fix variable set but not used warning for reinit_modules (2021-10-06 08:38:09 +0300)

----------------------------------------------------------------
Driver changes for ti-sysc for v5.16

Changes for ti-sysc driver for improved system suspend and resume
support as some drivers need to be reinitialized on resume. Also
a non-urgent resume warning fix, and dropping of legacy flags for
gpio and sham:

- Fix timekeeping suspended warning on resume. Probably no need to merge
  this into fixes as it's gone unnoticed for a while.

- Check for context loss for reinit of a module

- Add add quirk handling to reinit on context loss, and also fix a
  build warning it caused

- Add quirk handling to reset on reinit

- Use context loss quirk for gpmc and otg

- Handle otg force-idle quirk even if no driver is loaded

- Drop legacy flags for gpio and sham

----------------------------------------------------------------
Tony Lindgren (10):
      bus: ti-sysc: Fix timekeeping_suspended warning on resume
      bus: ti-sysc: Check for lost context in sysc_reinit_module()
      bus: ti-sysc: Add quirk handling for reinit on context lost
      bus: ti-sysc: Add quirk handling for reset on re-init
      bus: ti-sysc: Use context lost quirks for gpmc
      bus: ti-sysc: Use context lost quirk for otg
      bus: ti-sysc: Handle otg force idle quirk
      bus: ti-sysc: Drop legacy quirk flag for gpio
      bus: ti-sysc: Drop legacy quirk flag for sham
      bus: ti-sysc: Fix variable set but not used warning for reinit_modules

 drivers/bus/ti-sysc.c                 | 276 +++++++++++++++++++++++++++++-----
 include/linux/platform_data/ti-sysc.h |   3 +
 2 files changed, 244 insertions(+), 35 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
