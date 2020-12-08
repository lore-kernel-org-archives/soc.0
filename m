Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6EBC4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 17:10:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E654223B1C; Tue,  8 Dec 2020 17:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607447432;
	bh=u+f38RTQ9OPIYX87vAWpWazrX7QNd/3tMzb7PQMjW6o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=r0aiJ4Dqzh8o3K+UZWfFFQqOPLj7gH4xoACdvb6YYpV239RP8UHPPjzGcAGkUp87U
	 o0xeWs51aWCUvRsfkCs7vYTcKqXlaSiDpR8fKzSIrW9PCmCFFNLZkNcOYbJ1wMO+TS
	 fhbxytrcriNiicqQKnQvomJoqgIVu+72LVV6H61vIL0HN7IuUp3aagSpWo+NVMHmnh
	 W3e0TMk+ZumQ2l9PF1Bco+wvdyd9hqKwdOroJQF2hFhqGFHOAnMpjK/fdcUxuoGgf+
	 UOxDbddeKkCIoHcucSdz99rPVXoe2WAdaCOwmIXmLkr9xQ3BfPWuU9kmNP+Pz77XiM
	 VWr95Ey3Eud2g==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip defconfig64 changes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160744743281.1206.514256121562174705.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 17:10:32 +0000
References: <2750818.e9J7NaK4W3@phil>
In-Reply-To: <2750818.e9J7NaK4W3@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 06 Dec 2020 19:32:35 +0100 you wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-defconfig64-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip defconfig64 changes for 5.11
    https://git.kernel.org/soc/soc/c/ba2f9a5fbc38

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


