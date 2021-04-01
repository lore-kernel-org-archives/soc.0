Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A42BC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:07:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2AA0061106; Thu,  1 Apr 2021 21:07:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55D6161104;
	Thu,  1 Apr 2021 21:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311233;
	bh=+IyFaEeld/hHrmelBpdh9f+gakfqfNokrR6R1m0Md8Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q20rjdys0yl0gMi5MWXxG+/AVFkGstrSDI+Y04MCXK6yqDfqDYdsuBs0tVBXgP4my
	 o+B10x6Ava4oZ/e1SvULwCCbaMxy56bPElsPcegTw2rLaWPfswDOv/5ZhaSEu6eix4
	 a5K8XmwySR7lJh6fEwi/ZxD7yK26Cxo3uHyQVXN58DH86eM1SfiZFdA+25yO/JxtuF
	 A4T7KShIkaJI1SRrah2VaWk2IgeaboEN64zSPr45OU3KNplonkLpJRGcG0EtTBx1f3
	 8s7ZUIR6AsSQSxMTo3hhiZSmH9+cS2Z0mEVRKa0TpMuKmzAFiK4NTP9W27CqpwnMzT
	 bj7WRvovLW1mw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.13
Date: Thu,  1 Apr 2021 23:07:04 +0200
Message-Id: <161731121872.663132.5899374227891115109.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401174544.32193-1-nicolas.ferre@microchip.com>
References: <20210401174544.32193-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:45:44 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> One single patch for now on our SoC branch. Stakeholders agreed to make it
> travel with at91 -> arm-soc.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 6f35f62958ea395fa8cbd2a28f713ccac8d9b5bd

       Arnd
