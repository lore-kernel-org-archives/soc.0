Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC57C4167E
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDF93C385B3; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0FF9C385AE;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334247;
	bh=OO8Fj+AQNnAlfxw41EvWjP2TOuOGbNZFW2r/ilHEwB8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UAu1c7F3+6fw6/yUPDY+eB5EEMcLQA08SDZQbP0gPiNrRKPpgxAotdIZa0dmXMWqG
	 t3soNc/Kin6v9h1knWrx74mReY1wTHbFRrvI9PFNWgtqjIQGEEjNr+Mi46b8hwFXpv
	 m+2Nk8J1zxHyThdb6esX0QcctYlj8KMaqlJG3OAjFG6uGGguQAL/1VfNuKn46FfeWM
	 x0rE5c90xUD5DFooHYowDkKWjVFdkhme11KQZ83A/XaFHewzI7grqIeSihFDmuq2Tg
	 sLI+jTQhY+7OvtV5sgGh6wjpw4Xh7NbxI9O9RGCZxYwDYOqYf6uU32/sXmydSZ0qej
	 v/dhtA9RAUyNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5E5BE85BCB;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] arm/arm64: dts: qcom: Fix boolean properties with
 values
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933424767.10369.7892003175453214256.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:24:07 +0000
References: <Yk3m92Sj26/v1mLG@robh.at.kernel.org>
In-Reply-To: <Yk3m92Sj26/v1mLG@robh.at.kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Apr 2022 14:16:07 -0500 you wrote:
> Boolean properties in DT are present or not present and don't take a value.
> A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> matter.
> 
> It may have been intended that 0 values are false, but there is no change
> in behavior with this patch.
> 
> [...]

Here is the summary with links:
  - [RESEND] arm/arm64: dts: qcom: Fix boolean properties with values
    https://git.kernel.org/soc/soc/c/bc2fb47db586

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


