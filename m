Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02701C54E5B
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB99EC43142; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AC04C433B1;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=w/krPW8krrnL7QZpC4JNn046OJZ1zW5olmRZQd95Z3A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=N5wY+0kiw3RTyy//3b7H8qrFcQ7ea0OofD1YWWXtqAuZG4b0pXehiv5rlRG9okWMq
	 Akv/ukLBeiHtoo/o4wwtLWjz1h99SL4oRYFzcC3DPIVLDX6b2uWCgRLCPnnYqfND7n
	 H/UwUlDpnmY7Sar6asZUw9ziga3BuTFuNd3MxnNR+9gkslUGe0aSzHOXOB3MJPRrNN
	 FeGWEOutn16Ha6Ba/Ld91M1nyg+3147xaxsY+jeSfsj5tV25GC9w+W7JVXGe3CPcdL
	 mOOMJ5KsDPQfnUptu+uvF8zKQHQmNv41v26r2PLbAHt1w/Q9ZLBSAoDH+HSt1fvBrd
	 qwtKfvM/6VfGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A17DD84BC5;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v6.9 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612949.13542.12091815154592027818.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
References: <cover.1708687130.git.geert+renesas@glider.be>
In-Reply-To: <cover.1708687130.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 12:20:57 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.9.
> 
> It consists of 2 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas DT binding updates for v6.9 (take two)
    https://git.kernel.org/soc/soc/c/c860b6a65d77
  - [GIT,PULL,2/2] Renesas DTS updates for v6.9 (take two)
    https://git.kernel.org/soc/soc/c/11e876b3c387

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


