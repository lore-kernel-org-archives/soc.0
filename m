Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632D4C3525B
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 563CEC34108; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CF31C34101;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=8MYzX1ik4Cf7XV3nA8kVN5QdMqAaRwqnN9XapCfkUGY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Y5j266lTeNrn8LuQPNzLLpuBe2wFHJE0Cf+YSV2y2ZfEoL7lQhrmIgs7VWxLNOeN5
	 XRyAIedHmQapg+EzUNI/Pr4nDemBhUNiuXeGzIiVS0ZUEX8hjRfoqQ/DXXOKCpFZ/C
	 KA3YgKtl45QgImuJD2rMQMMv/Pn7CXwgImN3fJQclUtUUESZiz60GZf+3PgVSs/4CK
	 c9TJIh+R0YcctP6Ornh4CtuM+qjOD8bNimeL70OOYlC/HkDvQ2qyf2g6oqgri0bjM/
	 c3EQqjkXtetYTiWTZJiS1FKGlcLe7KNQPHp0rodypYaOMV/43LkLL8Wze8MUWKX5sz
	 VVf9Z14mQda6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 255F1EAC09F;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966315.15608.4335984990738769804.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <19595245.eudUkVceaq@phil>
In-Reply-To: <19595245.eudUkVceaq@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Feb 2022 00:19:46 +0100 you wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.18 #1
    https://git.kernel.org/soc/soc/c/5a29ea50fc63

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


