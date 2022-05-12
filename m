Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F450C433F5
	for <soc@archiver.kernel.org>; Thu, 12 May 2022 20:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77495C34113; Thu, 12 May 2022 20:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61892C34100;
	Thu, 12 May 2022 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652388020;
	bh=jHMbjc4jqPfy21HEQvwrye8+tmngGenoOQfdVZE7XxM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eG5hlkWE59wAmtebv0TylHyeZ/Sf8SwW6HbnUQ8IuzZ3rDe7Vzm5xjiWA3ij58RoM
	 O/EJvUL+MB9b7W0ufOC8wLvRipQbdXMe8bQrOBMuKMpECNVwqbqtDnNsDZcJ8KCqST
	 R5pkvs97lj/qpWjWbKP8Y5Rr3vNlRRCR8zSR7k6VwvmthXdcqfV+iDouF0Vg8LSTHJ
	 Pz0J6uQ3Fg8k1DqBnXN3Tysv8HnAsKoEDCR/QsLzQoEss82TNfTA/Wkio7/Rqbhk1x
	 4okXGsbcVxS3hfH0RlkYcJ4wpjfSJhnE3d2CYZj/EVQP9jPe6rWxPwxpT3fyPrNgZT
	 WSmcGE8ffL36A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4DCFFF03934;
	Thu, 12 May 2022 20:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX dt-bindings update for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165238802030.21441.16758596091225708509.git-patchwork-notify@kernel.org>
Date: Thu, 12 May 2022 20:40:20 +0000
References: <20220508033843.2773685-1-shawnguo@kernel.org>
In-Reply-To: <20220508033843.2773685-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  8 May 2022 11:38:39 +0800 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX dt-bindings update for 5.19
    (no matching commit)
  - [GIT,PULL,2/5] i.MX drivers update for 5.19
    (no matching commit)
  - [GIT,PULL,3/5] i.MX ARM device tree update for 5.19
    https://git.kernel.org/soc/soc/c/31df43eff28d
  - [GIT,PULL,4/5] i.MX arm64 device tree update for 5.19
    https://git.kernel.org/soc/soc/c/977389aabe34
  - [GIT,PULL,5/5] i.MX defconfig update for 5.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


