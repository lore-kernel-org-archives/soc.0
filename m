Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C56EC43219
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F06A3C340FC; Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6BDDC340F3;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311578;
	bh=QlEZlGav3ARzYHN7Ne+xVk014kK4n0jObcIYMBxFnjk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kFJDuaawZRflCxiht0vKIc4Sipd66zYXDbT23nEEV4ztAngfE2TR9vNJevTfGrNZ1
	 RUV3r1sfqaBUW+H/nlPPNbKXzZFaDMMZzzj6PJ+ovq2HxJlvxyiX2U9RGVelZ7ltit
	 RkBn7xsU39FI2/2nuIVRYAT7ITW8zur23VTQD5lhk/sx/v4sq+NBrfSxbO7Z9tps2Z
	 LplhkAlaw47V7XehwFzhR/RwTVXwiSdn1ubu3I8gXFju+rW4gXCAnGHUgWhZT8+jUs
	 DT7vehJtKeRzMJoUjTlFjVKJuIySJeUs5vxDliU1csg8ymxoN3imhL2VYjBvkgT7tn
	 u6UtesZM4CReA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AB8D4E6BBD2;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: add myself as a maintainer for the sl28cpld
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157869.18327.6272923658249335736.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
References: <20220207184652.1218447-1-michael@walle.cc>
In-Reply-To: <20220207184652.1218447-1-michael@walle.cc>
To: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  7 Feb 2022 19:46:52 +0100 you wrote:
> The sl28cpld is a management controller found on the Kontron SMARC-sAL28
> board for now. Support for it was added by me quite a while ago, but I
> didn't add a MAINTAINERS entry. Add it now.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Hi,
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: add myself as a maintainer for the sl28cpld
    https://git.kernel.org/soc/soc/c/4a64f2d3527a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


