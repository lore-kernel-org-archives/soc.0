Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC47EC77B7E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1E66C43323; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A71B7C43445;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=3B4yOdiTpULo1X+INTAliR1VPVdoSDsl2oAiCcuf1iQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dNpn77lTqt/y0mj9aFHz6IUymcI8yYcJrb1kladkGNims52xTBgra9wrdckEo0f3r
	 W39HO1MYiSBMT5DTOILzIdyGd1+L2byhfG38bpHFUHFPpSw+Gubeev4y3MQ7ez6RJZ
	 eY+cKZs0KTlTV3Tqpxh4Bq84ZOmNUluqapjPHccRMKAe25FxrWQMBCqvL2xLwgHDcO
	 LNm9PNxGP7GNmHN5ZK8YN7OAwuCo+bUa4LduTzujqfafNIVUSyTjM7vONhjT8KgNFL
	 WP6WQAHj60IeDF1dsOk4DfdVpPub7SZIGJcX4kOETXgSlthCfcnKVXXT007rH99bMS
	 pZZakEED5Di3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92403E4D016;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom devicetree changes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926358.30442.9710551747258587950.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <20230410232606.1917803-1-f.fainelli@gmail.com>
In-Reply-To: <20230410232606.1917803-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Apr 2023 16:26:03 -0700 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.4/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom devicetree changes for 6.4
    https://git.kernel.org/soc/soc/c/0b3751dc8d4c
  - [GIT,PULL,2/4] Broadcom devicetree-arm64 changes for 6.4
    https://git.kernel.org/soc/soc/c/9e0dabbd9b0d
  - [GIT,PULL,3/4] Broadcom drivers changes for 6.4
    (no matching commit)
  - [GIT,PULL,4/4] Broadcom soc changes for 6.4
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


