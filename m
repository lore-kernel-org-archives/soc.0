Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ABFEE49B3
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81684C433BD; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BA20C4167D;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=neeKBgXUdZ4+pYZ16yJ+OoJilY7t5e+dDMKv5rXTG40=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rxuMq7Dcc4NpJHg2hUyQ8Ze8hi49Ny/AInARocmqGz/UoBMZkbY9o1Ji3BuN6+YzC
	 sNGQn9CXnGmWSibnkB1FQWGbW7cLwJjQ1+KHcm73ULHEYnFYQeW6Md+XSZ36tE6U15
	 dovBnxV70Atn+26PXHeWGama7ej8aD9K4FDLN8cWk+/212/YFD2tePoefIghYdiHyz
	 jLeaxo2cqMutiTGyvD4G1zMhhFszrkBE6JZwT9ZNeGih3N70hgjyvZA3OARa1LYuG6
	 s2bs63m3uVShtUo1vFilMqtkbutGGdKUYYH5Hlenh64XT7s1CwDveaBfCh9rCS4JR3
	 D6TY6YBohOHMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57209E4EAFB;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.6 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147635.32531.17845455659008482656.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:16 +0000
References: <c0524a16-ab27-0cb5-8e7b-c12f7bde7e0d@foss.st.com>
In-Reply-To: <c0524a16-ab27-0cb5-8e7b-c12f7bde7e0d@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Aug 2023 14:27:49 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT for v6.6 cycle. New OCTAVO
> boards have been added, SCMI regulator support has been added on
> stm32mp13 and some patches on MCU side (display and CAN added to
> stm32f7). Note, there is nothing for STM32MP25 (armv8) for this cycle.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.6 #1
    https://git.kernel.org/soc/soc/c/aa2951a8fa3a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


