Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E46BC433E6
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 00:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 839FE64E08; Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6072064E04;
	Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611964809;
	bh=CSVfuWeMdKg3w5lduhfG3/seldNKkDf6qRrxJvwIUhQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aEpO6K/HbbqlwuYIU7vmd6ZX0/iCfkoCp+VFk7iMyFgjNqZbco7gtVTroPC5Ohcf4
	 Wh/Fe5MBRfKHglJhKiijZyzm5Jj5EyuTQHhA6v1/tCgRBDrD4jlCsOZiGtORW4DSp4
	 +/0oR6hDVaIUxvFBmouh6yR2J9e4rf148/hirxe5Zlo8k7klnJCmhWVm79RZUwbepP
	 tajJQT8Dm21i5ts+k81jYVX7hoiC2ZBnNW0XE1kytgeNX9cRonDr36c9f+IqNuNZtt
	 e1yrSuQETwm7/ROy92p6BPP8a7MK7yAFMsWoyoO3G3O+7uwLTFLG15o0BTiJfo7J6K
	 HIpS5AmgmNn0g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5A5E860953;
	Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] SoC changes for omaps for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161196480936.10199.3547451886723580504.git-patchwork-notify@kernel.org>
Date: Sat, 30 Jan 2021 00:00:09 +0000
References: <pull-1611845066-809577@atomide.com>
In-Reply-To: <pull-1611845066-809577@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 28 Jan 2021 16:45:01 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] SoC changes for omaps for v5.12
    https://git.kernel.org/soc/soc/c/ed8878041a0a
  - [GIT,PULL,2/2] Devicetree changes for omaps for v5.12
    https://git.kernel.org/soc/soc/c/2226c894135e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


