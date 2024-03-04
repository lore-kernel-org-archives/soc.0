Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1F3C54E60
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E7E6C41612; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36494C41606;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=OQxfd8ykYHzSipDGLxp5OI3NGVejtQDsnChxohpsflA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZgSimi0C/xwaW1COjDV+xna4g7/kyVhIAHSWalhsdT9eXqhji0FHkOvI646e/3kyc
	 LqVPojAveGVwGEJv31gcNDWAmaiozjQ96FfO348Y/NZQn3vMXmb5YR4zmgOyoiRYaS
	 0xcTD5piABBhoV47dcMUbXwUGP7gIlY1pagX744LTW3qmaqCpsfDVpIkTrJoTSHL45
	 bMS6qQUi75rs3ajkRJDr+Q8jvxPJVT0hi4zw4gG4cmdbK/r0yaLHqos3PRp38Dxtg3
	 FT78gpQpD7zIjnBeeT2xb1JhUgBiXbZkCSM5wRG8fZZrd66H1TBWIRdHRuGEODWMyH
	 g6Rilzwp0aO9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 174DDC595C4;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: socfpga: update for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927509.27833.13587376587093535495.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <20240226012528.20380-1-dinguyen@kernel.org>
In-Reply-To: <20240226012528.20380-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 25 Feb 2024 19:25:28 -0600 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: socfpga: update for v6.9
    https://git.kernel.org/soc/soc/c/fe37e5cb49a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


