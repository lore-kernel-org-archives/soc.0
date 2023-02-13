Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D27C636D4
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 19:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C471C4339E; Mon, 13 Feb 2023 19:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 068CBC4339B;
	Mon, 13 Feb 2023 19:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676316617;
	bh=E3xfaPPUkogkp/Z0RuI+14yvK5c0EdhfMwvAB/aHDuY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=U6sjwfruhdNbJOpZehm+hIBveoT/ec9jN2IGpE2luhSai2jtbteJdOeHDELq2Vz8b
	 5KEULEAK2/d+bj+HxP7Tqsf31/nrEDm2Imv/ni3Y/1Ynm1LLt0yIG1MU4efJrGrFh5
	 QuluvILG5331sUw4X8ZCc7MdaJd+D8niZv+mvOuSJFxSo5kUXYVqcYN2ckYP8cKAp7
	 Us7cvaffS1KrUvvT3DLrhPadt0dThTQOLuIO14EseScI6A9yJ3N4d4FOCxVvkCbRBa
	 it4Pxj0MELGrCBSya0/bZkrkWDhWP6/3n+k32Ovg7ZeajAEgXhsgpg1Xs014Ko6HLB
	 +38PG6PVuMYZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D84C4E68D34;
	Mon, 13 Feb 2023 19:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] arm64: configs: Provide slimmed down configuration for
 guests
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167631661688.8138.16586518693932198707.git-patchwork-notify@kernel.org>
Date: Mon, 13 Feb 2023 19:30:16 +0000
References: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
In-Reply-To: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Feb 2023 19:52:46 +0000 you wrote:
> It has been noted that due to the extensive platform support it
> enables the arm64 defconfig is rather large and takes a while to
> build in comparison with other architectures which can be a
> burden when doing cross architecture work, especially when
> testing is mainly in emulation.  We can mitigate this by providing
> a configuration that only enables the support required to run in
> mach-virt, this will be much smaller and quicker to build.
> 
> [...]

Here is the summary with links:
  - [1/3] scripts: merge_config: Add option to suppress warning on overrides
    https://git.kernel.org/soc/soc/c/46dff8d7e381
  - [2/3] kbuild: Provide a version of merge_into_defconfig without override warnings
    https://git.kernel.org/soc/soc/c/a63971257e66
  - [3/3] arm64: configs: Add virtconfig
    https://git.kernel.org/soc/soc/c/c6cd63f5af39

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


