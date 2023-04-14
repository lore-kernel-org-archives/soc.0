Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0A7C77B7D
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB0BBC43446; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAA45C433AF;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=h04TAFOFTjX+yywEy+POMr/+uha6YGLrRlPiLzt+iEI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JgKXE4WgBV1uJEBjWnOVBSjcoHbf5RFVfysPLci8sF5nGcPbizxKHV6cErVkdtF6M
	 9FdTpcUtwBxcT/4H1eJtoYwU3e3WWGLmd3wbYYbQs6Bq50vU9lhKUDfd3JcBX8pJ0t
	 p2cAdHZvoSrs6Aq1GFVgs2neAkNgSvaYgIJiT76nHbUXSrIAU23ecjHIv2iy4O04Rs
	 lJgtzybKW6SLoUGEzcczrl0nmm0ZOxJ6iM7v+ZDykdwswyRETo/7QmKK7BKjCPINfz
	 DYbR8tMhWra5P35r+M0G7pNYT80jYiFY0AmZfEFgJNO3aEyONM9VPkK1oJT54Wpklx
	 +P/IdL6bdJtpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7048AE4F0B3;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] soc: ti: Updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783045.23940.412548586937489432.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230410140506.ucvkwq7vz2h47vyj@stipulate>
In-Reply-To: <20230410140506.ucvkwq7vz2h47vyj@stipulate>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Apr 2023 09:05:06 -0500 you wrote:
> Hi,
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] soc: ti: Updates for v6.4
    https://git.kernel.org/soc/soc/c/508471c3de8b
  - [GIT,PULL,2/3] arm64: defconfig: TI K3 updates for v6.4
    https://git.kernel.org/soc/soc/c/d04a06e984b6
  - [GIT,PULL,3/3] arm64: dts: ti: K3 updates for v6.4
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


