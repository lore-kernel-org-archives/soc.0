Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6B8C4332F
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B3BFC433C7; Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86014C433C9;
	Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702588286;
	bh=wspXuITcOSni4VQVLAS8A5Z+5fB8Ue7ESykY1UsWOYI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SVYHx+5o0cZAW1OcROiAH808RNNKIxm7EKfy1TVeVBKuFXHIUZkAJoydMXZbsNJ2G
	 I8OK3jAULXuVBGtJQYiu6kqZcwlBR0NlPmVMrwOX76gHRXQ1oJKrZFwcXvSrrM2svx
	 P2H+T2v75kYQyoB6NoeaNBmQo3qQnq7MW7xG/Tws0sU0+5mn2Js5YhYDUoGN2+ln/a
	 an3oTXqmarreURy01988Hr5QlYFTaQ1MjvarlB7gDtKt2HsVIu4WB24qYbEGv5lr6z
	 +d/qigI8+x6n6+Dw3dfOXfxhcZ5x8eQAXVDMR2vGHrXW7MZtUpFexOpi7VPoQVbszU
	 64dpx5x93Q+gw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63968DD4EF9;
	Thu, 14 Dec 2023 21:11:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170258828640.10180.6851846965604805893.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 21:11:26 +0000
References: <ZXtVUJ0SG2NRpPG4@archlinux>
In-Reply-To: <ZXtVUJ0SG2NRpPG4@archlinux>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Dec 2023 20:19:44 +0100 you wrote:
> Hi!
> 
> Please pull following DT fixes for 6.7.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.7
    https://git.kernel.org/soc/soc/c/81556f228c0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


