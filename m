Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A37C47255
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03D2FC433AB; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E218BC433CD;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190300;
	bh=z1nlBOvHeUXApQl67OO31WESdLcJnR3Tc6KzIUfvdZk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HG9woqUmjY4K0rl3yoCrlllN8ZaElHdHqzOv/rbR8tuCUlsNnUEy7GUWdVs2hNV6K
	 hD3P2INFu5w1oGxFsAX2TtZWpDr8TjR2fnEAf2R7kPOrUDtI9rpVjRfgZZUUDyEYLV
	 W+dtcCximL0FdP33VD1IzhNVnSaZJMj2BsSc83gHfdbi3bnCB2swbSs6NUYcEHb2R5
	 cBwLu5+WT78MusomU69cSlqjY8dq/sc5sshFN2NYRWgyDJApanQTtkNWY3IYkmreLm
	 ggBS1NsdhRJZfD/VazsJt14RDUc5n1rGN6mIxwllnQAhQg/x/dFQ8IbbITgw9lNFdD
	 AQ1mO9NsfG9qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD04ADCB6D0;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.8 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030076.6407.529839583735183129.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
References: <15502825.JCcGWNJJiE@diego>
In-Reply-To: <15502825.JCcGWNJJiE@diego>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 01 Jan 2024 23:55:12 +0100 you wrote:
> The following changes since commit 569b26af7919c15a8ce231b4fae29cfbd811f144:
> 
>   ARM: dts: rockchip: add hdmi-connector node to rk3036-kylin (2023-12-12 20:38:36 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.8-rockchip-dts32-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.8 #2
    https://git.kernel.org/soc/soc/c/b2363297508a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


