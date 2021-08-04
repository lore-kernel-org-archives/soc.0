Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D893C4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 13:57:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EEF9A60F14; Wed,  4 Aug 2021 13:57:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AF6F60F58;
	Wed,  4 Aug 2021 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628085423;
	bh=CfPh8n7X/2HlYs0NevM2NSTKLSxtkrFdu5Iu+5YSy8I=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xe84NgBFKitEXuISRyb4yeDj7QWpCq9GBv00gTgsZ9m3nD5iB8GV2ppSvcvbpyai3
	 TOmQVJd5ZetVLCAASFW4+ZnY5qMdpHmYGqUNqvCfHf6RQn/fI0D8kdSihmR9mxcPmh
	 GPP9J6E9rLhMAPpYhoLpLzlCxTowwkBqpWNpcrgJw/TuCLrC0d5+rhrMy7qnXd+l24
	 CCQd+nkkR5MOjjNRv6wVo6VPbcTaf6iFMuW+tdFweMeXX0gUw+ggoH5YkF107XlN5W
	 3Im7CUZ9rWxLeANMbRxFbtoA6qYcMJsPjKGpybszDcBsNkjk5/tmc5sGti0SrPC9Sj
	 jTYvKoGAijDuw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	"nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Eugen Hristev <eugen.hristev@microchip.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [GIT PULL] ARM: at91: dt for 5.15
Date: Wed,  4 Aug 2021 15:56:57 +0200
Message-Id: <162808541220.328977.6437198660609674733.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804085000.13233-1-nicolas.ferre@microchip.com>
References: <20210804085000.13233-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 4 Aug 2021 10:50:00 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here are the dt changes for 5.15 which contains addition of SAMA7G5, some
> enhancements to current boards and a couple of (low priority) fixes.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8e816b9915a136c12ab726e92412b917d7e514f7

       Arnd
