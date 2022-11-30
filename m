Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696DCC4708B
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A7E3C43149; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C5DAC4347C;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=jqxL/BGd7Kk2p7f5AQbqiD1iEN7Np8ZFnPoFDsvqVBc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XmpXj3s1vmxznZ0syLyQJMH1w4caRvQIWU1SJFaTFyfTrXoFsHNx9qlNtm472wEti
	 eckWYyvL3XBq416xAs2q9Rc0Qq3YF0X0ugNleQBLS8sp+WugLsUkFBwqYX9ipidrzE
	 fPpRPDBuHGPPyLas9RK22kQWOmQjhdXw1iI42pfCwR0x+r3lZ/SzjOoMZHS8+hVKpC
	 jHWIS2Wpe0l4jwzD4TeJblmB2lDrU8ZLv2a8F0d+YNiHGWTEJvi6XaCEtZHKRj764M
	 dD/fh/QcPTKZuPefqW/mIo0tEYsI8u90Gifku2Ht4Q/A1x/5dLqsATfizvvwk5x/me
	 K/9nlZuoPCRZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1721E21EF2;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.2 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826185.9936.7958427051561100389.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:01 +0000
References: <4716610.aeNJFYEL58@phil>
In-Reply-To: <4716610.aeNJFYEL58@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Nov 2022 14:49:49 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in subsequent pull-request
> Rockchip changes for for 6.2
> 
> As always the 64bit DTS part is the big one, while
> I realized too late that the 32bit actually only consists
> of one commit this time.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.2 #1
    https://git.kernel.org/soc/soc/c/0c5f21291c1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


