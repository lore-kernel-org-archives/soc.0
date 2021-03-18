Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C841AC433E9
	for <soc@archiver.kernel.org>; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7099064F45; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5558D64E42;
	Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616109012;
	bh=AYqLag3pYoDBcaXkVsqCcLE8lmvikECbosR39vPRYmc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u2wagMnufOskxGEMvf+CLg3O5lZL3dncXxOSCNo7/WYUvW4bB6UUMmK9/rR+mD9P6
	 epgbLIoo5V+34ITQHKvxonBmGKIgh49IaHq181BiSADoQbRuQCIFRiPmYEfumxuEAK
	 Cn6XCy+B0ARChkK86FYFI66yYwgK9WW/Hkv+B3qrfMnWCJ6qM4Gb/GBZzbYKK6k0mZ
	 1lXNKOj8sJPODBQEYNbYebxcPCpVfSmpGMnoyA7EhCuscsmafy1ripeeipNmMV/dvC
	 jRw1y0fahzwCQsunIw2TtIfIhm+3vHwzZhQv2+iqiqiVsj87Dq5HWzxLQ5BAWkbMKk
	 76wxmMh9aYMSg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 457C960951;
	Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom late devicetree changes for 5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161610901228.20140.10365191321489867013.git-patchwork-notify@kernel.org>
Date: Thu, 18 Mar 2021 23:10:12 +0000
References: <20210217011654.2561426-1-f.fainelli@gmail.com>
In-Reply-To: <20210217011654.2561426-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 16 Feb 2021 17:16:53 -0800 you wrote:
> The following changes since commit a0610b409fc9f90b4861c021ebe853bfcc310bb3:
> 
>   Merge tag 'tags/bcm2835-dt-next-2021-01-28' into devicetree/next (2021-01-28 20:11:44 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree-part2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom late devicetree changes for 5.12
    https://git.kernel.org/soc/soc/c/af6e05f17114
  - [GIT,PULL,2/2] Broadcom late drivers changes for 5.12
    https://git.kernel.org/soc/soc/c/014433756381

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


