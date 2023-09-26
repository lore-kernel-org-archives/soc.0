Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A48E7F127
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1B66C433AD; Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA1ACC433A9;
	Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762232;
	bh=q/T/CMs76lOo12Z3fQz/nhA6cZADUi8MsPhc85nCHWQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RfJcX0pUpFdHueXj685x/1a7mJf06y5DxzsAwjLfJTg97oqAt2tfMEvSYqduPY+/r
	 NEq7pDcbM/umXAar5VHpgggAexO8PYpDydkITbCqrv0a3K7qWhrnfVSCkq/DSwrYwZ
	 Dmg0Md/A7nRj+7mlQIRev8nWwiHPPMuJI5uOhzZ1G40pzXK6aYgKgD4ZsmJiwAO675
	 ymdgre/t5ETi/IcdQdQFT5LCWueZifyZL+EKsUYK2XZ80MH/hfk/2VBleWuEH6Yf0Z
	 yqnKkKRLxlj56fCuctySdbH1R7taEdXSxu65Er+7nnTq9lZ+tlNblAwHLBB441++22
	 J1BzP5hPV+3/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AB74CC6445B;
	Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] soc: loongson: Fix some issues about loongson2_guts
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223269.24546.1407687019084526646.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:52 +0000
References: <cover.1693534134.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1693534134.git.zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubinbin@loongson.cn>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Sep 2023 14:25:47 +0800 you wrote:
> Hi All:
> 
> I noticed that there were some minor changes to loongson2_guts on the
> mailing list earlier, but they were put on hold because they were not
> cc'd to the appropriate people (Arnd & soc@kernel.org).
> 
> I'd like to try to gather them together and resubmit them.
> 
> [...]

Here is the summary with links:
  - [1/2] soc: loongson: loongson2_guts: Convert to devm_platform_ioremap_resource()
    https://git.kernel.org/soc/soc/c/840844c26239
  - [2/2] soc: loongson: loongson2_guts: Remove unneeded semicolon
    https://git.kernel.org/soc/soc/c/e756ce123c9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


