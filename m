Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361ABC41535
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E589C34108; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18DF7C34103;
	Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311579;
	bh=p7aFwHv02cwRkFUm1xxJJHJ2y0hRSTBofrcMwuzGqHs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EmnSXf87/oBAyeYLS1uZFJxI88IyX+ML05P/Yjyn7EIerkUoPfFk/jqP/aVHRkO2t
	 rRgRDOnLoBLeeFXD2mOmnxUNWhaOWsBnmSFi3FclCZN4CXBfPTcpcPk0xLfgcKu9Sj
	 venzJjQBiTFss9snaK9oYlPoClO45ighyoalg+gYLHRYlH8J9g+z5W3EQVhpdGBNos
	 gQG86TzJnwmM8fzlRyMpISCINbmn3FP9sGwQ125JcUXuCmWRdEu9zV+ccC5EzDydRn
	 VdfGzsdSBGm049nosmxHoGCIjBoyUlEOiKzqMFVg6919PJzHAU0wGk/vxS5vc3OeXe
	 Tk3EVlG+TuvIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 059F6E6D4A2;
	Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: TI K3 fixes for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157901.18327.10306283577739943658.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:59 +0000
References: <20220204130716.fjlm4vvcbtzcwlwx@chalice>
In-Reply-To: <20220204130716.fjlm4vvcbtzcwlwx@chalice>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Feb 2022 07:07:16 -0600 you wrote:
> Hi Arnd, Olof, ARM SoC Maintainers,
> 
> This PR is a retry of previous attempt at fixing up aliases way late in 5.17
> merge cycle for J721S2[1].
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: TI K3 fixes for v5.17
    https://git.kernel.org/soc/soc/c/99c410e89ed0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


