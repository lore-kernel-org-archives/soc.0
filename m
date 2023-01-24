Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B38DC25B4E
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C281C433A1; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F789C433D2;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674580834;
	bh=WhENJUGGpKajEueRynyw21y9z2S2yLrIda0YLMrqMwo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CMhTrJXO/BsA9PzO24T/Oa7EBHc9O+YN3QYhryX/GF+JsG0u72CKMK/6FA+4dJuPY
	 SB2FemtWFOC6xLMD6osShY+TZ9GdUyJVpDMzE/abbcTSRNoLdinjEUB6M8RkFlftSj
	 S9KNFim9aA4Xw6mE9Qt1moF/9q20EkVBLfBASf5EfyC4kt84va/DMVzUymxDe3YuR/
	 ODSaNHrbf5nnkM8U4024Vub5zoX4IJYKh/7DAAorgCjSp6DbRhAest4wZ7YryE0gjJ
	 G3KVbwi8TVjM9MQz0O8PczeuC+suQC30Crq/AEYogaOcTO0eGROY95wrkttgs/sUhs
	 3P/iufPJoOKtA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A6BDE21EE1;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167458083410.16533.3315934716882811823.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 17:20:34 +0000
References: <cover.1673702287.git.geert+renesas@glider.be>
In-Reply-To: <cover.1673702287.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 14 Jan 2023 14:22:56 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.3.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.3
    https://git.kernel.org/soc/soc/c/917601ebd6cd
  - [GIT,PULL,2/3] Renesas driver updates for v6.3
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DT updates for v6.3
    https://git.kernel.org/soc/soc/c/bd5a649bf364

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


