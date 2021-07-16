Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C33C636CB
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C3EDF613F9; Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AD7BF613EB;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470525;
	bh=RFt0T7QY2TebhvYAPDcCgvvp8K02SOcSvc/SvAyad3E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gatuulh533lW4C0oIqSGXwnaCjEoAg1LdVBOB3MUMCFs8okVU9BPZJsMiC9XL2BLk
	 asLaEIbAW2L9Ebn7QfnWeKpkxgxZNxT9+ObHncNhW5oKzJsflx2lluHmF9nngWGR+d
	 NeX3eU9epGsRLKfyDTLp+BOOo3cG4wVm2C0kQJRXtG6IzocSXJ/hMOhnFf1Lb40eLF
	 mLYuz54a6BBS04hVaA4cd/PX97yIffSL09f5f8BNHvUKfSpatb0Z+fc6ke9Xab1XUZ
	 GBG3ypU6Pf9x1ULB2TtMOJODoGZ1dB0xlCldUvGrZ39d+X9ozVRQhKsgzOIE+6tXWy
	 7t/Ldly8AXRRQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A0F65609EA;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] ARM: SoC changes for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052565.25202.8883108883636826762.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:05 +0000
References: <20210709234054.10288-1-olof@lixom.net>
In-Reply-To: <20210709234054.10288-1-olof@lixom.net>
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri,  9 Jul 2021 16:40:51 -0700 you wrote:
> A few SoC (code) changes have queued up this cycle, mostly for minor
> changes and some refactoring and cleanup of legacy platforms. This
> branch also contains a few of the fixes that weren't sent in by the end
> of the release (all fairly minor).
> 
> - Adding an additional maintainer for the TEE subsystem (Sumit Garg)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] ARM: SoC changes for 5.14
    https://git.kernel.org/soc/soc/c/6e207b882159
  - [GIT,PULL,2/4] ARM: Devicetree material for 5.14
    https://git.kernel.org/soc/soc/c/e083bbd6040f
  - [GIT,PULL,3/4] ARM: Drivers for 5.14
    https://git.kernel.org/soc/soc/c/071e5aceebeb
  - [GIT,PULL,4/4] ARM: Defconfig changes for 5.14
    https://git.kernel.org/soc/soc/c/af4cf6a5689a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


