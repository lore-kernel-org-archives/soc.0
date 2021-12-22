Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8260EC433EF
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 19:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E56DC36AEB; Wed, 22 Dec 2021 19:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36407C36AEA;
	Wed, 22 Dec 2021 19:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640201413;
	bh=sYafjhtKLJEvpMt1KW+0ICSNAXTQxeVywIvoJzXp9Po=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pNF7/bt76mokL6Cs14L1OaceXnDV0/tlH7t1aOcr0YSdehX/CYch4lblU8zuJxQCw
	 /M5WVmvgQ86hc200aQTpKy/8mo8LwYWCcc8sys2ek050yC3sBLchT+5O+rPo+FRjwQ
	 E5lV+yQRXvdqvAd6DzDPZLXkhxrVVe3k6Ny0+AKhfQMtFCKIhPzko37GpypS90XqFo
	 ttq+m/0LptriyZuKrrei9JVUP2ogS3XuBQDCyZ3w64XQEpR88pXvhaa6Ily6+Nq4cd
	 f7RAqlkpbNIZrjN/Xzef9VcBiXDWi+7Un0qr4mLydNtbq5OY/1l5WaV2Us0O8LSEIx
	 SaT7v8eztBxzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0DF8C11999A6;
	Wed, 22 Dec 2021 19:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164020141305.1988.13161368640046496983.git-patchwork-notify@kernel.org>
Date: Wed, 22 Dec 2021 19:30:13 +0000
References: <CACPK8Xd1RfMLRbwBWqo8nm=w0V2AubmzraVW3h==XBcs21+mnA@mail.gmail.com>
In-Reply-To: <CACPK8Xd1RfMLRbwBWqo8nm=w0V2AubmzraVW3h==XBcs21+mnA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 22 Dec 2021 01:54:19 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are the aspeed device tree changes for v5.17.
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 5.17
    https://git.kernel.org/soc/soc/c/d8db5d8a012b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


