Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F45C3DA4A
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B951AC4AF0D; Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A42DCC116B1;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468245;
	bh=38PmKliWwgD3EvGc/2j4+qLOeYRZGeKYRkG++kJBRh4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=U3U6Svv5bay0AKbg8VpKLqKOtzWTorxhO2/kmvM3YmvGVKb/9IOhndmaUXAmWYNjT
	 LJXxfQWDJYy5M50aoK0bDtu5k3fqHo1YtN1xabp0W567Q2U9lLFCzDuK69zUMa1eog
	 5/qb61PKqDIbY8NVjIcgWsdei4bFHHVILmV7zz8gX77gM4OFt9lHe1RMYIp7u7hq2G
	 qLiVQ7C+EQ7b6/NN8nBMAf6YYmge1EacgYcJHtWLK8a8AwoPpUQMGt/LTyAlsIvqty
	 iHq8+Th+7SQXOwszt5D8EEJzXTeBLSku8s52xcaXrMQpuOLOTPIDqul2oT3bwqGbLT
	 2g9GwB4AbfqGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8CD91C433E9;
	Mon,  8 Jul 2024 19:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 devicetree updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172046824557.24660.13662272204524498202.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 19:50:45 +0000
References: <37f251a1-f3bd-402f-ab22-cf786c3871d7@ti.com>
In-Reply-To: <37f251a1-f3bd-402f-ab22-cf786c3871d7@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 5 Jul 2024 20:41:13 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.11
    (no matching commit)
  - [GIT,PULL,2/2] arm64: defconfig: Updates for v6.11 for TI K3 platforms
    https://git.kernel.org/soc/soc/c/31f62c5d8811

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


