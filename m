Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B979C2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:51:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41C53221FE; Mon, 23 Nov 2020 16:51:17 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 26B2D208FE;
	Mon, 23 Nov 2020 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150277;
	bh=SSZV533nhoCn0ttN2B4umxPv8o/nC6PYQ0aNgTTDDww=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQgwV3HQ2C4gvX04UP2FOoXkU3f7Qp7XcWSenD2zTLf+FjKL7+1wmLC1V9ocbA4wb
	 s9eq26afhgUT+zbsFSDRQlQsZ356wIBpilXP6kcTiChGRlDEiax9jNkDiPyLd4UB00
	 ZwwqCkCRkk20m3EchpfPfdMCzFl07nkdqoo3+p1E=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>,
	soc@kernel.org,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Sekhar Nori <nsekhar@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: ti: Enable networking options for nfs boot
Date: Mon, 23 Nov 2020 17:51:07 +0100
Message-Id: <160615024268.69722.9413431985122966464.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030124650.20349-1-grygorii.strashko@ti.com>
References: <20201030124650.20349-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Oct 2020 14:46:50 +0200, Grygorii Strashko wrote:
> Enable networking options required for NFS boot on TI platforms, which is
> widely for automated test systems.
> - enable new TI CPSW switch driver and related NET_SWITCHDEV config
> - enable TI DP83867 phy
> - explicitly enable PTP clock support to ensure dependent networking
> drivers will stay built-in.
> 
> [...]

Applied to arm/defconfig, thanks!

[1/1] ARM: multi_v7_defconfig: ti: Enable networking options for nfs boot
      commit: 8195fceca0316c36c87db25750a5c5db84ded4e7

       Arnd
