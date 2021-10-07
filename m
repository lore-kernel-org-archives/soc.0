Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AA5C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9C33961251; Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 855BE6103C;
	Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633640419;
	bh=oY/PBdRQsG5NGNwZC6JGwPmiQVBFVFv4/jYAYIV8XFg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sGJN/DDz7ZVmlX13Qo+iO/EHv6NqZ35fU+ApCvxJAAdU1xfm0jDPsqwT0ezLtTeCI
	 70Q8seRJfyiTenmF3RpGhBCb52G8P+a3cE2ihWA8F83KuPj/GDXSRVCBpQcZk6vwAX
	 lRZS75hW1KVQeXGOW8ykwSBUd7JxfSmt9duXxtkjfssWPnpNnmWTJ3z01X+vHfvNDu
	 +/QXfHuxPfDrVgIEjXo0NVay6tqsgrszea3N9qlGv2OJM3hEbq1YsaNNpb0qnAK+4d
	 SS8WkhpTuPhCsjuUTmMMqrQG2wrm71hLOCIoA4JdLvyg38bGde0ahGiBfWpNiFun9q
	 3b8iaz0125n+w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7B57D60A39;
	Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163364041950.28878.880383482647443766.git-patchwork-notify@kernel.org>
Date: Thu, 07 Oct 2021 21:00:19 +0000
References: <20211007102822.27886-1-sudeep.holla@arm.com>
In-Reply-To: <20211007102822.27886-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Oct 2021 11:28:22 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v5.15
    https://git.kernel.org/soc/soc/c/6aaa84343895

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


