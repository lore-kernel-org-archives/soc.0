Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41B9C4320A
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 14:06:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8E9E660F22; Wed,  4 Aug 2021 14:06:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1D5F60E52;
	Wed,  4 Aug 2021 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628085965;
	bh=HvEWF7JuyNJklmFh71f36kZl3uxBU3pofSwou0L+lf8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CwzVRssEoPw3PuBwDWuNUH7AMEhGTOrVbvkA0islivPcQ5Mvb/ke6k3HAxkaL1VFQ
	 imJamjgO+MXbP8ZrOG1fSXFxcp/NDKAMPTW8CvdPGtWevOaByz/ykFhnSZ66ZVJ01e
	 RA4RyMayKjhV5Y4WL2u4Ts8pY6KqGt3LAeXduIyI+7yRYkDCY4wrxLrB1BFQjiI9NH
	 LzLgWL8AuGFjLYC5D+GTVgcjtYA+gX5BilN4RN6xulFFmP/qGpo/V2kha4yCXD9qyo
	 l5Jl+/misjxxYLj3V3wkc9op6GG4u0Jr8riDvOIff+eshR+UATdd9FUqVfM+rCor0O
	 jysFGtVKgW1oA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [GIT PULL v2] ARM: at91: soc for 5.15
Date: Wed,  4 Aug 2021 16:06:01 +0200
Message-Id: <162808595100.690655.10542947732336817960.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804084316.12641-1-nicolas.ferre@microchip.com>
References: <20210804081721.11093-1-nicolas.ferre@microchip.com> <20210804084316.12641-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 4 Aug 2021 10:43:16 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here are the soc changes for 5.15 which contains the introduction of our new
> SoC family: the SAMA7G5.
> Note that one header file is shared with the clock sub-system. We synchronized
> with Stephen to make it appear in this Pull-Request.
> 
> - v1 -> v2: text of the signed tag aligned with kernel revision targeted.
> 
> [...]

Merged into for-next, thanks!

merge commit: 318845985fa032a865784ef5373f182fcdf037a9

       Arnd
