Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB0AC433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 07:18:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CC16A61107; Fri,  9 Apr 2021 07:18:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31F1561106;
	Fri,  9 Apr 2021 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617952733;
	bh=erpf8KSRcf4FLggTMlD5I4hgo93HGVjD4OIE1sbUsog=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dv32ruHeECbKO9bC7xRuREeZj4Q9I0AJrhvm3bGx2LRVd//jj+5XsSHOACELaMjXH
	 ZYwgR46CgXU529IP8/6CP78MzME0/xOFoua5TLYWTnbTA3z2bCsPwPBT8jpKU2tzAk
	 Elg3TXcVy1UD4MOJ5aSS6EpbiXdTfhKxrpdxjPpGryZDtIK4Kq0cTSuRS/Jn7HO9EG
	 JJw8a3V2Qqx1dBFdO/5bkPvRGjgfN0f7VojrEuuBKAyeDO43l5yeI6HCz0Wq6QTm79
	 bx96W/3gUwc93Q4R2Xh++2HpRJM65gX9ZuJl6w6RxkyQ96c/36AWDKwxtlabh+JUa7
	 /vMvUgjrSQU1g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: nuvoton: Add WPCM450 support
Date: Fri,  9 Apr 2021 09:18:49 +0200
Message-Id: <161795272593.1750291.13960701815040145569.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xdj20TcJckH8fx757ACa4hT4j3bZEctT0Przjv8XJd7KA@mail.gmail.com>
References: <CACPK8Xdj20TcJckH8fx757ACa4hT4j3bZEctT0Przjv8XJd7KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 9 Apr 2021 06:46:27 +0000, Joel Stanley wrote:
> Here's a support for a Nuvoton soc contributed by Jonathan. There are
> changes for the irq controller, timer and serial port that have been
> merged by other maintainers. I've picked up the arch and device tree
> changes on his behalf to go through the soc tree.
> 
> The following changes since commit 09e6d2b71ae673dccf9f59f0fc1e17109113b6f4:
> 
>   ARM: config: Add WPCM to multi v5 (2021-04-09 15:18:40 +0930)
> 
> [...]

Merged into arm/newsoc, thanks!

merge commit: 39b95079f68cf17888a4cee93ad3c4acc3854b38

       Arnd
