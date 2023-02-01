Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998F3C64EC4
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7CF36C433AF; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BE76C433EF;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269022;
	bh=h8QbAVNWQq8JZndbVEI2X6aDKIT55AQvVUzoJYP6IDM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=d1V8UrnFjaJrkcWs9Y/22xE/j/lTIPKAPGLtAQwGvBRvnjh4tHZtOxjQt5eJNIARr
	 UR27em06aX65FstXQ4LXXCJHgyGA+K1XPmKMzq3LGRKwMESTNTnaVYTnOwTKVPSMck
	 b3sHIAn7kwZJViu+msQtSqkhYeaDVtWfVH+ySYP1zEAB5qkwLNonMVCnbTDPZhY6TN
	 hk0aevAJur2medhsCOZ21WpEhONI8MGJslGq76XQcck6dSnHKQ21AE/OxyoLyM0nc6
	 04XnvPXso8sw14m5qdcoQyv+teM4HR9H949+O3jTMNjnr8ZuCf13DrYmH6W5W9CSQj
	 szmqudkOorVuw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42F72E270CD;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: zynq: Xilinx DT changes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526902226.23236.9014329047285957603.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:22 +0000
References: <850bb18f-ca22-f3d7-71a7-f367bfef4ccc@monstr.eu>
In-Reply-To: <850bb18f-ca22-f3d7-71a7-f367bfef4ccc@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Jan 2023 12:01:12 +0100 you wrote:
> Hi,
> 
> please pull these DT changes to your tree. Especially QSPI one is in the queue
> for a while. Other 3 are created to align DT with dt schema.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: zynq: Xilinx DT changes for v6.3
    https://git.kernel.org/soc/soc/c/61f1b48445a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


