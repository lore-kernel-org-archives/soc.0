Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FE7C433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5CB8C64F8C; Tue,  2 Feb 2021 17:10:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90C8864F86;
	Tue,  2 Feb 2021 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285839;
	bh=XcUrcconZBoVwljDtRrz0i6sZfRdOVhysC6GamICygY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kBzwUVpHu4am1LGv32E7kBjLSq9G3pGWQHZ01ggwJhuqDtkTokFAlZaVU+VQbbNzS
	 hJQPNuAhCEfRF08YF8+olsLBNm5xxsQS8reXhZbztyIzF/OFMn3EmBHOHPMGR/9p/z
	 l953PF9Ih53gr/a+txFw2IGwjbyZ7pEjMai5J6BCOshGRiZ/dvA2thquWjx/ziyruQ
	 4v5WrUvgxY81Ed5bjts6K0Jj2fn/7QztBb4O2xmyjH6NpfIVMLXUlV4DMlebfIVmEf
	 1XGfKm9oIDQW4r0msPyFLqwIweY1Yf2KSvbLnPyssS5y7mMFtt2MrjZIfNRTBnFDUk
	 eZVE6RmrEjYXg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 2/2] arm64: TI K3 DT updates for v5.12
Date: Tue,  2 Feb 2021 18:10:14 +0100
Message-Id: <161228552194.1852435.5824728761330791687.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130131422.yvq2edxfongys7x5@pendant>
References: <20210130131422.yvq2edxfongys7x5@pendant>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 30 Jan 2021 07:14:22 -0600, Nishanth Menon wrote:
> Please pull the following device tree changes for v5.12 cycle.
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c2f76057d3e6ca318d0aac83731d365865907c29

       Arnd
