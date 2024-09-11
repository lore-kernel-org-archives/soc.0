Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506EFEE021C
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41A36C4CEC6; Wed, 11 Sep 2024 09:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0BBC4CEC5;
	Wed, 11 Sep 2024 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726046454;
	bh=tKQo/xqMYAHeMAyRKJGxoSOICA/OLMignnoYlQbxBRs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=b9jQzJfuBmV+o2pbBSwt0ReGBVvhvjPCwpBVs8FLui9PFpVV2q3b7agibsK6BA1cx
	 dTCyM29Mz7vhZHygZC2H3EpW4370EEwNATc02cZseOSpJXNjcr6H4530zEa7AUGNRC
	 +5j3oN76b8eNxs5eJR5n/GCi1+XgBn27NWXXlaPLAUdo6g0slgy+79dzjg81HWxdO7
	 1E8Q9AmhAoCgW+ox0A1LhTo/3ghlw/OOKVNDQacNLf3yMGZaVKnXw9NXzA/Zvma1ch
	 aHlIhqHDz4nbTn2nGEkAo5JBdYTaXTSuOBn0FkK1HG2YMagYFPjDeq5ahDbCv/5Bzg
	 zgAsKALyu7ffg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713E43822FA4;
	Wed, 11 Sep 2024 09:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firmware: imx: remove duplicate scmi_imx_misc_ctrl_get()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604645524.555636.11164614514618053587.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 09:20:55 +0000
References: <20240909203023.1275232-1-arnd@kernel.org>
In-Reply-To: <20240909203023.1275232-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  9 Sep 2024 20:30:18 +0000 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These two functions have a stub definition when CONFIG_IMX_SCMI_MISC_EXT
> is not set, which conflict with the global definition:
> 
> In file included from drivers/firmware/imx/sm-misc.c:6:
> include/linux/firmware/imx/sm.h:30:1: error: expected identifier or '(' before '{' token
>    30 | {
>       | ^
> drivers/firmware/imx/sm-misc.c:26:5: error: redefinition of 'scmi_imx_misc_ctrl_get'
>    26 | int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> include/linux/firmware/imx/sm.h:24:19: note: previous definition of 'scmi_imx_misc_ctrl_get' with type 'int(u32,  u32 *, u32 *)' {aka 'int(unsigned int,  unsigned int *, unsigned int *)'}
>    24 | static inline int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
>       |                   ^~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - firmware: imx: remove duplicate scmi_imx_misc_ctrl_get()
    https://git.kernel.org/soc/soc/c/540c830212ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


