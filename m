Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A36C4708D
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 458DFC43150; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2710AC43146;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=xjXrzYlOco/mELysCUx8Kbi2afXrOv2B5bFp8fTVHmM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qrc0Ur+lRZahuYsX6vVJ/9QtgAJAHEaKK3gmX+f7czq7TlITObUglZ7Yz20G7ofrA
	 3G8GGkNzqKoaOFSuJgMhdlnGraCDv/hCIc6YAtZs4QPLW9PxdP2gUbfEG1uT+B4Cy5
	 EqsnuSLmz6yXBsOtxnxH2ciEUZ2Fdvydce/J3+5tV7T/Rh0qF1K6Wbbg0diXEqPzdN
	 SLNruYJXYvmAyRY6Y6vjO4ehpuaPkvfJZkw5fQMHOlkBcR6pSif9uU+fHUccCEearr
	 WzsrYY6gix/P4RVHaHlt4IcqgbPP77LGPoht54ne8yNcJK3n4DzxKuqoL2TB/SzMhb
	 VkGNgRhZ/08oQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F09C4E52547;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree fixes for omaps for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826198.9936.10852074254100208587.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:01 +0000
References: <pull-1669363695-856423@atomide.com>
In-Reply-To: <pull-1669363695-856423@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Nov 2022 10:08:42 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 8950f345a67d8046d2472dd6ea81fa18ef5b4844:
> 
>   ARM: dts: am335x-pcm-953: Define fixed regulators in root node (2022-11-09 10:09:51 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree fixes for omaps for v6.2
    https://git.kernel.org/soc/soc/c/1e52d6c8113e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


