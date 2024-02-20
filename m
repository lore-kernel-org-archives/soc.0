Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0630BC5475B
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1657C433B1; Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC24DC433C7;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463561;
	bh=bl5s7rTsMYj8SyulaYYCdhfjIOkt1IQhZ2eZ4nFSdi4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=B4JRMj9djW5BaIf0m5oKTSvxegQCU43aA3Q7rC3q65G6jqSNbh0K8VpkJIsMm1BRn
	 OR4s1X25N5HJulDG5O7vxTqF7b3Wm7RKolxp3fTt+zEd2+YmAf4ghqIjklR3eYi947
	 CaK9qJQBnKa44g+YMrkcr2+Ryi11wKHbVvs8+HeHNBpnMX2WiqcGNFy6C8SK2uHJaT
	 /ZoL0FmgqWNhR5CrxvEUtx7n0mn4NUWo55Cpv3x1bwjLkvO/n95geNi1tfKPiGngCe
	 YlNr5WO75IYfl0+7oDj8UFXM/vV/yHbWbQdvj7UAmGwK2ZCJWJLcf2f0yOEMk3lpQq
	 CJtWIIwTveX/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BADCBD990D9;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846356175.4365.2747437225816315947.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:12:41 +0000
References: <cover.1707487826.git.geert+renesas@glider.be>
In-Reply-To: <cover.1707487826.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Feb 2024 17:54:49 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.9.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.9
    https://git.kernel.org/soc/soc/c/641a6e6962a1
  - [GIT,PULL,2/4] Renesas driver updates for v6.9
    https://git.kernel.org/soc/soc/c/6e66213fd5b1
  - [GIT,PULL,3/4] Renesas DT binding updates for v6.9
    (no matching commit)
  - [GIT,PULL,4/4] Renesas DTS updates for v6.9
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


