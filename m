Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD0DCCA481
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 15:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9E2EC3411E; Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF6DBC341C7;
	Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656946815;
	bh=QwdTXX6Q0b7sRgJMuPajL69G0vI3z17UDS8LA2P8J50=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ibXfq5aCZm/OEzsqzznU5rfgxvSB7r0kBLpODn/HICoudX4f4P+TmjJ1j52tQmixW
	 G1yY4jyilYUM1CgiRHwt3vnwIcAhmb1Y1NxVAd81a3/AMrCvUD9yqyr1J7Jx/M1ODf
	 U45ggJOAZ+eOuA4n+s/hxKMYKiMkAg0o+rNYH9qCTuSKa61NQuJ1IRutE2JWuIwSE8
	 8KC8ZyY11Zz1UbRco7iLHD5oZSkIaKkoWsI21rAjQzgGg11BZ3p9IzTkUw9XeVLmhd
	 M5vTGKQe9lUR1QDg4rz4KR1WeJWkMQQANbFrNcZm4E2AyR0D6jJHlSqVlN9a1CnanY
	 4Y3/C3SFjxRRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B3B2CE45BDA;
	Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Soc changes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165694681573.26251.11836878787077910342.git-patchwork-notify@kernel.org>
Date: Mon, 04 Jul 2022 15:00:15 +0000
References: <pull-1656918583-2801@atomide.com>
In-Reply-To: <pull-1656918583-2801@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  4 Jul 2022 10:10:53 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Soc changes for omaps
    https://git.kernel.org/soc/soc/c/e0ed9e672565

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


