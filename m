Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD562CCA483
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92B2DC341D4; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D116C341C0;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108818;
	bh=VoFBbId1x5yXlDB+fbnnTlNDpDpIX3ZCWbQVZrjWQ1U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jK4hDmC/3kINI/pp4+6REfbDsL5/pyxXMzoV+PpFKgE+FLaPxszn6cvOnasDyE8t0
	 RI60bXjOXFV5nPdYRlJOak3/owV2TPZCZglfprBdAljUm/cNYUsJJbX6IOAqXCsTtg
	 Mkeii04mWZz6jD+/jfG73XgFMqLjpoLh44PkRhrFcwz+GFXrij/cx2BspjiryYQT9D
	 UEGXmxCbkOJtxszCUxG++mRFxK8aD4f3UZJ/kQqJ2vu0yUAV25qxkQmuJF2tCUm9bd
	 OcDVO3i+GwvBYHmNORfku6+tiPKjHL6mnOOjaNfouRlOQdPJJ68iDXXOzFGH1+IY5n
	 loyRw/N8Y9iWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5EF1BE45BDF;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DTS updates for v5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881838.23384.14523354496358861436.git-patchwork-notify@kernel.org>
Date: Wed, 06 Jul 2022 12:00:18 +0000
References: <CACRpkdY1MG=HG+tOCmD1_LEAStV1-ycCLkwShMRD4R=4jGDYHQ@mail.gmail.com>
In-Reply-To: <CACRpkdY1MG=HG+tOCmD1_LEAStV1-ycCLkwShMRD4R=4jGDYHQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Jul 2022 00:34:53 +0200 you wrote:
> Hi SoC maintainers,
> 
> here are some minor Ux500 DTS updates for v5.20. Details in the
> signed tag.
> 
> Please pull it in!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DTS updates for v5.20
    https://git.kernel.org/soc/soc/c/11303e4e4c0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


