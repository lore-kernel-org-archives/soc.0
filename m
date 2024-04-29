Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39262C25B4F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15677C4AF48; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB2DDC4AF17;
	Mon, 29 Apr 2024 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=1IEm+HHWUX9eZ5VFkr2UGlKSUcJthv4VnuZhhmQZKow=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=YmbESPtVNHmRURtqNns738lGJKBtqXVm7rr96gAP87LQCcL948zjdHXSoygKFpb0O
	 AEMYaFBJ7OEHU0qDXt21Zh/u4ZIqNBmuL70I3MIc6C6wM9YeAWZIqnnotz1f6t6/aW
	 lezKunsnHvcRmcRRKDTguqI/EF7gmC28q3ZuemZeOBEXMtFylx7vS0g8h8EqyBLVQ1
	 BI/SWA0PHS8JZrVTKXeMYwHAm45bCOEQkcy5EWWTlNkAyqBUIqc++wbymtBtRkJpa1
	 nDj/3svB+zpxkdYVDzOhKlX+nqRZGa3iYZYv8ZNxdMfq9iBZ5kZsWyJL8p4mjxzSRf
	 uYSZ704TrjoVA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DA0C3C54BAD;
	Mon, 29 Apr 2024 21:00:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 Bus firewall for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444688.17402.489374273539696029.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:46 +0000
References: <7dc64226-5429-4ab7-a8c8-6053b12e3cf5@foss.st.com>
In-Reply-To: <7dc64226-5429-4ab7-a8c8-6053b12e3cf5@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 14:59:16 +0200 you wrote:
> Hi Arnd,
> 
> Please consider the first round of STM32 firewall bus patch-set. DT part
> for all MPU SoC will come with teh STM32 DT pull request.
> 
> Note that conflict merge have been seen on linux-next for this patch:
> "of: property: fw_devlink: Add support for "access-controller"
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 Bus firewall for v6.10
    https://git.kernel.org/soc/soc/c/46671fd3e311

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


