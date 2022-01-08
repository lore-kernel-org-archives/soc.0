Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0DDC433EF
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D9EAC36AF2; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3643CC36AE3;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679214;
	bh=OcWH/Rd6D8npFjmqmdUfoH02E6oSxIsVRoGJWBU2V5Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JMJbZ6VcGfGSz6+XjIrrSLWawcalNrTMYGZwHeSwBFaN7VxEn+tIdp1EogMiPa7LQ
	 Yo99fcXPGJ5i5dSdmnNVtem3dkdjwaMQGEd2Su34USnfIxiduCAyeS/zo96b3+nl21
	 sW0ppruzA08uSP03QEnV9rJ0efomSjBHDGLfsYdNO+yXheLfvDtNuWbd76tFwBfoDg
	 TbOmQr477NZvrqmgPpPtv7oVK0jQEr1dkf+FzAFBrlHbX94iViY6U1PseBlqnkY9xh
	 hbcioo1W8R6AYGhmXhUhyTM4v/tEce6d6aDD+fizJN046QYg88VSccRC+yAyFUs4B8
	 u1oA6oZfuVO+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25132F79404;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: dts updates for v5.17, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921414.24856.13156416079068509715.git-patchwork-notify@kernel.org>
Date: Sat, 08 Jan 2022 22:00:14 +0000
References: <20220105213603.804026-1-dinguyen@kernel.org>
In-Reply-To: <20220105213603.804026-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Wed,  5 Jan 2022 15:36:03 -0600 you wrote:
> The following changes since commit 8dce88fe80a858f34bb5b46470218fe478d251ee:
> 
>   arm64: dts: Update NAND MTD partition for Agilex and Stratix 10 (2021-12-01 08:07:41 -0600)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.17_part2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: dts updates for v5.17, part 2
    https://git.kernel.org/soc/soc/c/0876babeb560

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


