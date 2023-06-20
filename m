Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9675C001DD
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEF95C43215; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94A63C433BA;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=kiEAE4ASJZ6m3z8aCad6GMQ3bRxlEjEmd6KCU6HUgyw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DXRdhrpzidYddOkVQTatHugFGR9CUzpAdD2wMBqOrZJrf7VElrRhKHZtfGu9W8InC
	 GPzL3ytSu14T5JGL+jlsrcbeELl16gZoqKafKvngnHkVes/CX4xAEkIjM8VCZhW69I
	 AC/WAeuxs9IFA2UG/Mf/ekzTmJ/F/3NXhzByUPad67AW7OLZ35CMIZf71szV/0XOTc
	 4PAHFQcq8FugrStZ8JESkg+UI5t32y8TMAaTJCNnAg37Fpx689UzVePm7CYi0yBhDn
	 8nu04ng2iunnN1Zh+kPHCg/4XO2egfxJIUP+swVpF6rF+RhtMKCJvUO+gbEdbRJHaK
	 G0+XJHoaYRThA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F0BBC395C7;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32MP25 support for v6.5 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611251.12258.14928138570632325402.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <080fc303-45c1-6cc0-4c5e-694e730896a6@foss.st.com>
In-Reply-To: <080fc303-45c1-6cc0-4c5e-694e730896a6@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Jun 2023 11:48:06 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please find this dedicated pull request for the addition of the
> STM32MP25 (ARM V8 based product).
> 
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32MP25 support for v6.5 #1
    https://git.kernel.org/soc/soc/c/868a11b602cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


