Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2603EAE7
	for <soc@lists.linux.dev>; Thu, 29 Jan 2026 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680265; cv=none; b=Ckz1Rkab+LqdO08GzK3t1LDT4t8PlQx2lQ9c8ID6fmmosS5Fx065pabtFWofCnzb5Apj7qRtr8tqlFGSy6YcXfLC8pkfWQizJoTEYuZfjvKf+bAa+HBD6Re95DRNM5gOqO9G1wk4Wdvbg4J2ZRE1+UbFvWGVYAqqz4vteQDNmhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680265; c=relaxed/simple;
	bh=N/l4FhZduOudw7bgn4O1W4xaacvmoVdv2NcH7hAt5e8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Suhp9ZTTPgcyfI+5+rznDQdqJyx43VwBJCmhLTMIIONsEqHHkVq/jXjAj/2Nb+Wan62p0O5WSq4ZBLjZmf4Do/wFhPEnxCzTn43nxNRHgqfEXosa8ixM1zCK3Z9ibf+NN6WbW7J0ZpR/x8+PHU+Pfw+2tSIuyctHcnr7C0SBh9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKVN+YDD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKVN+YDD"
Received: by smtp.kernel.org (Postfix)
	id 970EDC16AAE; Thu, 29 Jan 2026 09:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8161FC4CEF7;
	Thu, 29 Jan 2026 09:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769680265;
	bh=N/l4FhZduOudw7bgn4O1W4xaacvmoVdv2NcH7hAt5e8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AKVN+YDDAD0/cLM31edwoRVIM2KAoA2kiTdNbdFTHZvOiV2Zid8an0X2/wWczbaxw
	 OJLLo334ej8dNgR+H0tSReKt5KHCRUGlnjDQSXegXPi0xaxQduY3VNznzhP3EeZXjZ
	 tyrG/4Bb5Y7/XZwcXiH7+krsQklGOHeaMkk90vTQNv33BP2kOXRHTV8kB6vUcVUsuc
	 ulS1IFR7tlUAZEN7HLJ2BCNnbj1g3j6PbeqPMxb4Bca85JuK22QX6H05wkcHts2ILE
	 BVD9KH1BllGEZvmNs4fTYrLnX7d5/3ctKfbJaG0mRPSoaYW3HYSGEJYVJlNSCFrEQB
	 D/yVWm0DFU7ZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8DC5380AADF;
	Thu, 29 Jan 2026 09:50:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Change Sudeep Holla's email address
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176968025834.2433421.10183930217203785721.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 09:50:58 +0000
References: <20260125201545.3461463-1-sudeep.holla@kernel.org>
In-Reply-To: <20260125201545.3461463-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 25 Jan 2026 20:15:45 +0000 you wrote:
> Switch to my kernel.org email address going forward.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  .mailmap    |  3 ++-
>  MAINTAINERS | 22 +++++++++++-----------
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Change Sudeep Holla's email address
    https://git.kernel.org/soc/soc/c/59e82a4237cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


