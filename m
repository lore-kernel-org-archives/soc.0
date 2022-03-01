Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7921CC433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BDCFC340F7; Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 223A9C340F2;
	Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646138439;
	bh=hkw0AglQlCEYhISfh8Db8LSMGAiX9BOmyYPJYMM+EEs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aAlxnI2clsjnG1NrC6Z5Cbqer6Uj/ZaKhuKIHVbq/xI7B5VKlWjE87qbIfwIFg6ig
	 8AVgtoocmOceb4iI1Ak5qfJaSOgW/E4SfrINfpZXZPInkvFFXy/xH/8JCcrF2qRFLV
	 cHzpJB1IogLF5NR7X73fBV4rq/gnXY//xLtK/0ajTSASpgIZp87yeZucowiXJFqDwx
	 GSA9rud4I/tDtFyEMRenR3zqqTv2llQZ9Wq9z8uArbkr13Zyh+O1mUS4btsIA15NNE
	 IzvUAwfIpfAjZ0lPtSyFV9giCPj3WMChMN27oyC9sC8RM7T6EPcr2DHj4jUjgBZDny
	 E6yEhX9tw4IwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0404EE6D44B;
	Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: mstar: Select HAVE_ARM_ARCH_TIMER
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164613843900.23712.12816616872795888973.git-patchwork-notify@kernel.org>
Date: Tue, 01 Mar 2022 12:40:39 +0000
References: <20220301104349.3040422-1-daniel@0x0f.com>
In-Reply-To: <20220301104349.3040422-1-daniel@0x0f.com>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  1 Mar 2022 19:43:49 +0900 you wrote:
> The mstar SoCs have an arch timer but HAVE_ARM_ARCH_TIMER wasn't
> selected. If MSC313E_TIMER isn't selected then the kernel gets
> stuck at boot because there are no timers available.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
> 
> [...]

Here is the summary with links:
  - ARM: mstar: Select HAVE_ARM_ARCH_TIMER
    https://git.kernel.org/soc/soc/c/ea49432d184a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


