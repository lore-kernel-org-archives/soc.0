Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0399DC4167B
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 15:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB929C43147; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C56ABC43149;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668439820;
	bh=ZnkEkElJhE8lRre8cx94cL2vfydvuEImkM00fpAzhHI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Abq29oLs+PIggCC61QyewUVhc1Xx2ZiJZHOn2Kjmbn8oKOpw4e0T4qNTduRzi0XMB
	 dWx+EjZZNADHOAXdzUKtXN5DJ0Y9LyA+5sEZ/HLdy9yS2XURl8sTWCmLbyTIpaUN3Y
	 4KPSYBFptTyUAlrlrYM6l1tuEEg965SiTHM5vZuWSdKdeR6q/IkXruh965IuydRt9f
	 P/kbhNfN09uP7/IOZyG+J5DWu8yWojBaWlWp7KTsCM2Pep0mvk/38e8JRhb7QHp1r1
	 BydXLK8c1DXhXay2d5/lS73wYXmYyMwXnNVy8k1sB5tsMU+kgmVE/66WBNvYC0qzGw
	 vngHMbFjJDddg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C1DCE50D9E;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 1/2] soc: loongson: add GUTS driver for loongson-2
 platforms
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843982063.12382.5702013296268460619.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 15:30:20 +0000
References: <20221111054201.18528-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221111054201.18528-1-zhuyinbo@loongson.cn>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Nov 2022 13:42:00 +0800 you wrote:
> The global utilities block controls PCIE device enabling, alternate
> function selection for multiplexed signals, consistency of HDA, USB
> and PCIE, configuration of memory controller, rtc controller, lio
> controller, and clock control.
> 
> This patch adds a driver to manage and access global utilities block
> for LoongArch architecture Loongson-2 SoCs. Initially only reading SVR
> and registering soc device are supported. Other guts accesses, such
> as reading firmware configuration by default, should eventually be
> added into this driver as well.
> 
> [...]

Here is the summary with links:
  - [v7,1/2] soc: loongson: add GUTS driver for loongson-2 platforms
    (no matching commit)
  - [v7,2/2] dt-bindings: soc: add loongson-2 chipid
    https://git.kernel.org/soc/soc/c/06ebd23a33ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


