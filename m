Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70203C433EF
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4CE6A61409; Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2CA2D61372;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633444832;
	bh=27OmaqKY6J1Q7OHSjAGa9zhMoFKEqUP/sPwJsbMuzrU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hJPuey0oY6tUstenENFpgLLBpUDNs5gxwPOmav1U5Tp3Cpd1qQ7V3qimmQ+2R2AlG
	 FQPqcpzZSepennrKgRo9K/EkCoVVZzcS30hEsPttjl+fgdG7CYT7OLMCVagqQDjOdX
	 tx1ehjPk5o2az/RTjE+unr2Ea+Z64yJ6Pt6/s4cuT5/6D6ITqbf0tuewjng7r59N+u
	 xRI57m1JPv/I3zanId+a0OHZUeG+oxf+ydQi/atXL9rgA7KbGIKEL8Z4MbZM14IR4M
	 0iTIKZeD5j2uaj1obrlEWGKZ8TNnaeXaBaNST1Xwe2jehVgAVANBsYffU7tPAVviPH
	 iq8wRYXy0omPg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 12F8660971;
	Tue,  5 Oct 2021 14:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344483207.23473.84548242033702604.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 14:40:32 +0000
References: <cover.1633081144.git.geert+renesas@glider.be>
In-Reply-To: <cover.1633081144.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (refs/heads/for-next):

On Fri,  1 Oct 2021 11:42:42 +0200 you wrote:
> Hi soc folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.15.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.16
    https://git.kernel.org/soc/soc/c/581b334b456a
  - [GIT,PULL,2/4] Renesas ARM DT updates for v5.16
    https://git.kernel.org/soc/soc/c/8839e60e15a1
  - [GIT,PULL,3/4] Renesas driver updates for v5.16
    https://git.kernel.org/soc/soc/c/61259f9ea0d4
  - [GIT,PULL,4/4] Renesas DT binding updates for v5.16
    https://git.kernel.org/soc/soc/c/e3b05ae58a94

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


