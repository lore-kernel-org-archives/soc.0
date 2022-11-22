Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823BDC46467
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6569DC43150; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B51BC43149;
	Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155626;
	bh=rh1ro1BM0pNOE0E5YDZIorsBiBY14tTUsj5IcCdURVw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GkN8EhynMcgug/VX6fV/t6sHDFovi95xMvdkajDhIcyM+yH1wZ8ZH+5QrVI4Ri4wg
	 A/vOkU2MC2CYNdhqpQ/ewOlBUvxL+7snAOqD+E20gNoMJu3hAsCs9zLcThMo3JxsyK
	 74mAFPvbVTMAZxmoO35UvxVJjs+vHHXWGR1pMRW7rbrSGYX8mMojUf6GAR809gvIyo
	 x/EEbmJt8P0QcFbqOjDEnKNU8gYdUt0by1jCCMTq9XOUMb5UYnJewPclBHbVz89wyW
	 wS/ekfSHjmwhkGRhCvZ/0eQvh++79dpwLO3sCC1/uA7uoWTf4C05cF0eRzee+haPg5
	 Bv4uJgcUOEf6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF01EE5256E;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: mediatek updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915562597.11152.17586756171778428679.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 22:20:25 +0000
References: <8933d687-71f0-e9ad-a7c6-2e5a8993463d@gmail.com>
In-Reply-To: <8933d687-71f0-e9ad-a7c6-2e5a8993463d@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Nov 2022 19:47:24 +0100 you wrote:
> Hi Olof and Arnd,
> 
> Please have a look on the latest and greatest DT patches for MediaTek. We got
> basic support for the Sony Xperia M5 (Helios X10 based). Apart from that we have
> activity around the MT7986 which is on the BananPi R3. Hopefully support the
> latter will be ready in the next merge window.
> Apart from that, MT8195 based Chromebooks have now support for video encoder,
> PCIe and display port (internal and external one).
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: mediatek updates for v6.2
    https://git.kernel.org/soc/soc/c/8ccf49d7fb75

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


