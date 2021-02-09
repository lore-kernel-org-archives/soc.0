Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446D4C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D2DD64E54; Tue,  9 Feb 2021 23:06:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA93664E53;
	Tue,  9 Feb 2021 23:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912001;
	bh=/wq8JSDUov9vAvA1GfExy59e4zrtM8zH4pEEYcvWz2w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lSeGliwYwFXpgqSQr3BHrhdCSGRvqH9eQMvgMgn2wiePp+EfFony9jzIl/EOXU2Du
	 ppy1bcmTIrvh4AFmyon5NiDmdJlgRUoHrmHmEZJ4xjHWGdVR14wGl/LkLhTIV1vdvN
	 5JzeoMANgmKDHWNSZ+Sn4NdsxoOe0JtAd8/bl7B0aTqV/vKA47Re4XAAm6DpQh9hUH
	 NnQ0yN66V9/szsDcZlOvbcCc87kC+aeSOB/EfQ28o9KU6frQmMWvtuoCwbsHBIOs9V
	 UfhtYXXryzq1gotIkHjFvjjBf6lWYlCJJgGfM0ig5jVZPxTV0ZlJfXCNNt2n1OO+JL
	 EL4Kg4wVKeS7Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	arm-soc <arm@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.12
Date: Wed, 10 Feb 2021 00:06:11 +0100
Message-Id: <161291108040.974605.3573776808485788092.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b1a6f89e-f6b4-757b-daf0-d2f1844b833d@xilinx.com>
References: <b1a6f89e-f6b4-757b-daf0-d2f1844b833d@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 14:31:04 +0100, Michal Simek wrote:
> please pull the following changes to your tree.
> 
> Thanks,
> Michal
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 638f79778d4fe79adc7d3ee72ae367982db51759

       Arnd
