Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE38C4167D
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DFCEC433CA; Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78D12C433C8;
	Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702588286;
	bh=pmOs7vcroS+bUBERnNjlenDRFrWK1BBmhkybz+7r7T8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hPYlhrU+zxTAzfk8rztGCmP3bu8faCbIi4+o6qUlPJw4lcl6VpFv6Z7t+/cYebA06
	 DXE2LDFiUS0d4D5iD8sntvFPOCTQerHBu+sSzu1adh0srLJTE3AMymDo3p8/mgTO7M
	 OGwk6CnF6bwQqEWiUwSCSllP3PQuTfNA51M3ISRSmn99Cza/cQ/muuEb/to2isUHfH
	 GVyY4/Ad6g2nHtKqz0K2FSuIEKDKcrFCJAKj7eQxMojRx8hVQMJhT7Di9IA+lICXUQ
	 IoXspRUaWwTtkTe7kjDAXzNXN3h9GkXHORsPZ5DFQ24hyRmFZQpim+dmwSAq/XdKYU
	 +9c9Ch9Sgq4WQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A4E8DD4EFD;
	Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170258828636.10180.10604139403565802104.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 21:11:26 +0000
References: <20231213152606.231044-1-p.zabel@pengutronix.de>
In-Reply-To: <20231213152606.231044-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Dec 2023 16:26:06 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.7
    https://git.kernel.org/soc/soc/c/d73ad797c83b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


