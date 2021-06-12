Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1EAC49EAB
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9DBD0613EE; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 78994613D9;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=wNjiw+ZYlXqOWQ+ut56wGyxDe4EJpOMiOdVZGqiIUwc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bdI9CHwEXbBhVUUURVRctl83cj8CcX/SleYe5pOwugzaSnht99k1ZjMrAFCEbADuQ
	 f0v4LG81C9Y2MvufdcZpBsYW83jTGTbNjdz9C4DnMUT/Km5LNr3Ubu/AV6+8hLe0e6
	 vou+GQcRc4Xv8yVUGpt1WPm0cNAHZAkKYXkg/758dVm7dQJM2JCvPPysjX0fOeZ6CH
	 dmqrYJd6R4+qD1rNJ01pGnENgqY8KE8goZmIlw2RSpWoqV9WzmqxJnZx7X4jsoqIpE
	 wk16ZS+5pMn1RUIBsONTosZp7vS/lRezbCPk0jBGpopX5O3WEF8x7pwCVL+J9860QC
	 FQLzkRiURac/w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 64E1760D0A;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: mediatek: DTS updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421640.27448.6844659461929633547.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <117d5eb5-bc99-70bb-a1a9-d7141fe96527@gmail.com>
In-Reply-To: <117d5eb5-bc99-70bb-a1a9-d7141fe96527@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 13:03:45 +0200 you wrote:
> Hi Arnd and Olof,
> 
> 
> 
> Please have a look at the DTS patches for v5.14
> .
> Especially note all the new Chromebooks based on MT8183 that get started to get
> supported.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: mediatek: DTS updates for v5.14
    https://git.kernel.org/soc/soc/c/796f0ae8e74a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


