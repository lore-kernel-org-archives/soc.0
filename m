Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A11E7F130
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 590ECC4163C; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FC5DC43142;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=nejM8SSZzxuTjY/lUYuxui4YGcPbG8Pq1Hqh11wi1Eo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aGjejd78oO9xdQM1h9N/fknkt2PkTedl+pyrWjeW/Y0i7fcICSI5yBVI6LhCHKbLF
	 OvYVlTX7N7FS6xYP4HFi+meQstkgqK78jsv6JNJp6UFmrpVWZi+CHzYV3/ilE2SC9h
	 WeX2yJXna21VsWVYDYJnitfEOE8bj8d+85J9W4uaRt60BL9zuLeWTLCp5b9rReQTQ0
	 RhpfNnFRyGiFzte3ywRI9dthTO2jmzWaUWcI+OjPxenlWE13EuOt59o1VV2iizSMSp
	 RXAlY4eJwxB/3AG3RuOxMDVXK219Pd5QeNETpH3UwYZYJaOXnhV9DrxI65vGzwWk2H
	 ueugR2sdVQSAg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D3E9C64459;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.6-rc3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223318.24546.16159264948955471842.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:53 +0000
References: <20230916-previous-oversold-9d30891ac6cf@spud>
In-Reply-To: <20230916-previous-oversold-9d30891ac6cf@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 16 Sep 2023 12:40:10 +0100 you wrote:
> Hey Arnd,
> 
> Please pull some fixes for the Starfive devicetrees, been sitting around
> since before the mw (but after my last PR), so figured I'd get them out
> sooner rather than later.
> 
> Thanks!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetree fixes for v6.6-rc3
    https://git.kernel.org/soc/soc/c/aab8130550da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


