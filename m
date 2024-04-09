Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B16CD129C
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D13F9C43601; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3175C43399;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712677239;
	bh=uEny2yZE9xSXz3HuYkA+KLjul5/P/TfX/lT01J6OEp4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZHqXxNd3Td1hwyHlfPugJvCmqXVQJU87ijFkRDKhJqUW67cPdBQuAxPZq2TzJhKta
	 uYHtj8Y/Vv56VhJuQ7/FlmQNBgY6RPmQeBn0iq+6pNuWqPStM2a5It/jWf5/HX0JDe
	 fl93piP3k1C9KDQjRHCW1zGZsBnmut5YBAI96hEBe5i7fmvvEA2+Q30MpN+NoHbCMV
	 9i+15b+ijKFT+BXT28jrL/asGM2Qoir8ELcmnHH3Fft3O57/ZQDearBmxKGCeEwe2c
	 pHBk8YXREq11vkKJ9iha6NTlakEjJK3BoIBJMDsQpyhXrbX2MuTxbHuc1EaQ41E25c
	 Pu4mzJrtYi4pA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A59EED60311;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267723967.12038.13591145842090648720.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:40:39 +0000
References: <20240404140306.450330-1-sudeep.holla@arm.com>
In-Reply-To: <20240404140306.450330-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Apr 2024 15:03:05 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.9
    https://git.kernel.org/soc/soc/c/64c80c99ed4a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


