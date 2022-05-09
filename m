Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D53C43219
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46A89C385C7; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30066C385C4;
	Mon,  9 May 2022 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652132437;
	bh=VnsWMlSyILzO22NBgzO6+e4nKMFCEeO+ulkhoBePDtI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gTadZtA5mGwqrkuidAYfRdHrdqBsKTADguhbqLoM+PRKRpILWLfci9g8ioLqxNE+8
	 XXKj+5T9kiFBT7sZF/MHP955o85YuNGke3w6zUdiZWbAPniZjEQ8MSgIhkriIBi13v
	 t7Haz+tO9+ytzjBi+2bO+nEj0qImyeDlLkcI9A1tbk+f4B2bQZQyvHJ50iIIyAkqdf
	 EpnEF4cGZuNzCi3za7nDA4mUNT58Uzkfr0tp9oMRPjlcpArXFfMz+4i+Bk3n/aU6gE
	 3HOCb0/LTTc2+Mcg2ntqWXAnp4tqlQDi9lEgq5lqHdBHyn9XpQPPkNBXIogw0Sm9zL
	 PbxhnFMXNdDKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10B5BF03933;
	Mon,  9 May 2022 21:40:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Enable audio on BeagleBone Black in
 multi_v7_defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165213243706.32686.16019796000051449171.git-patchwork-notify@kernel.org>
Date: Mon, 09 May 2022 21:40:37 +0000
References: <20220506222646.1671474-1-broonie@kernel.org>
In-Reply-To: <20220506222646.1671474-1-broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 May 2022 23:26:46 +0100 you wrote:
> The BeagleBone Black supports audio over HDMI, using a combination of the
> DaVinci McASP (used for audio by a very large proportion of DaVinci systems
> with audio support) and a TDA998x device driving the HDMI link (this is a
> very widely used driver). Build both drivers as modules in multi_v7_defconfig
> so they can be more easily included in testing.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> 
> [...]

Here is the summary with links:
  - ARM: configs: Enable audio on BeagleBone Black in multi_v7_defconfig
    https://git.kernel.org/soc/soc/c/553a4ee1c026

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


