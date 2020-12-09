Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E45C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 20:30:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6963823B99; Wed,  9 Dec 2020 20:30:47 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-gpio@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	w@1wt.eu,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
Date: Wed,  9 Dec 2020 21:30:37 +0100
Message-Id: <160754580092.2405127.260900206618066279.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 29 Nov 2020 20:07:57 +0900, Daniel Palmer wrote:
> At the moment the MStar/SigmaStar support is only really
> capable of shell from an initramfs and not much else.
> 
> Most of the interesting drivers are blocked on clock and pinctrl
> drivers and those are going to take me a little while to get cleaned
> up.
> 
> [...]

Applied to arm/dt, thanks!

[4/5] ARM: mstar: Add gpio controller to MStar base dtsi
      commit: 74530d645126c2934b16db135edaef16eff9e35b
[5/5] ARM: mstar: Fill in GPIO controller properties for infinity
      commit: 5b8a05b9e8d10c8df29bb719e73ea8ed916a1eea

       Arnd
