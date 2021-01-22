Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C213C433DB
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:44:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 51CD723B06; Fri, 22 Jan 2021 22:44:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6262323AC0;
	Fri, 22 Jan 2021 22:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611355475;
	bh=9YP7ipLErGJnRUfQLW6l/YKDJtN6RrzTjBy0SDIPAB4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbN8DHecNOxjhPFst6WlVkzRxuqcS0lDOPSjfic6RDm32+9cDZ3DQbhcGzv7MBbCJ
	 0cZhadOEXCRIzjAXFIdJ4nwC9BAYAFmksXUTUcQv/3yhqjnlPcwSJ9Vmb0IEilhVFN
	 SrIKS/WWgbV42tZ2xKanWUbdYxbXinNWb3yDEaDRCOo15R9pJjQ5+Da2RVwKYAIiRB
	 I05iUMJ+0+mmNEnmYbPzGsbZ3NK4Q8nuu1C+X7MRAYtPROc0aLj11gIx2T1p7BvYLZ
	 Pau2XWy3IAgRWIBEYrK6D56n2TXe5gpCTYs14AiTqV9PIw/TbeCt8uRfwgXaaE4Fpd
	 dQNAZI1I7rwTA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.12
Date: Fri, 22 Jan 2021 23:44:27 +0100
Message-Id: <161135545374.1320625.12711401805152999993.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122144638.170565-1-nicolas.ferre@microchip.com>
References: <20210122144638.170565-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 22 Jan 2021 15:46:38 +0100, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here are the defconfig changes for 5.12 which contains the removal of old
> wrapper code that we called tclib. No such config option to be used anymore in
> next kernel.
> 
> Thanks, best regards,
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 2cb2b2c9d9f06356d8b00e8afdfc3d8449c3dd95

       Arnd
