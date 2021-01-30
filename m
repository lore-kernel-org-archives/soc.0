Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2E6C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 00:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8C34B64E00; Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6DF7664E05;
	Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611964809;
	bh=itMZdp7ACNUwmmb47RlDu2hLqNpfDCJSBfXRZausR9U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gHgX0YTmvlcADxRJNo5tSLKu6Sp0oryjCSUtyEjl4+bDWlCjTpADmwdsO/VdbX2KO
	 hR4e7y4EIra/Rtv4rZXdC/5AD+MxMeRITa10gi9gHFLw/XdpV/fvOlJ/LPROkgoylk
	 O1DUnYsmTaPhuoXS/7FSg3zEbHnX6iIEKNhk/M1Uo0ioOgOBY2IH0LkUiDQqydA4T/
	 rvyRidpWY79S0fqfut5kneWYTcurxLo0kfkFYyxryClMAUxPWnlWL8gaox8TPuWpPO
	 0I+h2OZdNzmM4b+z2Z3p8CgM+8ParUWh/6iCzNZB1Eid8kuRydqXQOEWBlyAxCdQ4c
	 qBY0OpGlT58qA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6AD896095C;
	Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v5.12 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161196480943.10199.2849606760319976673.git-patchwork-notify@kernel.org>
Date: Sat, 30 Jan 2021 00:00:09 +0000
References: <5e8897a0-8f68-5e41-bfa0-ccdf1e23a3c1@foss.st.com>
In-Reply-To: <5e8897a0-8f68-5e41-bfa0-ccdf1e23a3c1@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 29 Jan 2021 09:42:37 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT updates for v5.12. As usual
> main changed concern MPU part. Main changes concern DHCOM SDMMC1.
> 
> regards
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v5.12 #1
    https://git.kernel.org/soc/soc/c/86a24899c2db

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


