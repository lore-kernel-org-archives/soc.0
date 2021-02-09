Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC9BC433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8935A64E54; Tue,  9 Feb 2021 23:06:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2265364E57;
	Tue,  9 Feb 2021 23:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612911995;
	bh=9YckVoh99k0PrrQq2KqKYIvjQiEOYXO6rHCjaSjFj6I=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVKLJe1yPw1/n6LwmzInl36ikv4ezSItsNi6ALzvt0E8jNGpoAtzcbgM2hHtFlGYG
	 0Bc1/nJWUDonqun1OCN9YTnF5Ey0qdA+5vmL/sOrHKlOxfSlagwSsulbMkqwuvHAxr
	 Gffo8InVG/TAGrYm363sPQD33bflMGT3F+uaFvonuFMuJZFwtfA0gPYgjr1V7z5Ckb
	 zvtUR/K9YW9FBCZOKH109bxdK1+aVMzdsgYueZTvK1scEam0ZQ3+7cxuCrIAO5Yxbr
	 nsWAVk4GQElEeW0IIPVuLT7wTqJGBAwHuj1U10/q7FQDf3Ee+KXffnXn2eWiw02jUo
	 DtOcvIZh0feDA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: dts: amlogic updates for v5.12
Date: Wed, 10 Feb 2021 00:06:08 +0100
Message-Id: <161291108049.974605.5648830104662503715.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7ho8h12bto.fsf@baylibre.com>
References: <7ho8h12bto.fsf@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 03 Feb 2021 11:25:23 -0800, Kevin Hilman wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 02bb4cb4c463bcf656d1d2c20ee8a41ff5a09da8

       Arnd
