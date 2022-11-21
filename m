Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90B0C43217
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B303EC4347C; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94EBAC433C1;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=/1MBkxJuUUa9ZOX4IsTkS98ZyOe9N7+8r2ItojwQIQY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=t8cIfZV7vRsirvI88QycqBh8AADNcX49Z4zlaiAkbl7s7iKQETieaTLtU43q7zm/o
	 a5y93DERcIVHZtipegR3tPJ1ZD+JFZ1QE6s6V4VjQTqabH/qSyNpmhSm9lQhdnEBNl
	 ErvuFBkMMxFCFg3JJAKbYdCGq20TQsFAXOgKPrAzfyQSO94rF4rjMVTMlVS7KakypY
	 HEjN5Bvd0zu6yY5xTZmBgUhRhgWtOeIA+E6jKGM8iymCZLpdZGNJDe4cwy/ghHjIfx
	 MTKtYzgO1Ho8Rm6t02EbAa7Ei+g79v8RkyQQSwvEb8AbqBdE4mKwGeYgdifDN7dR+K
	 qEpjalqXqeb8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 82CC1E270C7;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/7] Renesas SoC updates for v6.2 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234352.4359.104520286581479434.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <cover.1668788918.git.geert+renesas@glider.be>
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 17:44:57 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.2, and the first one including support for an SoC with a RISC-V
> CPU core (and including no changes for SoCs with arm32 CPU cores).
> 
> It consists of 7 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] Renesas ARM defconfig updates for v6.2
    https://git.kernel.org/soc/soc/c/1d4456221fe3
  - [GIT,PULL,2/7] Renesas ARM DT updates for v6.2 (take two)
    https://git.kernel.org/soc/soc/c/1e9629820ab3
  - [GIT,PULL,3/7] Renesas driver updates for v6.2 (take two)
    https://git.kernel.org/soc/soc/c/cb667ad7524a
  - [GIT,PULL,4/7] Renesas DT binding updates for v6.2 (take two)
    https://git.kernel.org/soc/soc/c/f241625bb3ae
  - [GIT,PULL,5/7] Renesas RISC-V defconfig updates for v6.2
    https://git.kernel.org/soc/soc/c/267511c9778b
  - [GIT,PULL,6/7] Renesas RISC-V DT updates for v6.2
    https://git.kernel.org/soc/soc/c/2092ad3a79ca
  - [GIT,PULL,7/7] Renesas RISC-V SoC updates for v6.2
    https://git.kernel.org/soc/soc/c/92f3bfaced6e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


