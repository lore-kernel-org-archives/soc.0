Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC6DC00528
	for <soc@archiver.kernel.org>; Wed,  2 Aug 2023 21:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D18D6C433C9; Wed,  2 Aug 2023 21:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAFD2C433C7;
	Wed,  2 Aug 2023 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691013023;
	bh=Yx8XkZKFblpcjVd0BsRuds7wXhceVw0M+NGRFw+R6SQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Cbg42p3Z7dk5RA5zsrQnvucsyCBLc4nM/zdjOF+BwDMnCXdQgQuM2/WOjOM71fmI3
	 3ZPKPjK3gt8nFHznKvv1ufqszKDaH4TdwRH4p5VeSfu0oYveJA3SMoB5+SESnACyN/
	 yRcSoAEhj6cl+pgWo4LIkj59lCHpEQOIryTl2ryF6ZF2lg3WHCEDKe4t0P9uSLLA8P
	 rZKwplo21OOt2Nwc2j7lLBXsOBRIo7cPPAnpcd6JJsChAuaQ3CbdhCoChLHlV5zGCM
	 R+OqJ5yrGNY7EwljruNDPDghTdV06tmEpN1NfHW1lBeE6ZGdUw9xOHCXBCjs1BjwNX
	 SS2siBdU8LfDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 99800C6445B;
	Wed,  2 Aug 2023 21:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: fix i2c signal property for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169101302362.13079.4876609876780263167.git-patchwork-notify@kernel.org>
Date: Wed, 02 Aug 2023 21:50:23 +0000
References: <20230724145617.887443-1-dinguyen@kernel.org>
In-Reply-To: <20230724145617.887443-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 24 Jul 2023 09:56:17 -0500 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: fix i2c signal property for v6.5
    https://git.kernel.org/soc/soc/c/d21afb098c51

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


