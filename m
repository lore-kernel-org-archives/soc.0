Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B3EC63704
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25A9FC43144; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FF57C4314A;
	Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042344;
	bh=RtCmaV0rHTHsZjQ95RmUKh1FAa076XulZJhi/JIR8Cc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Cim2IZU8/TtWpZLi5WSD7elCzO2pvakCvXalnZh4tm9z6uFYYxHZbNMT3kUdOcyfX
	 XKj2doaM8+idgU3VtwhiYVkfpHc8j8sTXEXfr8zAlR5is8lI/lpLLNxM78Qpg/OolX
	 zieFm8pML6Nla7oAJBDi+ky73atZ7C9zNu6BYtL2nTS/bW9xrI7H5cTMliAg27C7No
	 TiSYWneKA5kLZJkV6P91njur7aj6DFWJdYngls022rWlDzvJ2e5XQ2a0ymQIALheRy
	 ANJk1/Qc59HpeYP/yOqX5vHvnqRpmZKtuhOwMWM9MNLiJxqvg9No+jffVRH7WSoALz
	 Ib6gseR23SkXA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ED7DDE29F42;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Stable branch for .dts to .dtso rename
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234396.4359.14539414950496081717.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <20221118211103.GA1334449-robh@kernel.org>
In-Reply-To: <20221118211103.GA1334449-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 15:11:03 -0600 you wrote:
> .dts files for overlays are getting renamed to .dtso. The kbuild support
> for that in in this stable branch. The .dts patches that depend on this
> are here[1]. There's also some new .dts overlay files posted[2].
> 
> I'll leave it to the SoC and sub-arch maintainers to decide how you all
> want to handle it from here. Either SoC maintainers can take this branch
> and dependent rename patches or each sub-arch can. In any case, I would
> like it converted over in 6.2 so we can remove .dts -> .dtbo build
> support ASAP and not be carrying both.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Stable branch for .dts to .dtso rename
    https://git.kernel.org/soc/soc/c/cdd1db76607d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


