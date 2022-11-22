Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F24AC4708B
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7074FC4314C; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59623C433D7;
	Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155626;
	bh=neEqIYVVGMYQEXFI8mjEn0LDAWhhcCyhF+6tb5OALVc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tBl+VJSgq8QM7KrEww4uUiA0zFcflXkib0kelKZjgFCIfWvtI1ubyLqp0qUdq8n7N
	 QII5mqvilM1ZY56BGTEMO8LswU8xeZd9rJ55H2qQCV6q2JFBaCKWc+xakE3gFuuIAM
	 nYCqlQrfiIKu+w+SFA9snOLntGmsuBOQtXlI0A/iJ8Lsnf1D0tUZUs3UqWeKk0v8ZQ
	 oayQPzK+LlEbYz2O+a+gibv5a3kQYsa5Ye0POiJb84IEp4ragIWTOmPp+NJHaMZqcY
	 g6Iaz/MeAu5CGbhBcV/OsMkchhl4hBej+uWClpDNW8/Jyw/NWzn3m76IT/cx4NoYN3
	 elpRqPs8m6VxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0287FE5256F;
	Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Add DHCOR to the DH electronic i.MX6 board
 support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915562600.11152.1119485750104104630.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 22:20:26 +0000
References: <20221117105131.7059-1-cniedermaier@dh-electronics.com>
In-Reply-To: <20221117105131.7059-1-cniedermaier@dh-electronics.com>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Nov 2022 11:51:31 +0100 you wrote:
> Add DHCOR to the DH electronic i.MX6 board support to cover the
> DHCOR i.MX6ULL SoM. It is a solderable SoM.
> 
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> ---
> Cc: arnd@arndb.de
> Cc: soc@kernel.org
> Cc: Marek Vasut <marex@denx.de>
> Cc: kernel@dh-electronics.com
> Cc: linux-kernel@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Add DHCOR to the DH electronic i.MX6 board support
    https://git.kernel.org/soc/soc/c/894799e1f496

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


