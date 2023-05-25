Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB9DC7EE2F
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A3E6C433A8; Thu, 25 May 2023 15:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1515AC4339E;
	Thu, 25 May 2023 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685029639;
	bh=Jd69h+RqrcdZzoaUasR/x/396brPFdDqOlOm/4lVRQU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WBWXv7LvUP4tLJMIwP8H6my6n2HkUmbd+WnSNIF6xeGmFd5fFlZj0NMQnu7/Evjak
	 pM0K4VYBV7at0BcOwU7xAsQCeg4HRPfSNMlEzA14486Nu4vbR4NoRvN2zLmrVvG7ZD
	 0pwcw+tzVTjTPBBWLPApQN6FuewemDJp8Z4jiFrem9jnEM8sVz96/91g1ro/LfGhSF
	 OZ+wjexRZsCEW8JoPL+OcvdKBMW45CW5yn0YI0UyKp3nu785FbMdS6g5EXNfo3icVW
	 rSc9bmUcbTKn/GYHVRxosxgkEQ+cTvv6paTiiFL+79OMWPaPantauJwzXoN/og6Cpx
	 mk7Fkun3bj3AQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EDB45E4F138;
	Thu, 25 May 2023 15:47:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] MAINTAINERS: update arm64 Microchip entries
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168502963896.27102.14172948973068135395.git-patchwork-notify@kernel.org>
Date: Thu, 25 May 2023 15:47:18 +0000
References: <20230522-wagon-stencil-a164ec39322a@wendy>
In-Reply-To: <20230522-wagon-stencil-a164ec39322a@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 22 May 2023 10:37:01 +0100 you wrote:
> Krzysztof noticed that patches for arch/arm64/boot/dts/microchip were
> getting lost & the listed tree was inactive.
> 
> Nicolas and I are willing to shepherd patches to Arnd, using the
> existing at91 tree, so add a new entry covering
> arch/arm64/boot/dts/microchip, listing us as maintainers.
> 
> [...]

Here is the summary with links:
  - [v2] MAINTAINERS: update arm64 Microchip entries
    https://git.kernel.org/soc/soc/c/51bba254edc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


