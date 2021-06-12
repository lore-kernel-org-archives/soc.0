Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A9CC48BE5
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4F5F0613C3; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3602B613BE;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=db/wZ0qy3EiY7NiTTAhX7WfpKs4iodZytKAYYAE2wOc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pCOTtabb6vkQDxkHsicZBMCP8sb6nJ2YXpyccE74Hzy0nPAbJiixpWZClay92N2tI
	 VhOjUmSSxvKKgZiqFH2hm2pYln6SI/hdcD64rByD4MVQHoNsfa5GFeXebRYH5+RwgA
	 1BAouVkTSg/bevJBQJnddEtNW2MPQedh6QnakyrIFZq8hUoCa+FO6D5wg+DUruam4+
	 mhrVt86i1DwEOaayQRqX4nL7rFupCU6HmNd8Y5rH+etvjM58yJmiFrSPTMH8hEIxHG
	 4WB4EKJPEwEYx5HSpc1lb5Yd/7XqX9CGWJxP1TM1HNOwbDX8E99oQnJb4MgVnXfRDZ
	 qpG9qCB3edBog==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 30F8B60CE4;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421619.27448.10964527626900164106.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <3405741.0S5aU1g85B@diego>
In-Reply-To: <3405741.0S5aU1g85B@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sat, 12 Jun 2021 00:20:40 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below a patch that unbreaks the PCIe on rk3399 that
> broke in 5.13. As the tag messages states, there are more changes
> pending that handle the backward compatiblity but will go through
> the PCI subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.13
    https://git.kernel.org/soc/soc/c/e60cb06cde7e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


