Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3472D130B
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756546; cv=none; b=vBu+z+pzb9+BEpxt1aK3q0gVGyiEcjqRJr8UMcZnSsX7Fpq9Y+CG/7Zc2Q5oshhyfM5f0D+EmvxiS8XiLqDks0E7houd/pyJE4+rveTI8LVKuNN4DQSFuPAavszAi9AQ6mXXkirl+kuh/WwzYmpF8qth1RZgkey3lMskkR3Gkbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756546; c=relaxed/simple;
	bh=X62byRnOytp2JbGxgsxBP+pB7JLIkkEoSKoNrWQWcu4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iwrP/Bv2FO2sTFyGBFd9CCFaPk9GSag2NxST42afKEd6ppJhrWj4c3mdBN6aSv5uirYGmdnSHDphWze22swUOtBUjSLNDgFkXDSjdZNBJWS6oFwqj21ym8oA/7+qmlf934Yt5GOqrxC883EHrXnLO2wEKztQFejLImeTvXuidts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GadKcoW0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GadKcoW0"
Received: by smtp.kernel.org (Postfix)
	id 02CD5C116C6; Fri, 21 Nov 2025 20:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1452C4CEF1;
	Fri, 21 Nov 2025 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756545;
	bh=X62byRnOytp2JbGxgsxBP+pB7JLIkkEoSKoNrWQWcu4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GadKcoW0Wrny2RSp3DUAC0wdXZG4VQY5GmtDJf5lcN2mBQrCysdNiI+DU7j0wZiHZ
	 nearQhlW0ba0CovBRafvh6FZtDInlWGlqFBqhAWhYfJHL6U9EqrLihQtXmIshiOHKo
	 AbzsZ6vt2Z3TKx0Lq9kPpb75H0q2hDYilEiceRn6tbpfo6kpJ4vkBTbX0dMFvME7QD
	 jmGHohn2AT4Iyn7UHPY8jzmyTkjSlb3uWWouh5FcFv9SeX2xhOHLQBQBCJrH81gIf5
	 RCJx8nnp6YOltn9ewC3EhcuZcPif3XerzKoR0ew8uDwIwu1xABYORIQQtcUhEcRjnG
	 YGZhW8+Qmgp3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC323A78A68;
	Fri, 21 Nov 2025 20:21:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375651024.2571237.1581859869695934884.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:50 +0000
References: <20251117223345.3192497-1-andersson@kernel.org>
In-Reply-To: <20251117223345.3192497-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 16:33:37 -0600 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.19
    https://git.kernel.org/soc/soc/c/c1ce3348ae08

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


