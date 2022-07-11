Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC3FCCA480
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D85B3C341D0; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0E71C341CA;
	Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657556427;
	bh=XwPMb301t1qBhQhXQ9kdFFDWWf9Rm4s30KiHEkKtyDE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=e11iAknuRvFBJiqKPO904eTIPSipLE9Camk7JYFmv4qus02EqRp1DO93xjvN5EsVu
	 dL03L7Z2RnrfCklkDx24XLrR+i1vJhGqua4KDGTrgQPWj9UP9z43T23+cgrcsyT1tt
	 7tBc24BO5ek73t5cLw3ya9XKfUmVdg3Wodla/fBBAeA48akM/pSKm1ZKFXyMH7fvHW
	 jm3DyPEKx7oGVvJ1P8hOi1Gq/ZlrV+HnhCVaQOYZq6KuFu5929NRn4GQBKeawNugvY
	 AERwlvgB5oFIWgGdfEcjHIUogp1Rr/sZUP0vDVj4AxJJ0AVTWSzYu4xyQfyfHW1mch
	 gfodB9XPBNsRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A352DE45223;
	Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] TI SoC driver updates for v5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165755642766.9192.2314324270786095708.git-patchwork-notify@kernel.org>
Date: Mon, 11 Jul 2022 16:20:27 +0000
References: <20220708232655.reqjdbib52ejdja4@unadvised>
In-Reply-To: <20220708232655.reqjdbib52ejdja4@unadvised>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 8 Jul 2022 18:26:55 -0500 you wrote:
> Hi ARM SoC maintainers,
> 
> Please pull
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] TI SoC driver updates for v5.20
    (no matching commit)
  - [GIT,PULL,2/3] arm64: dts: TI K3 updates for v5.20
    https://git.kernel.org/soc/soc/c/7310e458ac5e
  - [GIT,PULL,3/3] ARM: dts: TI K2 updates for v5.20
    https://git.kernel.org/soc/soc/c/bfcfa1bdc45e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


