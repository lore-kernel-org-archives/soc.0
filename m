Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355D6C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:31:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0AA9D64F4B; Wed,  3 Feb 2021 12:31:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B21B64F87;
	Wed,  3 Feb 2021 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612355499;
	bh=oS3ZsFsgy7Rk/fmspwaRx/BuhNweOte4igOFT7mQkIQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ViontBEoNtYKgCypK6CzFw0MzVmVDV87NT4nneSXE81Owud7dSdhc7hVOup4Elq9l
	 3JNqi2lY5O47PYIAgVE4ZSl2sRbImtjWNaBr5PZSo/LT8c5m70llFa70cBqGUboZRv
	 fO4bCuqm8tUQZdqduwR/ubYKPVc58v3JZFsbRdWxtJKMonrhTx56uFfmJ3GUPVFNMk
	 etfy6DFF3BDZ+K6batDdlhfYsRi6HEl5ab8YErgvns7Y4B3Vb7l0FHiAmRGZduIm9W
	 2XfE2VNGdvM6qfxA5E8Jz485mVhXjhWfNdkJTexzP/Yu+ofqfJoRFYNjk3zbfTdeKT
	 +dfjgAR+gnnNQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v2] ARM: dts: lpc32xx: Revert set default clock rate of HCLK PLL
Date: Wed,  3 Feb 2021 13:31:34 +0100
Message-Id: <161235548531.2002750.2897549125435385468.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203090320.GA3760268@piout.net>
References: <20210203090320.GA3760268@piout.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 3 Feb 2021 10:03:20 +0100, Alexandre Belloni wrote:
> This reverts commit c17e9377aa81664d94b4f2102559fcf2a01ec8e7.
> 
> The lpc32xx clock driver is not able to actually change the PLL rate as
> this would require reparenting ARM_CLK, DDRAM_CLK, PERIPH_CLK to SYSCLK,
> then stop the PLL, update the register, restart the PLL and wait for the
> PLL to lock and finally reparent ARM_CLK, DDRAM_CLK, PERIPH_CLK to HCLK
> PLL.
> 
> [...]

Applied to arm/fixes, thanks!

[1/1] ARM: dts: lpc32xx: Revert set default clock rate of HCLK PLL
      commit: 5638159f6d93b99ec9743ac7f65563fca3cf413d

       Arnd
