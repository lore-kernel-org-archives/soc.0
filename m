Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B63FC2BD09
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5552BC4AF0E; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D5ABC3277B;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=FXAgO4sjnsrC3GoCDAfQSM9+laNVEjgZocTpgErax9M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ObvJcSirLhM8hNMZqrg+9E3v5miabcRVHIWukeLVCVgQjgcwzz2DmIH8EWcLCCaOE
	 qBuuc5dIdLZnkx/3KT2ALaFmNTECUeteEXDNr24FKyeqDPRhW43cbOVb9d45vWgocW
	 3gknhxi/sLKbZlbQ1VPKueYzivNvpmZTt19CTaB7v/AsJL4paX+Em8aaxBEAo+btyP
	 h6bnl4Mlkvp6QJITEbCOxCtQ5EZcZ1d4wWxBw7cfQlgbH5qtU7uneedTaAMxsQjLQa
	 HavdhD3uakTIPbc1IB9bbvBHCeSIis20tMK6OcCTJ6Gi6hMu4+O04/AVKBNxj2tFGk
	 LNhxLCb6J/cLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2FBC2DF370E;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743819.12156.6013534272923420092.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
References: <20240702070212.8291-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240702070212.8291-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  2 Jul 2024 09:02:12 +0200 you wrote:
> Hi,
> 
> If by any chance you can also pick up:
> https://lore.kernel.org/all/20240530-fsl-ifc-config-v3-2-1fd2c3d233dd@geanix.com/
> https://lore.kernel.org/all/20240530-fsl-ifc-config-v3-3-1fd2c3d233dd@geanix.com/
> ? I was planning to take them with this pull, but eventually forgot...
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.11
    https://git.kernel.org/soc/soc/c/0b07feb91052

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


