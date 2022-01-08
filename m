Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764C8C433F5
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63695C36AF6; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C4CBC36AE5;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679214;
	bh=iUOeOE2KA6hP4P2UhXxrjPu74nL/Q3E+U1pa1hluBzo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ax8DA7DV2PEIkEe6NuGvrL8dwdda0wZDCk1WnadfO1YltRGeKjRxJOlcN1fMQ+1AW
	 fOJkPjEfbsQJghvySoqj33gHyCZTpgzdOKb98ia3gJ7A0kDEwVxddb5GML4eumgNBM
	 ti7raVqEsHJ1SB23qT9drZYvl00oPRfKFHR2BF0RDEynknjbT0wCOLyUInfl/tzy3G
	 tMb39t1ub6E4ffs/1lQNTyqRLjG96AucIGb/otGpnzQ94Hblia7QsRf2FuNl9pB7ky
	 w01ULh8kkju+zh31yVVwiCwSOrRJ1GB/M3Zn1a/PmKUiLVFPjMCI4Td3qksF4rkRhz
	 I4p5Et8a6tXfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2F086F7940D;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] memory: drivers for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921418.24856.10013400891670105164.git-patchwork-notify@kernel.org>
Date: Sat, 08 Jan 2022 22:00:14 +0000
References: <20211224111124.6097-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211224111124.6097-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Fri, 24 Dec 2021 12:11:23 +0100 you wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] memory: drivers for v5.17
    https://git.kernel.org/soc/soc/c/734b4712a15f
  - [GIT,PULL,2/2] memory: omap: drivers for v5.17
    https://git.kernel.org/soc/soc/c/34e0929d14d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


