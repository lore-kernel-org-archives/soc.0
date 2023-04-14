Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE209C77B79
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89891C433A4; Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A41DC4339E;
	Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681505423;
	bh=9z+j0+uc5vmG7/4igY60KK4FZITUbG0yRcJGhROKK24=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UohSBuXIJMSDApdHhlwAUuxEhrn0da4aeYU3fpaAj9l3epSCbCCQVt0qMMzjAkuUm
	 ZaG26Sl1BfOOjW7QhuTXvmrkA/f2An8EoV8c0PGCfXXFAajUqV308BZtKTtSsSjh3w
	 93+hny0T0za+oLI9/Yg5efsjw/4PfHfJpqoTlzTrEG1M8yI8bF4S+ixYSI+ZcKZNsN
	 ZPp+HYwtRl2EJUDx22brx+KyHR8fhCCfip3wkiYsbx5GHiyQGePYuvOa1tPbxyaIEU
	 TocmNQBOvk7jwGkFDVV8g8npqGGTJlBMifmk+ak7C5ca69gyoFABnRzb6KGOdz/laP
	 /eKnP04xKKBhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4EA70E4D003;
	Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek ARM64 DTS updates for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168150542331.1155.725416689215796319.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 20:50:23 +0000
References: <3626ebcf-d64f-cfd1-517b-b6bf8665a227@gmail.com>
In-Reply-To: <3626ebcf-d64f-cfd1-517b-b6bf8665a227@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Apr 2023 18:55:36 +0200 you wrote:
> Hi Olof and Arnd,
> 
> Please have a look to the 64 bit changes for MediaTek chips. We had quite some
> activity to get GPU on the different SoCs used in Chromebooks up and running.
> 
> Apart from that we got support for the MT8365 SoC and EVK. Also support the Sony
> Xperia M5 (based on MT6795) get more mature. It's nice to see how MediaTek
> upstream support is taking over other areas then 'just' Chromebooks.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek ARM64 DTS updates for 6.4
    https://git.kernel.org/soc/soc/c/1e14b4f9d908

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


