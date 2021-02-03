Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C23BC433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B0B9664F84; Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9877164F87;
	Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612356006;
	bh=F9a5Blr1B3D8bymmPIkiyJ2tDJ+EVI1Unv1zvPvVhFg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KIP+8k5AEWb5o3ETYS69sMavPaQxnR433wycFutqxgG1nImoi7WH10AoxdtUAR5y2
	 JlFOiplFP8LVxKShz4vVmr8QUl4Nn9Z5mijtrKbK7/mutjqcY9Y4aeiUdws3ybdVhJ
	 gxiqHaQKabEjWd2A69JO6MF1FjOlcDM/+xpfFMKtfy9gmhDdupjVIQIDydpxeTl5JR
	 mYu6hk51u/Iukfho7bgiUGivB0c/9a/MshOjwGAfIeWcdcmhLvACDuv/SJ1/NxH9Zp
	 Mf9OazNKW32caxnWOEOGvKbE93QVbRYkUIG9h6c6GhPOK21UoeGWepUevMjx4u25RL
	 29xEN/iRoEalA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 81F12609E5;
	Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161235600652.28451.2687866407852151879.git-patchwork-notify@kernel.org>
Date: Wed, 03 Feb 2021 12:40:06 +0000
References: <20210203120953.GB3624453@jade>
In-Reply-To: <20210203120953.GB3624453@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 3 Feb 2021 13:09:53 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small fix removing an unnecessary call to need_resched()
> before cond_resched() while the OP-TEE driver is handing a RPC.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v5.12
    https://git.kernel.org/soc/soc/c/d94bd41a0022

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


