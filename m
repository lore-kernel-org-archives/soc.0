Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD11C54E58
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55350C43143; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F909C433F1;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=H/a682VOvqN92DnbKlr7uBksK+Ld30IJbkJU8PzjVE8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZA+rNzwdpRh/W0dxez6JW0pvv2EB4WlgBvtpXPyapnltfwkVpO133TJ3yqQaguIPR
	 xpZiRbTKZBDRhH9upGhiDW4N1e83wZVOue4VoHM/PrD+EH6rjsDCPbemoHhrRhKJhX
	 51XKPStdJZMPEuzFrsq6e0ichbmZ77wazhbp+co2Y2yujDQUD8kZwAbQnTTMvhbWoE
	 EhytVIyzzXwyE05FcydyaCyNmppJ5zc4+k4a3TcqvCKvEdAYo19Sui1PSfe2oY1295
	 g92B71yvJT2gi6m8YksPtORwhC0JmtAqkVjYM1SKPO/29N25cxySLdPVfH8YopuS0Z
	 sWKDvrlPhO+AA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F31ED88F89;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip arm64 defconfig changes for 6.9 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403212.23732.7875667934258087649.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 17:40:32 +0000
References: <14841602.uLZWGnKmhe@phil>
In-Reply-To: <14841602.uLZWGnKmhe@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 02 Mar 2024 13:17:56 +0100 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.9-rockchip-config64-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip arm64 defconfig changes for 6.9 #1
    https://git.kernel.org/soc/soc/c/758f836f9e97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


