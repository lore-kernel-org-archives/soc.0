Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156F6CCA483
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 15:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F371EC341D3; Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D58DBC341CD;
	Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656946815;
	bh=+dXSWd/lQHoO4LOp5GrDeqCl0HmYpjP4A0pKm3o8a1Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=i9Bd6kbpgXcLrOVj0MywCPUH9RTherSEiF7o2kTiFrxCEhGrACKSg3u7ZHKkF+OJr
	 n6uV1NNnoLPHNP8BQ64as/Wr8EqktfQnDwJ9TRwM3twPA2X2JIPGV2YgcuTDoP9YSZ
	 sVNi5axc2azL0+8ab628g4oRQHplymTD1U2UKAbz5LK7bvB4AlaMd6EG0YQI5yOe2P
	 Ykz84Ljqh/mOU+dZtF/m4K4Tnuar1/d+V3J2+Y3SKTvvGqYUcPKLdkjYaOTJsH2KKc
	 yg2eadQtPUAT0FXDfiwsS5IWfVbh4+w6HyEBAQZviQELJIAQqMzowB0NSyVdPH17Ov
	 oqZLU+0Z43fCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBF56E45BE1;
	Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree changes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165694681576.26251.7082401125410644435.git-patchwork-notify@kernel.org>
Date: Mon, 04 Jul 2022 15:00:15 +0000
References: <pull-1656918942-515224@atomide.com>
In-Reply-To: <pull-1656918942-515224@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  4 Jul 2022 10:16:26 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree changes for omaps
    https://git.kernel.org/soc/soc/c/9b47c57437aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


