Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEBEC4167D
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57CF3C385B7; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41399C385B5;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970615;
	bh=48Hmbjd3Lzt0+cpC7tbKMv5yBRUb5+q3A0luZKOAXMM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jhTGK0TQ3mRRTNifHGC+TfIMQ1ZnYy/qSboZjbx3mPFOST6cxm+X7/LQ+n+AmqLWR
	 Ez1FuGrcOKSlV0BdS1ULJXXIJwKn7tEyRMQ79tbA6tsP/LtFEwyYcJraHIMAdyUCOl
	 7d2Z1kqDFAyH7BzeSWapQc/WBcqWtumMs6IwtkmGZ5LUzVuYA1xKihD3g+wI6sGjPn
	 AkTdB08zZbZeQmwFjRmI/fyf2WEeNyIVVwHqyPE8KWrMYGlikM6nXxKaFw9fW5XVrY
	 y0bjFuyNcy/12wylGMhGp59U78xcAmHVp9nP9+EK7yc/v1jvBPkLG6QX8b9CNVBkjM
	 Ah0MjRtm2VyCg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D25AE85D15;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: Fix more boolean properties with values
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061518.10394.6820344761614847429.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:15 +0000
References: <20220407225107.2175958-1-robh@kernel.org>
In-Reply-To: <20220407225107.2175958-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Apr 2022 17:51:07 -0500 you wrote:
> Boolean properties in DT are present or not present and don't take a value.
> A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> matter.
> 
> It may have been intended that 0 values are false, but there is no change
> in behavior with this patch.
> 
> [...]

Here is the summary with links:
  - ARM: dts: Fix more boolean properties with values
    https://git.kernel.org/soc/soc/c/558bd89edc06

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


