Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AFAC77B73
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4639BC43322; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30530C43445;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619284;
	bh=V97arvmC56nTywlvhB0rKC/POnCREhl6+ab8Z6BsNoQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pz8rnURcnQryC7zblYmAxcq0HBMvVjS2GtDGRKEhmGJDBiXvRfs+zb81aaTDo6dJs
	 2LDh22XwDBN94vC486xKihIMrV4nRfoQtRqbcG14OHAwLYek6aWL69SP1VIvRSvHNH
	 SC3gljp8mGB9oMAKmRWejf8TR5nszVj7d3N64qgKLPpZ4XiaiCh3E9nVMYuApR4uO4
	 nlLduS03xPgeAiqmf2GWQnApwNM4rzMMLy5WJgE6SnN/ZvPUwfeqSiws21kh5EhbHY
	 2Li+Zjfe9579ZlTu5+JTdXngk4lOBNC8SU2LfCcSoH7+ii30P3r5clGVYy5l5GXzyq
	 NaxWcGZKBvzcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A278E29F52;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928409.17322.5432385304208616860.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:24 +0000
References: <cover.1679907055.git.geert+renesas@glider.be>
In-Reply-To: <cover.1679907055.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 27 Mar 2023 10:57:00 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.4.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.4
    https://git.kernel.org/soc/soc/c/f0cda04203c4
  - [GIT,PULL,2/4] Renesas driver updates for v6.4
    https://git.kernel.org/soc/soc/c/33063e5acfcd
  - [GIT,PULL,3/4] Renesas DT binding updates for v6.4
    https://git.kernel.org/soc/soc/c/5b9d72921f15
  - [GIT,PULL,4/4] Renesas DTS updates for v6.4
    https://git.kernel.org/soc/soc/c/d707810efa90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


