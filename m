Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B288C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:06:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0FC17610FC; Thu,  1 Apr 2021 21:06:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C481610F8;
	Thu,  1 Apr 2021 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311179;
	bh=GnlnrZeHQmh5URqHOwRmdXDU7wm6gWjQ/3A4PNbkYyM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lvr+nVu3TDHOga7mUtFNACiadGLekBH4uEmnVWbw3vMQTiD+jMHfa82gRTPEPIhtr
	 SvO4urmP/8pTE5ZXQ0YqzUR67bBY8SYf80M2bjaYtL+emHHjDq1Y7r2gm5Pd+Mw/iu
	 Q3CjkEXDtIeDYtido8s2MRCOlRp1tl14Kcyf1D7EaEUFMM9Fg5lzA5cXLY2TbrISrX
	 zAbSIOxTJ0/k152JTFkl3VfZcXcMiXCdwDNIIXULZNnx+G5UiMmHbTOTJKASCsGceI
	 6M2RdRkN+3HIi8+HFV1bshgj6QGhL1aZPPxzpdbG5rb1zWVHGobTyWHZjQC89KlfBm
	 5bdT4A5qMeZlg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.13
Date: Thu,  1 Apr 2021 23:06:06 +0200
Message-Id: <161731114635.662954.7067488075603315200.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401162207.29299-1-nicolas.ferre@microchip.com>
References: <20210401162207.29299-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 18:22:07 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here are the defconfig changes for 5.13 which is bigger than usual for aligning
> with options that we use frequently and some changes which will be beneficial
> for CI.
> There is an update with savedefconfig included, tell me if you prefer the PR
> without this first patch of the series.
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 630bc9784b637eac9266d7133cb8698c5507ae7d

       Arnd
