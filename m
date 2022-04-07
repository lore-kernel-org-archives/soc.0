Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35F3C43217
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8EF2C385B2; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADC3AC385AC;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334247;
	bh=w+PzFKgaAekXo+lM3NJbwtL3wO8OoBCwuMHjS2EQijQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tJjSrN9gT/57C+Wc287FmZF7wJY3GhmqYjsl7o2qkSQwjCEswmHidBtXi0iGWcASl
	 QMpay+JY5yjvFtV/P2p2Wq8UKUm/zoRb9xJSNS1U/8GoHFr/bDgitka3LfMK68C9uy
	 FR2tGsmQXQNhKXXfHMZwNHU0pdFYAznfAHCGW1MPrQV02AFAd5Ww+fk63CbnJ58ELj
	 H+cpcM5pFZGOZyOFDloe/AGc7kImHKpdyXwbYL/lgH71K5OXHSuOoj46gio6B2VlTQ
	 2Ka91u0f4ndPmR8feJgbtzLzaeHKxjER+F6Eli09QFtMnDHD9oGad9j2I5ZUHgOV6C
	 RXQrGg0GNDppA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9355CE8DD5E;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933424760.10369.9472024218376696160.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:24:07 +0000
References: <20220407110818.1436181-1-sudeep.holla@arm.com>
In-Reply-To: <20220407110818.1436181-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Apr 2022 12:08:18 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v5.18
    https://git.kernel.org/soc/soc/c/f455742ae2ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


