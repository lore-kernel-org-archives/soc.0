Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BF2C636D4
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D72EFC433A4; Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAB1EC433EF;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434644;
	bh=GGSYK74r1qyrBGsCMYsMLGrikJIe2bpX9o9lXYhvkQY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gEpKtIYFtL+hT25BIUIay8BhrKaqMvin4Q44Oprb3LTf8UrIr4s1cRJu3VRFWU5dd
	 lnJDi8QI5lpwDos1vkscLbD9wfa9jXcO1Nej5HeqgwLh72em16ytp448W2TT54j2wN
	 JkYOFy6NpsnvhvRCt2/Ztf5n0nJUG4lRoUPP10h35vhKUuyKmngUtij8V39Ane7mI6
	 pgRB+wwvhKjgdmZ+lAb4dgnYNryjTfDJoxObP3mueqqazyjGX1Zjml1CvwWH06kz2m
	 dl/oLmAATUpMjB977SgtY21XORHhzBolKbCenVfuyJ3bsjcvKbCzvTP5MsHkF68+Fz
	 g5/mTGwpG/SMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1479E21ED0;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: mediatek updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464465.16250.925897766165368894.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <2eefe6d4-6ca3-dc5f-6a04-f4f3c49692dd@gmail.com>
In-Reply-To: <2eefe6d4-6ca3-dc5f-6a04-f4f3c49692dd@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 1 Feb 2023 19:14:11 +0100 you wrote:
> Hi Olof,
> Hi Arnd,
> 
> Below are large list of updates for 64 bit based MediaTek boards. While we have
> some smaller updates to older HW, like MT8183 and MT8173, a lot is happening in
> the around the Chromebooks chips.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: mediatek updates for v6.3
    https://git.kernel.org/soc/soc/c/79668653e7e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


