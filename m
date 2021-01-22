Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90224C433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4BE0023B32; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2BBE923B21;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356413;
	bh=3hOC5BV3MQLqb5nr5TGLW8Q2W8HRhcacLQtYsymSu6s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ufQUv6iSDLoQMiyv2RNCBPbvser0z2HvjJOpkeEZjbZ9ASTadzEbIr29QT8rW3RpE
	 kwjS131JWfNEpaZn4Yrorffj8mTX3e0ttfXc4MzABokZOPXNHQgf6wzWDWeqaT98kn
	 /u6yP/RdIAdHhsMcysU8z9VbE6DZH0hsTEw2Q/vpp2ILQuQAeaT+G7H3z2ENFZjG5S
	 rX4RcbcG+dOc2f5QX1iPmUN3wh4jp6dhUIsW9tIkCRfWBJ0UHoeUFKdCWBn4KM3VUy
	 PBVfvHKX3GL3B3UvzXchANe9EJxEkzmyhTxkhkzboVEqIJVFCPvSLFLtXUFoHVaaVx
	 Ks8CTwC2WaiLQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 28CE7652DB;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 DTS updates for the v5.12 kernel cycle
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641316.29035.524515378494768882.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:13 +0000
References: <CACRpkdbn=P63V9aEO2wKu2DwvVUcbjwCEV_JvKwWZ0netT75ig@mail.gmail.com>
In-Reply-To: <CACRpkdbn=P63V9aEO2wKu2DwvVUcbjwCEV_JvKwWZ0netT75ig@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 22 Jan 2021 22:02:43 +0100 you wrote:
> Hi SoC maintainers,
> 
> here are some DTS updates for the v5.12 kernel cycle.
> 
> The details are in the signed tag.
> 
> Please pull it in!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 DTS updates for the v5.12 kernel cycle
    https://git.kernel.org/soc/soc/c/0c09604d1e5b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


