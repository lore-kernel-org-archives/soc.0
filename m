Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3103C001DE
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2BAEC43140; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BE4CC433BB;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=/mP9QTf2b+5Aejxi09Xkc8K0z/4KgSxNe1487YEwO4E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gC3whqkzbVg16amp15aHtLWCZUpDI6/lSzC0Ar5DJbJRWT1o+J328pWNfWX2lY1Be
	 B/OQtWnLMK1HDbkgG1fTddS7m2mW2TgjWH8yz1jW9n5mBkC6fh3PqE5StjvSWj3UHa
	 m9JZGi4XkQtfEQns5o3dYs6byYwWtQhX2D9FPqbEt5VKU2A/Gsw6ytJ96LF0rPCG42
	 tFpmlFR7AQVrm4T5eI6gbFKWcfOhi2j9+7KjDic5mz7CK5fh+yJCv9Il6HjwF7W5xn
	 7lwmqmErUtXrC9pXcN0PQvpmeBWCPxzsOq/M2y6jHsT8AtsmLXOHS2S8GJ/1A2l3ea
	 n2YRWqES1sNfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8830CE2A035;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611255.12258.12488602453533124273.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230609210452.GA17638@jernej-laptop>
In-Reply-To: <20230609210452.GA17638@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 Jun 2023 23:04:52 +0200 you wrote:
> Hi!
> 
> Please pull following DT changes for 6.5.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.5
    https://git.kernel.org/soc/soc/c/52d38cff94f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


