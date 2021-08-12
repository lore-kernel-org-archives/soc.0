Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53853C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:08:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 30BF66103A; Thu, 12 Aug 2021 21:08:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 096276109F;
	Thu, 12 Aug 2021 21:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802528;
	bh=JrgeX0TDZtEkb3oZiJcAfhQ5e1W+KK9TRVrxjWwwBkU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uZqqDkpq37DHzFuVHkOijzXDjdpIRog2cX40IOWgnKleIGKXociAy2BdwB8Jvn2S7
	 s6FmWY9wnhluWRqjcM5RgK/PPR8RYSPFUrfUXitmXwOl2TjFPxXTW89nNBghOaepV9
	 J3/vyAAT5ArzTh79952UB+bBPMVRdV8+3UGIFxlYuNVZ5ilty41BcY/tOkI7WF4IDJ
	 BXD5QNBsfB5RC1pJOJ3kTihL+gJCsDHvKEhYNmXIG4IpobvcMZqDeGymJGEYa75Pp9
	 WTWxbdQ8XsigcL60JGm+hX1G0hgIzoGJNnIBYyz9K1OqqeRY8oc/2737sYUOd2UNPs
	 brZtq0HOQ4OeQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [GIT PULL v2] ARM: at91: defconfig for 5.15
Date: Thu, 12 Aug 2021 23:08:40 +0200
Message-Id: <162880251645.1376866.7366771530454558975.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210809134521.10155-1-nicolas.ferre@microchip.com>
References: <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com> <20210809134521.10155-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 15:45:21 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is the second attept about defconfig changes for 5.15 which contains
> addition for SAMA7G5.
> 
> v1 --> v2:
> - add more information to the tag message for explaining why we prefer
>   a new sama7_defconfig file.
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: b528dede9bca2afc262b841757fa994bd035cb43

       Arnd
