Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5491C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:25:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7280564DDB; Sat, 30 Jan 2021 11:25:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7460164DDD;
	Sat, 30 Jan 2021 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612005903;
	bh=WSYKOJu9J70X52xF17YT4q3tFjXR3LzaFrcvnDbDj2s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mIdxqaMUwMNszEXZ0n2/zW68kDnXxAjbBo/uVV+N1jMafaH0ATPBQmEnH/S0C9mK4
	 AMNegppHEyLLUof28VMbQQgYL43qU/dC5trc8Axbr3Gkwy3SZ8Ffv17VXQEd3fINBD
	 kUfS4/adwGQoz68SYfduSyep3MB/PjuQOXczpmAaWQK87pcJ/a8QxwtCZFm2VakHIk
	 pd9HOjgr7dDfaKYVYf3S65mufNjKiwsK4JoalpBiKIN202Y4bBnbqzeeY+JzpYiLk5
	 aegcraWLPN4975FRUIhB0xnvi+99ORkgkesrvynCy3dSEdjZjDp0SFGDZcl9uNHANT
	 NiYdS/8bbYW0g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.12 #2
Date: Sat, 30 Jan 2021 12:24:56 +0100
Message-Id: <161200588882.1995370.4365069809706581847.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129090030.26976-1-nicolas.ferre@microchip.com>
References: <20210129090030.26976-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 10:00:30 +0100, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is the second batch of soc changes for 5.12. Actually first batch was
> consumed as "fixes" following our discussion here:
> https://lore.kernel.org/linux-arm-kernel/CAK8P3a1v=_4E40cZjZ-ff7vs84XE9XaxwdoGW7Rf+LYiA+TCTw@mail.gmail.com/
> Note that v5.11-rc1 is the root of this Pull-Request so the 2 first patches are
> the ones already taken as fixes.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4940b9919119906ba37b3f00611fd5e9be587946

       Arnd
