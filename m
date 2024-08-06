Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEAAC52D70
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50291C4AF0D; Tue,  6 Aug 2024 20:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB79C32786;
	Tue,  6 Aug 2024 20:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722974903;
	bh=NV83mUkjAx3qcDY7VWJooqMSu5YSZjfJjvdS//IRPH0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=J1iKaR8NF8Fm3kj7AuSfUjNCWcJE08jVOUHsrXPR20oYmLDYFpPR98qUcw6ZbpcT2
	 nr/t8GCIldvYcSzYqROC5KaVQtLBVFE/R5bd+rpQYCHmpZELucgcbBEeGUqSwvW7AH
	 ejFqdTo54rpnnvjdFd6xMI4ogcKnFcgT+SMkSrBoMDTfNeBeTJP+tlfxk4W/c/lRSp
	 aaTDL962JolrjoWi4vO3dPaBcOoF0835hYUMsWCOhJjw+F4Ud2XkWzsmqN91sRDwWP
	 sSnfNoJD3yzEFFOUJAv7JNe8oIi2rt/e35qPGz9qTmDHRIOBvJXxOHp9tHj6bpjwHX
	 djJ224QHvesbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33EB63824F34;
	Tue,  6 Aug 2024 20:08:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] turris-omnia-mcu doc fixes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297490199.1692635.16377961221723946815.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:08:21 +0000
References: <20240730144924.25552-1-kabel@kernel.org>
In-Reply-To: <20240730144924.25552-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 30 Jul 2024 16:49:22 +0200 you wrote:
> Hello Arnd,
> 
> here come two fixes for turris-omnia-mcu driver documentation.
> 
> Marek
> 
> Marek Behún (2):
>   doc: platform: cznic: turris-omnia-mcu: Fix sphinx-build warning
>   doc: platform: cznic: turris-omnia-mcu: Use double backticks for
>     attribute value
> 
> [...]

Here is the summary with links:
  - [1/2] doc: platform: cznic: turris-omnia-mcu: Fix sphinx-build warning
    https://git.kernel.org/soc/soc/c/d76fd4a9bc03
  - [2/2] doc: platform: cznic: turris-omnia-mcu: Use double backticks for attribute value
    https://git.kernel.org/soc/soc/c/888c67765db6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


