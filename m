Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF97C2BD09
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DF8FC4AF18; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77E39C4AF11;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720533033;
	bh=R1QAVqPAli8hj7/X2oPDqptsuf5pCaJH5xzR8C2z6y0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tW4OygVWhf4uqMtY1BST14MSpOjtgBhsC9G9lQiBhJ3Y+vANZDGyoZTDHl3SfJHcI
	 bP6FwQPuTSjnytfVfpuQyGwgSn2WmL5M5NKQt5O+E8XHo2uWKUFCNuXI3/huTd+Tit
	 vtAS8n6IR/drWvdtlsSP+eTVr6zMAYRuoAJMTjNDFLySxl1Hb5oh7d23nrRaDMxXnn
	 BaLhnfRW7MWUSZpmnLaq1NlV5oFdhYUC5qbpPrYwJkMReEv8O19sdnVhhi81Eqtpba
	 hznVsxOhlVZ6tWbMnDkus9ddLZFmzM8U7z0ANt7IIfQT2vvMCyYhsuqa33sUopQQCe
	 2wscCPntL2dQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6390EC4333C;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Fixes for turris-omnia-mcu
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172053303340.5265.12346125335046798620.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 13:50:33 +0000
References: <20240708114002.4285-1-kabel@kernel.org>
In-Reply-To: <20240708114002.4285-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  8 Jul 2024 13:40:00 +0200 you wrote:
> Hello Arnd,
> 
> test robots noticed some bugs with the new turris-omnia-mcu driver while
> doing randomized compilation tests.
> 
> Here come two fixes.
> 
> [...]

Here is the summary with links:
  - [1/2] platform: cznic: turris-omnia-mcu: Depend on OF
    https://git.kernel.org/soc/soc/c/5423a01df8c5
  - [2/2] platform: cznic: turris-omnia-mcu: Depend on WATCHDOG
    https://git.kernel.org/soc/soc/c/dc3c836f9b0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


