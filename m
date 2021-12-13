Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F5C43219
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BAE7C3460A; Mon, 13 Dec 2021 14:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E961DC34601;
	Mon, 13 Dec 2021 14:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639405228;
	bh=u5ttmCuhW2Fwb7xFXo5iUHHkGgbB9/wTu5KcGViVcDQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h2yq7jB41oevHKOg73kuP/Sv9LhDl27b/twyMfXF5bkJ9YMr83Q5A4XYcwQJifHfl
	 w9TmRrinF5NxlIyGvEkSZeeTi0ht68ZvkVuq15mV75rQYwqK1cD9bfF2pPj1cypnWf
	 fVOBRFor27o/3wdMbQ6AZvXo5tWxA/z+W1e43vPvjllCNKKe3WfPWC0o1+VXYqkfwR
	 cDr7fjqvT/q2ZwaC3AUohrJjHlQjODT54eXFGRp71Bx2qjvMYkL4xfTrBGFHixWvIe
	 joonGemU8wvLf3yHSzevgR95z1GbnWo9JVhJgTxrUdOIrevbieH6UEY8MBzQpMCCPG
	 CyYdEjdI9m9YQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D110F609F5;
	Mon, 13 Dec 2021 14:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMD-TEE fix for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163940522885.6863.17864390578983359417.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 14:20:28 +0000
References: <20211130070351.GA2308099@jade>
In-Reply-To: <20211130070351.GA2308099@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 30 Nov 2021 08:03:51 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this AMDTEE driver fix which takes care of a bug where
> IS_ERR() was used instead of a NULL check for the return value from
> __get_free_pages().
> 
> Note that this isn't a usual Arm driver update. This targets AMD instead,
> but is part of the TEE subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMD-TEE fix for v5.16
    https://git.kernel.org/soc/soc/c/df0a9b525cb3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


