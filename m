Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E728EC25B72
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC2F3C433AB; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0040C433CA;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698268828;
	bh=lHP8hm1eVu+vI3BJgT+HJLljAdCQT+dPZjl3qfUxlKY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Q+3ldRs63NgZLr7EFGuqMq/s+MSB6enDbLB29ux1lrJ60nYhFg+lGHH6cE84ATffA
	 3PvrSu3GI+gUthAu7yGyFD8DhEL3gxjui51IHYdYBIREtCYBb3SrzmO9FCIbIwajab
	 zuPsbK38zQ3pXQF81m15/cvSsWW7sNgw9BnsLsCE98XAzv7qpE/ZWd6rJvV31Guzlh
	 o6qdf8LhJpjC2W4nG4EMeOJ/VKMahoNISF/uhR1i/wwhSbJjunM+AwHat2VRIEQxD3
	 TZanfJ+RSp7W5BiIaWJIw0hsWcBfdSOOHJDfSQ696naGX2jHmenOka5hD9MalomDyc
	 Wj0VYaNi6GL3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78F97E11F58;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169826882848.12441.15052502010084887072.git-patchwork-notify@kernel.org>
Date: Wed, 25 Oct 2023 21:20:28 +0000
References: <20231024155927.977263-1-florian.fainelli@broadcom.com>
In-Reply-To: <20231024155927.977263-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Oct 2023 08:59:26 -0700 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.7/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom devicetree changes for 6.7
    https://git.kernel.org/soc/soc/c/a26dffc16361
  - [GIT,PULL,2/2] Broadcom drivers changes for 6.7
    https://git.kernel.org/soc/soc/c/759c2e043a60

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


