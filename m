Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88833C43219
	for <soc@archiver.kernel.org>; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56D5DC340FB; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FB0DC340F6;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645216811;
	bh=TGZxblL4mfSZGV2AEBWZOyJgfhuuB8DILPdfnerTNCY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TJXqPg97xC+MPftf5Dx3N3VBBgsQa2vgBjgNUU4vAvFSSc0cSo9RDAolc8IK7JSPZ
	 Ojk33wBFK2WyEL7s7Wv1L8Rt8PBxACiFjK27CETQAifjXTE3LBnxTA4AovcEtTtB1z
	 e6+ikEnpa8Xq5du1PSEC4ZVTeAcVWfUhZ8Mg8u518J61OGQ4TYqBNin/jXZgQwxiJI
	 eJOIkdQ07mp8zxJUCMYHcr2+P8L8SU46xHZDF4lTa2/7uEJZQgz8lcjQIwLUSpITJT
	 BimsOj41XnrzaH6e9Z3CCAW3oOI66GV/WbCpdoK6+8jlXQq7z/O0bf635MtSQItnob
	 GC5G0k+0V5zgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 212B5E7BB0C;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] ARM: dts: socfpga: dts bindings cleanup for v5.18,
 part 1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164521681113.10306.8603675438922329159.git-patchwork-notify@kernel.org>
Date: Fri, 18 Feb 2022 20:40:11 +0000
References: <20220211112556.98940-1-dinguyen@kernel.org>
In-Reply-To: <20220211112556.98940-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Feb 2022 05:25:55 -0600 you wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.18_part1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] ARM: dts: socfpga: dts bindings cleanup for v5.18, part 1
    (no matching commit)
  - [GIT,PULL,2/2] arm64: dts: socfpga: dts updates for v5.17, part 2
    https://git.kernel.org/soc/soc/c/35f541791175

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


