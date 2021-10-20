Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B67C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5364611F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5364611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kZ1qrp24YifEjDK7ZsSNIgj2ctU3hK+Zrq3TqcwQ+2A=; b=Om54+kcDifce+q
	hZGm1Y7TVwwCRrJbU8qSIHOr+5tX1MbdFsbAIxHT3ZvjpTfxy+jqePGf83EwyHyMTbPgAUrk8MN/W
	836scuUIz/kBv3+eCzh7l0U0Z2cZcEp7VpfhoPk/9TfuRu5sjmTZp55MM06Gnx6nL+mEnhA7z9jlz
	W03Iu2HjMwAAhawtPaA5/7H0dpEi5gKmGdt8OyZyJ3v3MLStgFfvmCihnGj70197nkd+JpH2hpg+k
	Tnyhz04E8w04CqGIkmonZxIIvY8KkNl/KkdnFSchQoz2sm/ukO583nVaS9s5YduaSPx4E78cHnQ9n
	ClV5JnI0NAfmw8Le4pFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdEN4-005EJ3-8V; Wed, 20 Oct 2021 16:23:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdEN0-005EI5-AQ
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 16:23:15 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mdEMw-0000xn-Eq; Wed, 20 Oct 2021 18:23:10 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mdEMv-0000lF-QX; Wed, 20 Oct 2021 18:23:09 +0200
Message-ID: <96e686f78f0e42bad666df5ec0cbcb2dcdc270a3.camel@pengutronix.de>
Subject: Reset controller updates for v5.16
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Wed, 20 Oct 2021 18:23:09 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_092314_384331_0D3B8D90 
X-CRM114-Status: UNSURE (   9.50  )
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
Message-ID: <20211020162309.3s6hRTWnW_IWOdyXhOc7rpiHUNbh4PyBbDdguUon4ms@z>

Dear SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux tags/reset-for-v5.16

for you to fetch changes up to 8c81620ac1ace77dd0cbcc2193d4c7311f77d49b:

  reset: mchp: sparx5: Extend support for lan966x (2021-10-18 14:09:57 +0200)

----------------------------------------------------------------
Reset controller updates for v5.16

Allow building the reset-brcmstb-rescal driver as module, add reset
lines for the Uniphier PXs3 audio and video input subsystems and
bindings for the Uniphier NX1 SoC, and add lan966x switch reset support
to the reset-microchip-sparx5 driver.

----------------------------------------------------------------
Florian Fainelli (1):
      reset: Allow building Broadcom STB RESCAL as module

Horatiu Vultur (2):
      dt-bindings: reset: Add lan966x support
      reset: mchp: sparx5: Extend support for lan966x

Kunihiko Hayashi (3):
      reset: uniphier: Add audio system and video input reset control for PXs3
      dt-bindings: reset: uniphier: Add NX1 reset control binding
      reset: uniphier: Add NX1 reset support

 .../devicetree/bindings/reset/microchip,rst.yaml   |  4 ++-
 .../reset/socionext,uniphier-glue-reset.yaml       |  1 +
 .../bindings/reset/socionext,uniphier-reset.yaml   |  3 ++
 drivers/reset/Kconfig                              |  4 +--
 drivers/reset/reset-microchip-sparx5.c             | 40 +++++++++++++++++-----
 drivers/reset/reset-uniphier-glue.c                |  4 +++
 drivers/reset/reset-uniphier.c                     | 27 +++++++++++++++
 7 files changed, 72 insertions(+), 11 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
