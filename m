Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230023D283
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863020; cv=none; b=Q6DDEIagv99sKxW5WNE6rynpDRbXXBgv/cUtwRGQJFXTU6tzarPWol6+dUZKNdighFz1siSp63lF9pO+54UNPB87WZndQjgiUPWupbtZjLp0QcFpmdAWfdKWVwHhcXMsCqUmISyhfkdzkPQ2nmihuAs5mS0+uY+cmJh2d9u7HX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863020; c=relaxed/simple;
	bh=y0JXjWW1t+saEoE8p2Sro+XLkLGdUDGJUbgMoejKR28=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JrcmpiQ/aS4UdcK3fpRE3sFsx0HTTj2hChb+lAbdpwFfasuHtgdjzsnm23H2TMmWSapdJL4cK64RmznskZ5drJvYyi5WkXaxpAU6EZMA4Szi+4G0an01JzfsrpiaUHtg2x2ny1S17vz4ICSEpsPY2Gin5x3igWZ7qZuO6v4oiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeMsTzLb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeMsTzLb"
Received: by smtp.kernel.org (Postfix)
	id 27FF8C4CEEA; Wed, 21 May 2025 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128BBC4CEE4;
	Wed, 21 May 2025 21:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863020;
	bh=y0JXjWW1t+saEoE8p2Sro+XLkLGdUDGJUbgMoejKR28=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VeMsTzLbsFVEmbWyXp28liJ6V9Rg+AapxsVRV9rZBTWEX8VbWlry7jNvRtW4oLPGa
	 gkvuv38ZDFAOGgolNdq6za7aHsI7UTUVkRFg62exJQOjYAsdGhSuDEt9vTC1ELFIEj
	 TyiRHrmODJiZFCQMyNPRi5nLCLJrkdizNglWk5poKYkQKbnMgIH80KO9mPVckKG4pr
	 oDgw/mj7ERVaS6SPPPe5gEBY5IUNbhwMj3XaQOnW/98sVlgrNnnHSlm9+IUFXRVdgN
	 l4FyyNnGHEZ9zKgnNp/JBdb4XSzS6qmVf5hyvzJ6r/sikmMvouqjtJrHKHReBMXhV5
	 h2Hj6s3svadPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFE9380CEEF;
	Wed, 21 May 2025 21:30:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786305549.2284637.6965125786901145271.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:55 +0000
References: <20250513215656.44448-1-andersson@kernel.org>
In-Reply-To: <20250513215656.44448-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 22:56:53 +0100 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.16
    https://git.kernel.org/soc/soc/c/3fc5aea250af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


