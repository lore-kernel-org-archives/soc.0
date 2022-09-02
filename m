Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F846C6FA83
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D2B3C43142; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 653D7C433B5;
	Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662116424;
	bh=jnfuKUFmB1IK4RlfgUuVVK+ehLAe8G2xbMAJG8JEn9M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=c+ZFgEDv1r8JM8n2ehfqumPgw3ClFZlFCn/E7jZYtDM28mVF9k4/SFnLA5DQd1SXx
	 MO2coUwBZ0/U0cP1K/9rYiwgwxNGELCc2JSh2uDHahePMGRD87IEIA1jCk8yCC4BNA
	 2sb+fMWxG9Oaph9TpIRYnE4Ydh3dEUArDLTyvIt8SpX8GJtTODkJs/glPzQB+0A9wn
	 8l3qIa7v/k2+M+CjavtoUF0bBWzTmMJbh0ImOitRBw1T+QSAO59Fyi4NAIcOEQuQS5
	 vhO/AXjVPzqiikaQ12KqHZzTzkT69iCfGOQ8Er2TQ+k9Lhi4pEfU3IWZabBsBCgBJO
	 g7ymo/cWopKlg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 51C15E924E6;
	Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas fixes for v6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166211642433.12856.4078580895762283787.git-patchwork-notify@kernel.org>
Date: Fri, 02 Sep 2022 11:00:24 +0000
References: <ab2866f12ca18747413ba41409231d44e0c6149b.1662111547.git.geert+renesas@glider.be>
In-Reply-To: <ab2866f12ca18747413ba41409231d44e0c6149b.1662111547.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  2 Sep 2022 11:43:45 +0200 you wrote:
> Hi soc folks,
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas fixes for v6.0
    https://git.kernel.org/soc/soc/c/12f09234bde5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


