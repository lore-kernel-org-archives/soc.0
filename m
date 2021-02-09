Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE16C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 15:14:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4712464EC2; Tue,  9 Feb 2021 15:14:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC81064E88;
	Tue,  9 Feb 2021 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612883649;
	bh=sISzvmFfKdR/yd4UNKJ8qSPNAWkQd3BSlSYsCkUMJhM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XD2A6Li4r/dXO0whxcZnDmuu/P73XO2fL2ehEGTMwh4JNkJa2T5awiPlQNM/GqFyB
	 HdkqyU+JZwljLIKEZyBCC6Orm2p9wji+7AZpvar74qpOyYVWrnbJ6kJXTpHhsKpwHC
	 AZaaOawU8S/PMEcaqGW+EBY5fzDmWOeI3FOCR+tqrhEO4HTkG2lyR0SmLQcy9Q2Kbl
	 q9Paeu97wj3U8n4m44SJaEhZ8KhingrFKdOoZv8b5lR+YxxMtcHgGxWsdZ3dbrF3kS
	 PYkQ29m3KBPA0D8pk3/EJq0qXEUvjHaJarsrmz/nMMbJ7ityXqrWIzNGLcAaa0w/sa
	 aYPJ9+ngYI9mw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: multi_v7_defconfig: amlogic updtes for v5.12
Date: Tue,  9 Feb 2021 16:13:54 +0100
Message-Id: <161288360473.2910447.10678299620796355576.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7hsg6d2bxg.fsf@baylibre.com>
References: <7hsg6d2bxg.fsf@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 03 Feb 2021 11:23:07 -0800, Kevin Hilman wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: f7d62396798cac36dc1ea530afc3e560f52ce327

       Arnd
