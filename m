Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E893C433FE
	for <soc@archiver.kernel.org>; Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0552C385A4; Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3AF0C385A7;
	Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651267811;
	bh=rW7mz41ZK9ukW8Pjp9a8PEDH+UXHTrKNdDSKHZTOf34=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OdNm+rUiuIU9uTN/42uX4co0Sa8w5TUlkgJ9dRaguDomHLv4pL1WHS0iIx4GHilmM
	 mZoM4Q4FLJeBpZn3QXQUICotHtfSTHAn8EAil1sYzc1NUxDKXrdAvh9nGF8RTKSRDT
	 CcFTeGmML/IAGAKQM1/9sznoV3EknT2qXqZt0hC8BSODz675hSFWLce4B4ghgUNowm
	 ripan1h8C/asokRdOEHkSC1hVRSDHbGTiZLX+t2v6f9Pt5hr7i1veJKG0YIpeyhZRM
	 FLhF9DHRywIkQt63/Eo71fY18A2EpfZTrpYKpEHJHjSykN2o3XirW8jHBVSZDAZRW8
	 C0T3qxDFO188w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 99798F67CA0;
	Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: tegra: Default configuration fixes for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165126781162.28372.431277487945074748.git-patchwork-notify@kernel.org>
Date: Fri, 29 Apr 2022 21:30:11 +0000
References: <20220429080626.494150-1-thierry.reding@gmail.com>
In-Reply-To: <20220429080626.494150-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 Apr 2022 10:06:26 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: tegra: Default configuration fixes for v5.18
    https://git.kernel.org/soc/soc/c/310b663753b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


