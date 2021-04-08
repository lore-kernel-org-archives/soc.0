Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3606FC433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:24:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 16B4B61130; Thu,  8 Apr 2021 15:24:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9771F61131;
	Thu,  8 Apr 2021 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617895498;
	bh=ig6+AJ8TVdbxN4XM6/vM//3nMIEuURo8C7OVen6PvIM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oGByFWi1NcNNHmaNVY/gZRQmdZcz3Mgwh46tNrjyOxDApbsOEXZuBcoBy9gYsxmcu
	 Iirbw9S+hbAzkVi3iPOZ/m0diaglvX1s+CAoQTCuTZtw8+TTAPjpH1NGIiW7cDNc//
	 Jplgy6b4SEddS+44A0jQX4rxQtFjVNluvsaErszpupo2T0N0PMfnGx30TtNIIRdf8C
	 hVJZWr2030FuSQmtaxMcW2le5Fi6U/GIXIefL/6grP4OlKeJHX5Kl601DzzmFuaZ+x
	 AXIXK1/VKYl2gMcXk1zOHexXMnFmi2u7j831LxifC3msDaUymiD81qqWwKmz0QFHfL
	 juwXdS2QykaLA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linux Kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] ARM: at91: dt for 5.13
Date: Thu,  8 Apr 2021 17:24:25 +0200
Message-Id: <161789493817.1630479.5024717274217057698.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407114415.13180-1-nicolas.ferre@microchip.com>
References: <20210407114415.13180-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 13:44:15 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is first batch of dt changes for 5.13. Please pull.
> 
> Thanks, best regards,
>   Nicolas
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/dt, thanks!

I saw two new warnings from 'make dtbs_check W=1':

arch/arm/boot/dts/at91-sama5d2_ptc_ek.dt.yaml: /: 'etm@73C000' does not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
arch/arm/boot/dts/at91-kizbox3-hs.dt.yaml: /: 'etm@73C000' does not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'

merge commit: e2b064fec8e49112f7dac779fcec12ded40728c2

       Arnd
