Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31123C64EC6
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19910C43442; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F158EC433AC;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434645;
	bh=GHEDmc7+n5Ww634R4RZ+PyAbWHD+wXgh9snoTmymoAg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Yl/GGo9uSyuPx3gABvIsg0chmXyK+IPK9XZkwHHcNc3Idqki3TP/m7kzd+Abb4i1/
	 RTSbGm0sCX5hSfqbY5d1hrU4vNdsAfHicOaSbRdqhInNCmOHg/mhm/3sPC5UJqprcH
	 XYO+EdkemInBTSNdOA9qS5FR4grwR8q+dGmLh9ed4H6AhGjlkF7ggmMkO6GHSCxWJx
	 UMwKY/8J3gy6fQLr7w+o8qovp62OSWJvRLZpuhtrzxbyWh3su14JaZerBfrri5fIjH
	 OBQvgR+ahnH1LIO1L+NTh4w3K1qQnA65Dixtjtyb6e6bKYZNEa3o0IDq9Jm8bnJsRy
	 /RDgw69xUqAJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9C8FE50D66;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: mediatek changes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464481.16250.16810233234370094468.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <17aee808-1f3f-fe75-68d4-adb71915e5cb@gmail.com>
In-Reply-To: <17aee808-1f3f-fe75-68d4-adb71915e5cb@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 1 Feb 2023 19:04:09 +0100 you wrote:
> Hi Olof and Arnd,
> 
> Please have a look on the 32-bit DTS changes below. This round it's just a few
> cleanups.
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: mediatek changes for v6.3
    https://git.kernel.org/soc/soc/c/195631f73a69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


