Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7044C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:34:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C12D864E0A; Sat, 30 Jan 2021 11:34:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A6FC64E09;
	Sat, 30 Jan 2021 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006471;
	bh=2qs7483GGZeRLFTvVTEu2jS2FV1D6gROSm3E0p1DI+c=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h9dzqpN7F/Zumv6xvlJwvp4z5yQG8QrbwtpZTb5NBX7lQ+YI2cDitsFZ+WCNvHrkX
	 scSUjSgjNBmynZbXisrqLoCyQrdKD55VLZ4UTOyEp4PFxiIUEdxd4Rct2B4ZK+suk2
	 MCVyztNiJNW1ng9nSGpnZm3yt3QfIi0nrBY76m8RVKhchu9OegQ3J62u4RmgQybwgz
	 iFgS0o/2aNH1HKxPBgUiDMM0zb6zoTiBrEo/iaUP+JRjx2h0x8+VWtrQ+XUsC49p4Z
	 fByCdv91iTakjBiITVmOSIAeBPLV7lJmb/9Svd8ymdKRj9m/JZ3loP5IRN+Fz5o+dA
	 wiv89pJx6PYNA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/2] Devicetree changes for omaps for v5.12
Date: Sat, 30 Jan 2021 12:34:14 +0100
Message-Id: <161200641696.2316427.3450006892068247288.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1611845066-809577@atomide.com-2>
References: <pull-1611845066-809577@atomide.com> <pull-1611845066-809577@atomide.com-2>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 28 Jan 2021 16:45:02 +0200, Tony Lindgren wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/dt-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 2226c894135e536bf252a6b0570924908740b558

       Arnd
