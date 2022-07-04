Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB11CCA479
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 15:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 719FAC341CD; Mon,  4 Jul 2022 15:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F3E7C3411E;
	Mon,  4 Jul 2022 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656946814;
	bh=1EFePBPz4ibB9s7uTOKEWMG2rpDgsddQJQKglZOZYqg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mUwdlmJkpKqBRlUSsbA/SfD+DmhnJcCBTX1VVewbUYbBdJXD0Mz1ROcpLSS6Fg9pH
	 SdrDZP62uRj5qdUK6VlPLbiuhF8RGM5FgJ8DKdGkLWnbMqqyt8eDcDB9Kc5gD0YIWv
	 7tnvigExrn+XjxLLbNxvNTrOYJrKycbOU6zaDBqU6dyu4fsFqK+AGAdeKOxiVzUV41
	 0ifNAn6W3hcHfXpaDKYdHo7W4tbOveUfwgtaLORl9U3djJoC56nyO3RbpcW5VBQsYK
	 5vmrVq43oIUBTzywgRRkBGdVUyIXrU6HD24uzXVrLhAXEIg9Pg5LQNYBFFRE4z7OnC
	 RJ/HkL3NxDCgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3011BE45BDA;
	Mon,  4 Jul 2022 15:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL - V2] STM32 DT fixes for v5.19 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165694681419.26251.4886468719318483237.git-patchwork-notify@kernel.org>
Date: Mon, 04 Jul 2022 15:00:14 +0000
References: <1259e082-a3a4-96a5-ec9c-05dbb893a746@foss.st.com>
In-Reply-To: <1259e082-a3a4-96a5-ec9c-05dbb893a746@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 4 Jul 2022 09:55:38 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this second round of STM32 DT fixes for v5.19 cycle. It
> mainly concerns fixes for SCMI version of ST boards introduced in v5.19-rc1.
> 
> Changes since V1:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,-,V2] STM32 DT fixes for v5.19 #2
    https://git.kernel.org/soc/soc/c/c0d1a7bd6574

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


