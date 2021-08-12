Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA94C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A9214610CF; Thu, 12 Aug 2021 20:44:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 617C0610A3;
	Thu, 12 Aug 2021 20:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628801056;
	bh=3oBMhQTsZ0JGmoRoNan1Fu4e/2ROq4vLcJGLs+VXjQs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kveoZYmEcRWdKMSslWCl833egZjWoeUiv2XV5POnBpH2goTk1uB9vb61JgHmfrNg1
	 NFHvVfqG1/j2kDKYVXp3nZeCoTgbK9jktfgWuJ6dO54FXsTUJ7POm/3j1i285JDfKA
	 tv9VURxE+hW/wYypxhl6idkgauHD0Dr/bEO7TpN5BksHVZuFGeGHzwGITW6HN426ie
	 EzywVW/4HiI40dI42eEwBvwEAapz9EL8qr54rs4eq1xpRf9Rob2R8DpHJ3EkqWocWb
	 PdKzuGkTlyb29C+Dv9VYHxTOpB5pszRerZ7SAgUNjIie66hRHqjGglgY+luT7fg0IX
	 IugecXToOP+wg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Fabien Parent <fparent@baylibre.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	CK HU <ck.hu@mediatek.com>,
	Bilal Wasim <bilalwasim676@gmail.com>
Subject: Re: [GIT PULL] drivers: soc: mediatek: updates for v5.15
Date: Thu, 12 Aug 2021 22:44:02 +0200
Message-Id: <162880092618.1372486.1035988848948197417.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <49fc7bef-20db-b98c-9437-dd9e4d00e870@gmail.com>
References: <49fc7bef-20db-b98c-9437-dd9e4d00e870@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 14:19:57 +0200, Matthias Brugger wrote:
> Hi Arnd,
> 
> Please have a look for the updates of the SoC drivers for Mediatek. If you
> wonder why there is no binding patch for the MT8365 mmsys: The binding was
> converted to YAML. This got taken by Rob. To minimize merge conflicts I left it
> to him to take other mmsys binding patches. Unfortunately there is one mmsys
> binding patch taken by Stephen through the clock tree. So there will be a
> trivial merge conflict (although not in your tree). A bit of a mess this time,
> I'll try to make sure that the bindings for drivers/soc will go through my tree
> in the future (which will make my life easier as well...).
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: a8c371f0cfe7224e4bc3f3f0495e54a035107653

       Arnd
