Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D8CC3DA49
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AC2DC4AF0A; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E168C32786;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=T0HRDIh8R2HtAvZNaPpJ3qe9b0D3V12Rfej5u2Vmgg8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hR5rHd2e8OLAcxiRcK0tIJ7aABgKb9mjj6vTb+u2tpkUihl9kGf0ArtL8lrR6Hkfp
	 qXohRj28kNrrEj7ajywovS9YF4Y+Wa+LwLx/YRKj4myReA+THvKrO/7hQ9/vQ048aS
	 IOUi1ln8oDrHJYSg0c3dE/YQVL1yuELZT2f7KLBV6LXISHjlVFvpNUAGi7semLJ4No
	 uTYE9qa7EdnEDPz+IZk2L7RlhAGXfXkvg7AIH6xXjfI6gQd3dr8p4JK0OAly5mM9St
	 6zhaHQFZ4cnG1ec4RBoTD9LW9dxJfXhELHG5DfOwR1avKK6aSEIjf9s6SOtUsQk7jT
	 YumnFEAVuuQPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D590DF3713;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: stm32: enable scmi regulator for stm32
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743824.12156.8724610610025413505.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
References: <20240705134554.2833835-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20240705134554.2833835-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 5 Jul 2024 15:45:54 +0200 you wrote:
> From: Pascal Paillet <p.paillet@foss.st.com>
> 
> Add SCMI ARM REGULATOR configuration for stm32.
> 
> Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> [...]

Here is the summary with links:
  - arm64: stm32: enable scmi regulator for stm32
    https://git.kernel.org/soc/soc/c/e9a316affb9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


