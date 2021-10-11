Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A19C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 10:20:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2788A60F43; Mon, 11 Oct 2021 10:20:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 11B0560F21;
	Mon, 11 Oct 2021 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633947655;
	bh=tNcZyLYfVWYLLeyDV9G2GcWWDhvmoz9ZKAw8uRVz/t4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nTgWBjjMdvQH4+v7hOamRD/WeSf8qIWAmswk461JhaOH/CRGvwxeEcUsiai18u4Sf
	 XwGl3rmYU/02xnw//JVkWXmaFdLBlUDiVwOlgPn0/OKKRjzT9BllgUEP4F6jmjabJD
	 SAYc7f++MoTonuf+gOIhLymarf4SkJTh0x7/mL7lo3T7qcejOOGzHuhSh6doivu0tf
	 YQVsgThUAyQYI7TF1zd9vjAou3DfOCoVVftmqqpl4hNE1SjXLNAdyKQhmdQH29T/fq
	 ed/AYWOzKwo9P4DK4AOPvgV41riXl0p0XwTgJlI6Yew7VMuL6HC6+74m6zG5aeYlmM
	 rxE2UjZd6hHGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 06178608FE;
	Mon, 11 Oct 2021 10:20:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163394765502.9012.8484483900352184158.git-patchwork-notify@kernel.org>
Date: Mon, 11 Oct 2021 10:20:55 +0000
References: <20211006153231.4061789-1-sudeep.holla@arm.com>
In-Reply-To: <20211006153231.4061789-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  6 Oct 2021 16:32:31 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fixes for v5.15
    https://git.kernel.org/soc/soc/c/209ee634bc0d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


