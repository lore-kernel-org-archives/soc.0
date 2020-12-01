Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A90AC71156
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 09:19:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC09C2065C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 09:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2hu0q+EM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLggvlMY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC09C2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VndXG4oR1q5sl7AHiomwzCEWths5dUx+6E1t9AyGkww=; b=2hu0q+EM8ii/+kUR8YJCmQ4f6+
	ux423RzLD8xhVBTZ0cjP1OH/4cQanCnM95edaf7bE93fNnFT5wHLZy3B3OkZorNCiXWCV42SkF9jR
	Rzfo9yfeSXYJ0WNVqkpMaEKh+hsID0QJXSxLjeDMdVg+M3eqWpkehovLW3OpQNQiIuoY3kabzw5mk
	LAB+A3R2+3d28p2jYx9quhPu/ICGrqJAmCBMPhJviGZT2bf7SdQzd7KsTHf8gYFe9PsjsfPrrB09z
	aF16O25g8wkL9PESF7q6xThKtPndw3STGX7CPcDgUOnHRNkbqcMwpmmv4gFIFa4GLHE0ghuXrN+UE
	uRwUNvuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk1nr-0002rI-Lk; Tue, 01 Dec 2020 09:18:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk1no-0002pl-Kv
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 09:18:29 +0000
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 094282065C;
 Tue,  1 Dec 2020 09:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606814306;
 bh=x1qHkkWU4/p4llvmBK82TbCwZ2/LJIqHZiVAewVNGxM=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=cLggvlMYgRnvSlhXQ529E7DmnNTvSZhsUZkZU+YTAiTyTo0GhtnwX7hLj4TcFaGwy
 xzgmdTLqbmTkSbUrTjUDkuW+qgphH7lon0fgGPyXKBlv26Z6KGo4it/456r6H7lFow
 xVgBihyGyJZnbFY8QXTjlqthngsTp4fdIplybBug=
Date: Tue, 1 Dec 2020 17:18:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] i.MX fixes for 5.10, round 5
Message-ID: <20201201091820.GW4072@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_041828_780390_F9B91E44 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201091821.D5C0qWWuxwc5zbj2ENK11ZOFqd4GVqkLxVDhJ2V4aJQ@z>

The following changes since commit 33d0d843872c5ddbe28457a92fc6f2487315fb9f:

  ARM: dts: imx50-evk: Fix the chip select 1 IOMUX (2020-11-10 10:36:10 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.10-5

for you to fetch changes up to 19ba8fb810c60b46869acc9f455613de454e0fca:

  ARM: dts: imx6qdl-kontron-samx6i: fix I2C_PM scl pin (2020-12-01 09:20:18 +0800)

----------------------------------------------------------------
i.MX fixes for 5.10, round 5:

- Fix a regression on SoC revision detection with ANATOP, that is
  introduced by commit  4a4fb66119eb ("ARM: imx: Add missing
  of_node_put()").
- Drop PAD_GPIO_6 from imx6qdl-wandboard ENET pin group, as the pin is
  used by camera sensor now.
- Fix I2C3_SCL pinmux on imx6qdl-kontron-samx6i board, so that SoM EEPROM
  can be accessed.

----------------------------------------------------------------
Bernd Bauer (1):
      ARM: dts: imx6qdl-kontron-samx6i: fix I2C_PM scl pin

Fabio Estevam (1):
      ARM: dts: imx6qdl-wandboard-revd1: Remove PAD_GPIO_6 from enetgrp

Robert Karszniewicz (1):
      ARM: imx: Use correct SRC base address

 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi  | 2 +-
 arch/arm/boot/dts/imx6qdl-wandboard-revd1.dtsi | 1 -
 arch/arm/mach-imx/anatop.c                     | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
