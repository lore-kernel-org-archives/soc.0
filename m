Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D161DC49EBF
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 54BB2613E1; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 39726613D6;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=ZjNjwsPhHGd7qYeq4/86lHcofAMzkLF3pBImb8+3qTg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u+YAe6PtyCfxca/3ekORfI8gRQoWVMgtY8RAGcAjNwbSjAkKC/7AcMQ9Bw8vY1Tuk
	 4nkpgvF9RM5n8n6Bw4iEdaTYq8mOCl5unvjq7xDG68kycVKUM+xiShnmRy0m9WkHtO
	 3AtIwNPjTay3FuLiCbKlV+L9TrqtOeT8E6VAFUrM2dA0SQTNsWGfWsrPsA0kRnr0x+
	 Jn0g9j42BJDtp69tFEJ7fJHNsby8uyGpttueldRBqupjeQ6mE3c3/3nwcvVhdnD1Da
	 gRbcu+H0sZBghQF3gwTLofn19V8Z9eCihLk6SOB34lKVZlKFbmtI+st94ombQgrWMH
	 O+POWtinKLuQQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2ED6D60A54;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.14 - #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241118.24025.11661141203099756948.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <4611716.rnzMqkiUVr@diego>
In-Reply-To: <4611716.rnzMqkiUVr@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 22 Jun 2021 01:06:48 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> the relevant driver changes landed in the media-tree a short while ago,
> so if time still allows please also consider this 2nd pull request for rockchip
> dts32 changes for 5.14 containing the nodes for the hantro-based
> video-codec on these socs.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.14 - #2
    https://git.kernel.org/soc/soc/c/2995b50376b9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


