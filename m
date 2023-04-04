Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640C6C77B76
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5701BC43324; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41E12C43321;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619284;
	bh=ec7cYYcMeHtHdcQrJQdMoBYyRXIpqel7HASprtuGqwQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bOveIjTgwwq3irqc8LdIPFsasxxe+X2qM6dk0d0v26n8OggQzqX15zqLiEPiRV6Pb
	 dRebgw7bMPSnJqPPOq9ozTK0KzqaeixHpAr1pxoNH/5gJvQvJRZa4spdGt9P0wL9Rr
	 kCtjPMZfGz5WWblPzKYAFVXEIoGv7KIFy8ZkSQscY2UA3ITpyaBI2N4CWG6xTfuDVX
	 er+ChDg3MvaJ1YgdhQ04w5mGqEH9ueXxSWBbjmIYKEWY1AxMvta0KSfK7FobE3ymx5
	 GHWnZQUyhsJsVqZKqMozaVcxu/3GRjBU4NIKZpAb8Ign5IG7/hSceJKttDDE1yfSa3
	 ydTFeNgTN3Nxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2E15EE5EA85;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Driver clean-up for ti-sysc for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928418.17322.1297378068830404940.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:24 +0000
References: <pull-1680180355-69164@atomide.com>
In-Reply-To: <pull-1680180355-69164@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Mar 2023 15:46:10 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Driver clean-up for ti-sysc for v6.4
    https://git.kernel.org/soc/soc/c/4e7b171f4e59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


