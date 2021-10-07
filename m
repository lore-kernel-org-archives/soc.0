Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BDCC4332F
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 21:00:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AFDC061263; Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 984AD6120D;
	Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633640419;
	bh=lFyWa304QdkSUOdYXu9CO4UmijHRARI/w8vrKAW/eqk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qtZVRn3jmW596vOcHRI3tmg80hwDNSAbGaR/TylwXiJoTp0GlWfUbahLv8lkqla8T
	 OXT+9QGjlMkI6ZnR3WYINzq/rhL6lL1H2am72K/m3rC77taOP9ghLaqhlcjK0qBjX+
	 dfXO5f06yGlttRQNmLjH26VYWT3PI3tsoIIYkEPDBq4D2B4KL2wF/mE0KybqnxyCzH
	 Q4vMUG8JH6wUuTETWOkaTBJvMHiLcFEPsq5iGoZbLMUpBqjeXB/zTM+vRcRZ/VTE5i
	 K6Gpok3nzcyTWENekKdcWNMMg8NAWq4QimMj/xfYzcE1YSH/tU+FPvjWV9ge8EHsER
	 p6Wbicfxvl37g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8D79360A9D;
	Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix for omaps for v5.15-rc cycle
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163364041957.28878.8367194854605516071.git-patchwork-notify@kernel.org>
Date: Thu, 07 Oct 2021 21:00:19 +0000
References: <pull-1633609552-789682@atomide.com>
In-Reply-To: <pull-1633609552-789682@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Oct 2021 15:26:31 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix for omaps for v5.15-rc cycle
    https://git.kernel.org/soc/soc/c/3c7f58b35305

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


