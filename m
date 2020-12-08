Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8BCC2BBCF
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD74B23B52; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=IzCUnc0pjLRqOvKzNI6JiLQzbKMw7vvfNHdjvlXwHSk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VcDdh0g9s3Ky+j0JzM7Qd+ZKSSSopYyhXV4mRPK1SWKtujrsVrwpGz93hIIGo+hMp
	 LmunXjxfLPTXQkJcHNvT1ZmgkmYUd6iKV0xV9SLpeH/0HYc+A1kTrFqxSQYaEMPJxC
	 fJ/SUJpBMgwLizKzW2JDA6r4WUspjnbiWcL7m2Mejxn94ZzeJIxZTP4Z0eo4J57fQv
	 DiiG4IDTZlIpGYD8ZT6KXYmL37O00VkON6+lt7QKj7bc5C7iZFAkhtBfRyAY7iXMqi
	 Fo41uMhhm5zCRqyVABvhha0Govf6pn+nu/u3ux0VBVs4Q5VowXDjhzNj39nCNsC7lA
	 lx6GeTlsLppWw==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142959.19687.1473416509545730788.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <2045618.irdbgypaU6@phil>
In-Reply-To: <2045618.irdbgypaU6@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 06 Dec 2020 19:32:04 +0100 you wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-drivers-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 5.11
    https://git.kernel.org/soc/soc/c/d7f9c26b4525

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


