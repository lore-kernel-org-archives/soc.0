Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C8FC04FDF
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 22:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09420C433C9; Mon, 14 Aug 2023 22:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7AA7C433CD;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692051635;
	bh=yiGZ12S7SX/BtVez1kFCNNOOugzFVGLI/9bQEpCWmpU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZuXz+glfe09oxhu3TjoQeHzocak76laZNTsRXH+ff+JikW/XA2eWU/mqwxX+4XNUE
	 n/p/A4H25k/SU7PGXZ/Uj4hNUwfovM5OaJFZAUhxWPdD9QrH4sqZwZ7BvIcJysNEcn
	 zB3yaUUAFMYou20vGSeX9Q59Uuw1aNuRh2SM35htqeBwp+YBXe+lNCVjwXK6FVurND
	 cyQ68Xi/a+qB79NEm2+mOlOB23W+vZvAo7mF8GVySX9LWagF5ftQkl3Wox+Yck3ltf
	 0f+8z/uMEUqyXlXFz1s3IcNv8e+BskQJoWRfxl2g6gm8VokuprE1W8VxyMGa3rXugh
	 XxVZh4jk4Cvdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9FF3E93B37;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.6 - part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169205163582.23017.10531270116200437585.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 22:20:35 +0000
References: <ZNjRV0kJ7v7+DAH5@wens.tw>
In-Reply-To: <ZNjRV0kJ7v7+DAH5@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 13 Aug 2023 20:49:27 +0800 you wrote:
> Hi,
> 
> Please pull an additional patch that we'd like included for the v6.6
> cycle. This pull request stacks on top of the previous one sent by Jernej
> last week.
> 
> FYI my GPG key expired and was only just renewed. You will have to fetch
> the updated key from either keys.openpgp.org or keyserver.ubuntu.com.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.6 - part 2
    https://git.kernel.org/soc/soc/c/d02dbab12b33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


