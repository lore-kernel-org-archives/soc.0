Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C973CC433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 15:14:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9718664EB8; Tue,  9 Feb 2021 15:14:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B00A64EC6;
	Tue,  9 Feb 2021 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612883651;
	bh=vF369+zbhpiQ45k/ZshjP1Py4rriN3NsCdst7RvcaHA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hy4q4lhxfTgCnAI52aGiwt/3XRkusFSkxzFTMw3oE6CdQ/MzTha8yPvT49BvKBl0H
	 NCm6RQhOHhlplmzq0nUSQg9d67/EAs0Be34kSF7cR5CyC7Pn6XKg/po0/h2Qql6910
	 rfr7xw6RpUAX+xBv2okBOSv6Cbb9mp0Qi9xwWsB0kqu8+R616uEwfrvaPA9gyGHu5P
	 Zt8od+g9mYDaoki6JnM92w1QLrhvfa2kdWvkew1V44FeJblyXhCy77dT3PconIxFf+
	 9uh6EexOUsQHlrp3c6WZilLD6zF4XBXNYNu8P7sv0D8EEtnKkzUawPARAvDXi/KdXJ
	 aH7FMKp2fqEQQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.12 #2
Date: Tue,  9 Feb 2021 16:13:55 +0100
Message-Id: <161288360578.2910447.16931908601286064983.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208115753.54730-1-nicolas.ferre@microchip.com>
References: <20210208115753.54730-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 8 Feb 2021 12:57:53 +0100, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is the second batch of defconfig changes for 5.12.
> 
> Thanks, best regards,
>   Nicolas
> 
> The following changes since commit 00a1aa475f507454fab82f02c6230c8fb2312a12:
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: cfc9e56311075d25ebb3031dc1c0fd27bcdee47f

       Arnd
