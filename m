Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2A7C47090
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36519C4314D; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 195F1C433D7;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=XTkUkUV8yhH5/gun38Z4GaCm3VnBi2FxF9dNSF4IiPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ldi/G4AGADC9pXVZbf/Rc3P2JnK99QkjyW6i200WNnUrIDD88/ndZwb19x+ODH6RJ
	 21rav/xi4Nj4Xw313rPVDVVo9MSJw2BCIQxK0V9A6aNUav/+djlSMfpN15cwPzH589
	 288sxFtOdjUWTkjTeRAVjVd+NgEcM9U8Q6OV77wGIWkL3RV1Dt62rWr2Nc2niMDpZm
	 FCpuyAjx4BbtSq8qs4WkSSs87gaug/AviRM2rqD+5ven+qnL8XJRzntHRrIAhduuhi
	 tTV0U66Zap79A43fNmO54zYC4h9jdJ73Iv/WoYN8kbkwPsHbvZmItP2G3byosWJ1wD
	 oK1ZwBCkcvI4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E04CFE50D64;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC RTKit/SART updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826191.9936.10336413199114300660.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:01 +0000
References: <57f84134-8645-35f6-2427-ee683800c413@marcan.st>
In-Reply-To: <57f84134-8645-35f6-2427-ee683800c413@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Nov 2022 20:41:22 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these RTKit/SART changes for 6.2.
> 
> This batch just contains two correctness fixes for issues reported by
> the kernel test robot.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC RTKit/SART updates for 6.2
    https://git.kernel.org/soc/soc/c/e0d394e4eeec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


