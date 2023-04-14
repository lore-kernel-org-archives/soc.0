Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DD1C7EE24
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8204C43328; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D31F2C43325;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=mZ2ZmM27Iq+8eEmcsv+SGpTEViHW/ClsIANurtoef7E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RVU/5Onjo3pSB2zWX//Cy/Q9zf9T97ZZjKxNoZ69cuD6c2KPs6Re4xu5rbDWsXV2T
	 lr/h1fIJN/kXpFf1g23ZRahM5E2wppFONAXxZef04mxUoMnItLfCF1lMCIIztzjBht
	 Nb+rHTTMpD4rKBXBpZXARj1KfsqdmyieKx06PS6YFKJMy6K7C7iS1avpKAhHW7Qd3R
	 2bvmF3QEIIuwFS7MoGWFmWhvkWZ5RXlvJMKVmROInlV3z9Gnd8B34ed2dnJ7VTTXXh
	 9c+0Imqr6wEESyoXssuTb6/R9okWpOYQ/AkK8L5kYRXaVJlLNdSqilcIyaGe2An64y
	 PgUzOSWIOtfew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C102CE4D003;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] soc: ti: Updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926378.30442.17220961121842064089.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <20230410140506.ucvkwq7vz2h47vyj@stipulate>
In-Reply-To: <20230410140506.ucvkwq7vz2h47vyj@stipulate>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Apr 2023 09:05:06 -0500 you wrote:
> Hi,
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] soc: ti: Updates for v6.4
    (no matching commit)
  - [GIT,PULL,2/3] arm64: defconfig: TI K3 updates for v6.4
    (no matching commit)
  - [GIT,PULL,3/3] arm64: dts: ti: K3 updates for v6.4
    https://git.kernel.org/soc/soc/c/c47b89b4189f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


