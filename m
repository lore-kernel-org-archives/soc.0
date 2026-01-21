Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D072765E2
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011233; cv=none; b=Ur3w3I6Gk10WCBsZrs6nwtbPGpdWb5uTWRoHwH8jyREkta9MkIwWehRgovFFQuQhdWmBhOp2KYQ5JITLfeq9ZLNTwGFpTpLENaJQ2/wCzgLgi0iloBAZUqe5LymPTyUMiHpDsNC9LtcWxWzFZxiM1gR1nF7KJNW8hOsfX3aH2sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011233; c=relaxed/simple;
	bh=Vcj9OcU4vd2YmMDzwIZW/zMq4kEcuT64aXYNX/+ouIQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uZlDguuBqojIQlpaQlwQgNP15wT/ljtSUJYYWH/8vX+TkrdgM+TzTUSxOH3z1/QYnXTMYizFkkHGhBgtXmv01g3S+LsH0jbavsMzYoG/TNmpVuWxX8E7I/Wrax2xx5xIxuuhAipLyd7ueByUsdI1evuaH2CVtmr4fHFNLiaqaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ie7ltsBP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ie7ltsBP"
Received: by smtp.kernel.org (Postfix)
	id 54A5AC116D0; Wed, 21 Jan 2026 16:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7A4C4CEF1;
	Wed, 21 Jan 2026 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011231;
	bh=Vcj9OcU4vd2YmMDzwIZW/zMq4kEcuT64aXYNX/+ouIQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ie7ltsBPKoKNsLmwSQzaXPsyYxy49iPW1+/FNtjMVVuyeTe9QuPjnBUMYDBaE6odi
	 26sM/ohCfkqwMEXfCnntefLI/HPclIYbYLWlsltby1jb4dgt44vhCyYxHz/GAfeTf5
	 KbrV0Eb+VdD0sQF0urSFwJ8tHZNmPVn/pMDbtvazxnMBaX53nAlgdDCL6uV2fnD0Ot
	 08DZyssSr1qCTtieUMptiU2KEARp4cbFBQBjSmOkl+B7vClZ85aFUe21gJO80yVit+
	 7bu4aq9r3Q/RNDBamfdVDTuge5iu49iKeXO1N/OwnH5duJiKJwhgE5Q9VuoescYCT2
	 6Z5LKccw7uxJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BB433808200;
	Wed, 21 Jan 2026 16:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX drivers changes for 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901122809.951664.12786199366366717951.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:28 +0000
References: <20260120011221.4387-1-shawnguo2@yeah.net>
In-Reply-To: <20260120011221.4387-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 20 Jan 2026 09:12:14 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX drivers changes for 6.20
    https://git.kernel.org/soc/soc/c/6d9e4c74372b
  - [GIT,PULL,2/5] i.MX dt-bindgings changes for 6.20
    (no matching commit)
  - [GIT,PULL,3/5] i.MX ARM device tree changes for 6.20
    (no matching commit)
  - [GIT,PULL,4/5] i.MX arm64 device tree changes for 6.20
    (no matching commit)
  - [GIT,PULL,5/5] i.MX defconfig changes for 6.20
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


