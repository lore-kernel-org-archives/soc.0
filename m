Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A42C64EC3
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D369AC4331E; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD138C433B4;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=hq2dkTX8XkKaCZGQTBcyxiDJ9qv1FDQnzFrwc4Pcz58=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eqJpSxetojMk7CmpXemA5zMpn3cRnhPsZmGO3RxL1ss8/O5BeAVPvhOy3mRiViAjt
	 V0/uW4QL87qSQhwnxu74Kb6lNnUdis2EsHbCAbvKJ27UeIJORGfsfw8kZVTdNfYOOV
	 t2rPo2Hthxadn/w11lIvMmMu9po9hpYHkSJPEp9wuThjuIDnoCt/uwvFL36Cm0mcrV
	 yj5YwlgmdNfMF+MJizKQj3W18tave2t9mwGlZ+YL0Hew3uE2inl5E+Zgf8RQoLQcHN
	 IXynS83faEHU6IeVejnmQnbdrjM22TrwFF9ywK0g8RK8qlhAIjo2riSO7okMWMmZxe
	 f9hKA82GymipQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A78C4E52561;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner drivers changes for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786068.29049.2207460431853267459.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <Y9RXXATRNqEv0GJT@jernej-laptop>
In-Reply-To: <Y9RXXATRNqEv0GJT@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 Jan 2023 23:59:40 +0100 you wrote:
> Hi!
> 
> Please pull following driver changes for 6.3.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner drivers changes for 6.3
    https://git.kernel.org/soc/soc/c/d5d39b46f023

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


