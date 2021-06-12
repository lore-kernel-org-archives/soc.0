Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4BCC49EA4
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7CC97613DC; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5BC03613CC;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=+op6nSCt6O2Jqv0TQfdKRBwHWAAuikUeG9bGTfVGjjw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=f4O/orzosKYWm82wV5EUU16YDXIQfqPI1Me5Tn9FolKBpfVw3+t6to6zEkUdgszvU
	 PE8v+vdt4H5kTvKnqf3s0RDyhkkMp+ADDcqvq1NMkD6sWFiT3HWyl09jfKjcgpyLJi
	 eynXIFa+GyWCKkaK/N2LPhE4guSLrzsPbw7eQF7FpMyXxSQTeBXh4ZWBpIPQjFk/tD
	 XMhr2SqiXdwjsG1mT4H2bByjchG+oUXgrt5Lq+OcMwjDHMC2keM9roZBfNJzxY6cUj
	 +k71gPXvmJTz1tYxY0/24+R4s6d/uFyOEKF2lYH//QkIAmalHLaXMmH69loPlwgPRd
	 dghWWlHmvwLRg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 52EA660CE4;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] ARM: dts: samsung: pull for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421633.27448.16173532782505081030.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 10 Jun 2021 09:40:54 +0200 you wrote:
> Hi,
> 
> Few DTS changes. I will have slightly later also pulls for ARM64 and defconfig.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] ARM: dts: samsung: pull for v5.14
    https://git.kernel.org/soc/soc/c/523ad4e3490f
  - [GIT,PULL,2/2] ARM: samsung: mach/soc for v5.14
    https://git.kernel.org/soc/soc/c/05a3a767667e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


