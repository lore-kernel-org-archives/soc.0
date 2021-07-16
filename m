Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AC5C6379C
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 582B861419; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3D6B961414;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470526;
	bh=bRIXOOJq+J/gun4sZZIjmTKDS6N41vK8eqCwtICJ8dU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Qy0xvUcDcDxXi+PpszvyLnZh6Xk3ZC8XUw2V4/+++Gvm0rXtOTir5cQ6sECW1ZM4y
	 KGSTeSf6ehperg3IpUrj5bnic73i0B7CIprWrMSaBQTq83+nSxtk7LiF2Hh1W4yRmz
	 iR4f/wdSD4FI5gsysqIQnxdEdmNsbuAbk+gjILLpC+5gRvAS09WBKtSLhEfejVg51C
	 Nb7abJvVWiFB494kZogJisfy5VDFhxrXfNe0uK0elVWrPlsShtb6OOiacGHAAi93IT
	 GzOfC2V92mNmtTGz7mpClh71PNC029hXADaKy39fuuhNyWwuKxcj95X43HVZ2k4ZaP
	 qxCeJvZCoTA1g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 317B2609EA;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: dts: versatile: Fix up interrupt controller node
 names
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052619.25202.17924553812614855566.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:06 +0000
References: <20210701132118.759454-1-sudeep.holla@arm.com>
In-Reply-To: <20210701132118.759454-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu,  1 Jul 2021 14:21:18 +0100 you wrote:
> Once the new schema interrupt-controller/arm,vic.yaml is added, we get
> the below warnings:
> 
>         arch/arm/boot/dts/versatile-ab.dt.yaml:
>         intc@10140000: $nodename:0: 'intc@10140000' does not match
>         '^interrupt-controller(@[0-9a-f,]+)*$'
> 
> [...]

Here is the summary with links:
  - [v2] ARM: dts: versatile: Fix up interrupt controller node names
    https://git.kernel.org/soc/soc/c/82a1c67554df

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


