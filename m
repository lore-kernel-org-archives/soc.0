Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF5BC433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6349364F88; Tue,  2 Feb 2021 17:10:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 940C364F8A;
	Tue,  2 Feb 2021 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285828;
	bh=n1En1YLsvhIFHDL/bHDovjiiN1YH8YRRfAM3SkCGU3o=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T8GVO+Lv7frIDNOIlNzFe650j7WZRajEmJItiOhuFwjgqx+TGhdOfFiJv537mGrfm
	 m80YznJMeajrl+cctwYJGpq0ft9j+KCAE26D1INA/vka+WNI1hXAv9/Xo4r8kCHDch
	 x5d6EGwMtks1wdI0nRqYX3pa0Z3n/WdI+imamBVqwhu99/m8XcEjeyKccTRbzG9RJf
	 M7J5kjalT0s/3+biRPzZDg9uz6Uw2QTcz3UwTxDeoWMyR6xNmN/E0Sd7CQ5HyxHyBO
	 d1NB8BWDSEzmxfe53VWuUVnI1usN7OeQdsItA0He9Kg4wSfvLZuTqfG5a0dqSaZ5gw
	 H5fxw+nWtrCIg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.12 (#1)
Date: Tue,  2 Feb 2021 18:10:09 +0100
Message-Id: <161228552323.1852435.8043125783469757212.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87pn1jn48s.fsf@BL-laptop>
References: <87pn1jn48s.fsf@BL-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 01 Feb 2021 17:26:43 +0100, Gregory CLEMENT wrote:
> Here is the first pull request for dt64 for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 481d73c663e138a256988beca54152545ad265f5

       Arnd
