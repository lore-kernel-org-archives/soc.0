Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A7BC47DA6
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9CDFC4AF6D; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0445C4AF69;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=nAcPSGSC+QUVYcMxpc+8l6Oe2wJIdVnimU9cCrgrQgs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=d+w2vPrLlaqORnh1AJBqegtNDb+6tcQF/Gq4K+f8W3rDqGn58xAQU3Vd93sa8TpgF
	 cliiOiBUzhOk8GjrcJv+bmJdZ65N1liwb7F7O9v3yfwoBNbeQCVk6zs0V6THwTM+00
	 4dlVqY65mmEcIwsmcn1PD5Rvw/VrG4GEvn78cyGZRUfsNOvUm8/9uZCp23mkbEGSo8
	 nTUesrYSj9e4bZyNIHFdWTpAjNNDQjAU7CoVK+vI0nwXCYNvLlT1WukALeF5xpfyyz
	 NXxlUjq9wR6rutC8i62ySy4RuIW21ak8owbv0yBbAqCqMyuiCSzPwPMr4K7FIr5JAY
	 kkEa+yUbWTamQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E11BDD4EE5;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646764.10550.10878561646610644788.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231213115953.3578115-1-sudeep.holla@arm.com>
In-Reply-To: <20231213115953.3578115-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Dec 2023 11:59:52 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.8
    https://git.kernel.org/soc/soc/c/740f4bd6e4fe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


