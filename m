Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D7DC433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:43:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AC56623B1A; Fri, 22 Jan 2021 22:43:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D87023B18;
	Fri, 22 Jan 2021 22:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611355420;
	bh=r/9FK7ElZ/FBm+aBmpUfW/PcFO9K4iXTCjqpvu6A6rE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GhQVDBoUWE/YPO0tSGeQu9DP4saB4kWTHKiDU95bYT23vJetJsEAF/Jay5yvQHF9o
	 PodExNG2rk2n0Z4/Pv/WLPY8W2Q0zE0KEz7i5qwDQCczk9KEj5fED+QctbdmaJXk1z
	 kRfG/8YsqhvikqHrfpQzI8bVkTvYXGeP3mykjIo0XKXcYT5LXzd+XbOxtmK1kMONeC
	 1EnWPlf/bVAIGZFOAiu+j516IZm2vo5ceSnVwTPa/zB30mTd/ELWE/hATjbcUvPmSH
	 0lAUXcv8aBptsg61JEcfYemGtoHSGmJm09yEiviXZiDhCfa97E0zRatQMoFrTuRVZY
	 0np4ggcVseK0A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Ux500 DTS updates for the v5.12 kernel cycle
Date: Fri, 22 Jan 2021 23:43:30 +0100
Message-Id: <161135518054.1310202.13935421445644015382.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACRpkdbn=P63V9aEO2wKu2DwvVUcbjwCEV_JvKwWZ0netT75ig@mail.gmail.com>
References: <CACRpkdbn=P63V9aEO2wKu2DwvVUcbjwCEV_JvKwWZ0netT75ig@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 22 Jan 2021 22:02:43 +0100, Linus Walleij wrote:
> here are some DTS updates for the v5.12 kernel cycle.
> 
> The details are in the signed tag.
> 
> Please pull it in!
> 
> Yours,
> Linus Walleij
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 0c09604d1e5bb9e0f0600e4e172ee0b7a8393090

       Arnd
