Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C41CD129F
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBE85C43143; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6160C43330;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712677239;
	bh=/d5gkgFiurM7scLkzmghU5xBK7ejkSqRz7xbi4mKSuc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Q7puMI2M9WI/q+CKM3590y9PxZksytjkv+whrdNvCNO2vYQqI02L+q3+EITf1K9sA
	 q9FN7X3lYPfsZ9Rhjnqf4tNyW0Z458sEe0wzPQEYQdpz7redGlx0r8IBE/uEtdFrFa
	 PZh+ZAMfvNvR6CsQY+Gk3BfTuxbpPn1WfFS+N2PwR+5ZJFUryITMVSap00/SEQDSGr
	 yyFvy/7pBhMsh4/P7gOfBb9Np9gjztdt7+2+nB2L3OVXacVF1KUHkpxbDbImCvRX9x
	 o29/ITHPZmmfTgkmavH0hcfgylcCzA2bmOhj4eFvfTjAN33HXWJq8j+xaKZo2/NGmg
	 14gFjhMsuayxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ACA37D60314;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC driver fixes for v6.9-rc3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267723970.12038.459215305758101073.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:40:39 +0000
References: <20240406-botch-disband-efc69b8236be@spud>
In-Reply-To: <20240406-botch-disband-efc69b8236be@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 6 Apr 2024 11:06:08 +0100 you wrote:
> Hey Arnd,
> 
> A single patch for ya, needed to fix boot on the JH7100.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC driver fixes for v6.9-rc3
    https://git.kernel.org/soc/soc/c/01a71af381a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


