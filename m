Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508B2C433E6
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:25:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1FEEC64E0A; Sat, 30 Jan 2021 11:25:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE4FB64DDF;
	Sat, 30 Jan 2021 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612005905;
	bh=Cx/wV+Y/fgtydB153xG1RMAFwtjtQQZMqie8uEQTpho=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kXldFouDDSljdXXah2p6lu1v92loEQHvo6ULiwSZjlLpfTL5XF3wLXBx1i5WWlZXb
	 oadVTgVoLcIsl79rkb0afMy4Ih7p+xrh+88szlVprx0UNUY+TrB849GFzNl0Ng6Q0I
	 fR8UwWJVucuFpdOviwccq0JpU72qLEJfCphUie5/78ppnycOrOE5/cQtEW9es8lLZe
	 /OWNnjJTp7Gsmar0F8kAax8TcbEZ5aFtukJw4MlT3S4KBJggU8ZpgLu6VlrOzI2A7k
	 10mCuHXUDWKqWI92cIVrdEAVitBhr931lfi0/It979/ousAzhxUd06AQmLrs9Mq45v
	 5ATM8bJl2zygw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Philipp Zabel <pza@pengutronix.de>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Reset controller updates for v5.12
Date: Sat, 30 Jan 2021 12:24:57 +0100
Message-Id: <161200588866.1995370.6659304756660517573.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129153108.GA26994@pengutronix.de>
References: <20210129153108.GA26994@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 16:31:08 +0100, Philipp Zabel wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 7cc623b85aef7a336152f5cfc28ef5622ded1351

       Arnd
