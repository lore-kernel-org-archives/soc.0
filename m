Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1177CC4167D
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9F37C34607; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3C1DC34600;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639438242;
	bh=x7GoSqzbVceTXdm14VWZgxT1lk26H35Nf7fMRNXM+q4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=idpiz8DxbG+ZheYg+PWJNqMP4XPDTrNIPiMB4BNs73wESG8x0CFz31ANILLnzCGs3
	 ghTj0eNWy4Ft58mgY6U1CIntnfWkIthGUkoXL1tWfOwfjRgB1SiT4P/j4/CrdivA6C
	 XInjOGpcs/w1niJPgwpH74CgQMud/B5XfrUFe2W0b9uz3+5E08WNzcz1izxgA9MBo4
	 HXzzwmz2sph8EOda6ljy//6vilXbDiYPV8mVeZAHxMUOklyDhKnV4u9cdzH1zh+WSM
	 eH4rXwtTyUk9zBl637B3SR3Kj0byu7zK+H0VoIjfJqbqMLGJzincn3+jT8HLw3dQNZ
	 Fec4I1s+TVuOQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 94B95609FE;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163943824260.22239.8336785002834500143.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 23:30:42 +0000
References: <20211213161451.90786-1-nicolas.ferre@microchip.com>
In-Reply-To: <20211213161451.90786-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Dec 2021 17:14:51 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the dt changes for 5.17.
> The QSPI nodes have their bindings translated to YAML and updated here:
> https://lore.kernel.org/lkml/20211209122939.339810-1-tudor.ambarus@microchip.com/
> They are not merged yet but I see no major push back as of today.
> Moreover, one of the low priority fix below remove one of the error highlighted
> during the conversion to YAML.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 5.17
    https://git.kernel.org/soc/soc/c/7b7320905a59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


