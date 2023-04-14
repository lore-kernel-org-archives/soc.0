Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB022C77B78
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D08BC433B0; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82407C4339E;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=7HQBcG+sx6E9f0hL6QjVuf2CNxnL2HHiN06g88GKb5I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lk8MxrJUxB5Dszq8DniNn5fKMCkjy5hfFlw6cwEDE1Nx8BkBDklTPHuKSz+JH0Y1h
	 sbWxcdj/V6U5R/ZbxIZuxLb0ehrgXlFn2wQ1PehGz7meF8CHSMzhDxsZRrHljFdx8h
	 /q7i0UaXWOTYcrT3QMoNLwFhdsH4WpTgV1zYfqZ/JWCRdz0MAmjHj9RSOMc43nUsyT
	 mWoE8JZhW/z7r66hfD4F6cWltoR7KC0CIqYMo8Z9mXYCPIeD/0BMX71xThAlYXHH3P
	 mV2HbpwnzARkaHh3La5tiMwRzsl5s+xpfAv1DmijpfCGoHLOMtccaLPWx9n1NW0eVb
	 VJz/IEegCx1IA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5FA26E4D003;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926338.30442.14251991977586280729.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <CACPK8XfmK5S=1PQjBQHb6daDR3qTWN-_NLoXP7+ZDCk13wDxcA@mail.gmail.com>
In-Reply-To: <CACPK8XfmK5S=1PQjBQHb6daDR3qTWN-_NLoXP7+ZDCk13wDxcA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 13 Apr 2023 07:23:41 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here's the aspeed device tree pull request for 6.4. A bit late, I lost
> track of time.
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 6.4
    https://git.kernel.org/soc/soc/c/0a25e38509b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


