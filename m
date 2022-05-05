Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60862C41535
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FC84C385C3; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FE16C385BF;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779108;
	bh=2l8+taH40uEZ2AjtbvqGqHfr9BU5gkw8hZdrgdCMFmo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SHcXtQApKex8gI0MRp8dUOChkRvyY3VVo/+qowUSguDKA/nClCZNat+II3TeFie5u
	 8iSvjMDlPqsqLEHKaLDW+LDp7wVRtsXO1Xn1CAILGImAKtwgZN7aEeXRXpa8Hpb+hq
	 IY+AjBnMLPkPdg+0x91T5V+gIBDhp91cS5tnmrwZWzhlwde8xpI+QVENJgVzpYddDU
	 NlDRLxBL4IykkBokYZiJIPh4ds6lWBjlPE4mgY9/5H+mU4myEJatNK9AS7TacrEZ19
	 nfDA4PafzLO1lSNW/KJZzczHuZiVJVZAbRHgZ3lFigIAMqt/3J4OUg6oqwNUoN+zDY
	 /AWE4AvvSe1Dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18C20F03848;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v5.19 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910809.9627.1413260249228424522.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:48 +0000
References: <5818c943-882d-7e50-430d-ae3299a108ee@foss.st.com>
In-Reply-To: <5818c943-882d-7e50-430d-ae3299a108ee@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 4 May 2022 12:56:02 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT updates for v5.19. Main
> updates are related to new Protonic 10BaseT boards support and the
> addition of a secure version of STM32MP15 boards (ED1/EV1/DK1/DK2) based
> on OP-TEE OS and SCMI protocol.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v5.19 #1
    https://git.kernel.org/soc/soc/c/0fd8954b9e8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


