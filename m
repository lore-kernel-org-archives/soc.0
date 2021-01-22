Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA760C432C3
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6D9E123B45; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 52C7A23B3E;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356413;
	bh=d42STc5wCD0zCdrTPTQ8z8n5xsbRb7IBVmXqv5vP7Ag=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tECex/lOYX8hEXzp2jmX5pM1klh/RHoByKFhMY08efQHd/yj/eWrRVqfN6fLWm7b0
	 gyvGSe5qklt0SRVwPS+pCozJk5VZJYDaaM3rwnobTrJZDBXLGas3s7h3azWYlPmT1u
	 zBT/PW0/7/cH9u5KD56BA9dowPYyc7vAY+ChqaYqKcUtwC9fPnGOaFt3OKWJP0hzdq
	 XDY5jAePof/RtuY8Iim3J4GJICIcg3yUFM3tAOIkAC4xo7N/LY2AHuBFFwa7CXmZ/8
	 rdIXbMrTGKYKG2n2aSmnGVUZOfFY6vinlRXMajo3xbAHlxuLTjrUjZjgiOwbMzt0Ae
	 0WxzMm3jNZ0mg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4ED03652D8;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: mstar: Unify common parts of BreadBee boards into a
 dtsi
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641331.29035.9401591028018192425.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:13 +0000
References: <20201224020354.2212037-1-daniel@0x0f.com>
In-Reply-To: <20201224020354.2212037-1-daniel@0x0f.com>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Thu, 24 Dec 2020 11:03:54 +0900 you wrote:
> The BreadBee and the BreadBee Crust are the same PCB with a different
> SoC mounted. There are two top level dts to handle this.
> 
> To avoid deduplicating the parts that are more related to the PCB than
> the SoC (i.e. the voltage regs and LEDs) add a common dtsi that can
> be included in both top level dts.
> 
> [...]

Here is the summary with links:
  - [v2] ARM: mstar: Unify common parts of BreadBee boards into a dtsi
    https://git.kernel.org/soc/soc/c/836761189244

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


