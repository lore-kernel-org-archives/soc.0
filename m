Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBC5C4332F
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 738BDC36AF9; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DDF8C36AF4;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679214;
	bh=qozlZJMe9UHym/lPPgKcnMIq6Ps1YRUg3sqTyduupCg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IWSGIpUc61vCRwaDh+oz43y3RQDWJLxiksnmG67F7oHYbfpbSdwyfggFRE1FdTX5I
	 0KVW7b0sycCGvxQKTkNIeycD2ZmteEPUWLLia/rpCDdAC8TAClfAH8W6KWBx8quvhR
	 10DiSZvDNop7AVX7n7q5W8uLfyNFD+50aWWCDxwEK833qkkif9PlTPph7SDodBhKNa
	 YT3fQb6ZIh6ezFMUij1NFbPtaNxGyaFHlgZnkKm6lhGQxhMyaRAtycCEzh6qMfXwep
	 cQECRPKaGjSwd19aBS5kWBbe9i3TsWYlyvoLjWyIWRBkHH9e+oUXyLOD6Yd6+KETQr
	 AkabRF5v2MBwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42384F79403;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921426.24856.11998749017901817157.git-patchwork-notify@kernel.org>
Date: Sat, 08 Jan 2022 22:00:14 +0000
References: <20211222141342.56395-1-sudeep.holla@arm.com>
In-Reply-To: <20211222141342.56395-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Wed, 22 Dec 2021 14:13:42 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v5.17
    https://git.kernel.org/soc/soc/c/deccdc186789

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


