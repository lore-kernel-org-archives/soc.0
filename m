Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13457C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCD67C341CE; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6331C385A2;
	Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657556427;
	bh=4ST534LidlkFNX2maWdj6YrPdNCr5DXbvWMSe3OWlhU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iKXLoJBEGiK3d77sk/Ck6KdofFb+aeSG0CpaJLf8GGhL21FEuu22GmeRPQTe7hPE2
	 w3UCHCktGjMA81vShw6bTACzDXd+9VhqAA/bzhhb3hAObLXM9hVIbml8kLdZILRD9C
	 nqgKldzxXxA+qzFYjQrkI1nsrHNS4rjg6LVF6Uxvj95IRmmfhJw01HGorbRf70PCIP
	 2gHy5fvKboI25d7isjZSvc9qXolFCnlaMgtihhhB41mzg+oXmrmro1e2zk9Wda6TxW
	 mhvOfRMh+rVGXk/FTeWL0gSWudsFWowEmyA/vn37gKVeaWFbetwKAbjY8C810JmOqY
	 imkVDdM7HXuxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA7DEE4522B;
	Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.19, round 3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165755642769.9192.2301838957786903765.git-patchwork-notify@kernel.org>
Date: Mon, 11 Jul 2022 16:20:27 +0000
References: <20220709032716.GA9868@dragon>
In-Reply-To: <20220709032716.GA9868@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 9 Jul 2022 11:27:16 +0800 you wrote:
> The following changes since commit 8630354f42bef90f51e003a7ce62b69aceb735ca:
> 
>   arm64: dts: imx8mp-icore-mx8mp-edim2.2: correct pad settings (2022-06-27 15:55:41 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.19-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.19, round 3
    https://git.kernel.org/soc/soc/c/01277737e9be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


