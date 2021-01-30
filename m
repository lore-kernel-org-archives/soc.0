Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBEBC433E6
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:28:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 279EE64E0E; Sat, 30 Jan 2021 11:28:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C518064DDF;
	Sat, 30 Jan 2021 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006127;
	bh=6uCSVxqlCcKTNRbc8cK5W+DMehBIYTPDeCNNqE2CDEk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iyoAMQNz/w0fKpQyDOy4rwEJH1NlcsAMF9dAG6t9BeMyYXPq8M61+svhoX2fCYn7J
	 OymnQrHuh8rekQcddISby1wEL+cdoA50KG5H8VVhMCJ8q5EmcYRxI+mumRtHrmeQt5
	 Uiv33POjwpneHb6UF8ONA7EsExCwkI9SBuWwzrf37HOxpE6a1N8NPxHtm8OELfjLY4
	 PchWuYZFTVnFY7G8myUlgFiVwc0oA5Vc0IBFAZi8FGGAOFz7se0hvAFqqwPR0r3z1G
	 DZCcc1spN6I/ZzlIkkIonUUXXpBx1p3erjdKEAAKr2ZC4jgj33VkGO/QrfcEH3yHo+
	 LJuty1gO3KFfA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org
Subject: Re: [GIT PULL 1/2] SoC changes for omaps for v5.12
Date: Sat, 30 Jan 2021 12:28:36 +0100
Message-Id: <161200610120.2091874.3279867462204676586.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1611845066-809577@atomide.com>
References: <pull-1611845066-809577@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 28 Jan 2021 16:45:01 +0200, Tony Lindgren wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/soc-signed
> 
> [...]

Merged into arm/soc, thanks!

merge commit: ed8878041a0a2923ea9fbd4b7cc77f9fd7d12f17

       Arnd
