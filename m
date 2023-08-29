Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17587C6FA8F
	for <soc@archiver.kernel.org>; Tue, 29 Aug 2023 20:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE678C433CC; Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8A86C433CA;
	Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693340423;
	bh=l9vEpIWKiCgS6Ro8iD4YROUmAMuk9Hp92l3s6Kkvj4E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lyYbRS01nkeo74vryvsuRFCxzC3KqeqbM71FtTMIx+CGYNWAls24eMlogQMQjetmE
	 1FTsVzth3fKCfefbhG64PNv6GqbOFSk+Oy7oYpp85ATsMsOPFsrGIcLV1XWmQVqhFf
	 k4Nzh36lnuj+NQ1ZIZGFUaxty9wh1IYqeuk+S+busweDCJ/u5nTPntZiIP29P7jW4f
	 xeS5kjATzLcD1D/FRCUkuwLB6GzFgL8/Oz5IyMStPhQHFCwLBHhG4I8AdTYL7uYnx9
	 yWHQOU6We3JOqs1htJy/Cl9bpnpuzLs1tJJMM4yt3EsXiLd2bPK4xuPUBkM2MVYlqn
	 Y6p+XvGQMSbHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9813C3959E;
	Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: socfpga: update for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169334042368.18037.1218921465364251853.git-patchwork-notify@kernel.org>
Date: Tue, 29 Aug 2023 20:20:23 +0000
References: <20230823021810.958072-1-dinguyen@kernel.org>
In-Reply-To: <20230823021810.958072-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Aug 2023 21:18:10 -0500 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_update_for_v6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: socfpga: update for v6.6
    https://git.kernel.org/soc/soc/c/c888d347acc9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


