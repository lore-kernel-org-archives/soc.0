Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BF6265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662475; cv=none; b=ezqzcp23LWSshl0JE3gJN2dLqJeMMx8HotT653TCkCbjKejQe7HxKIegbmTy9nyKz/MzTG9lDejy7q+Z4xn6gECC0aeCULG6Bfm8tE6Y7MSq5lpGtEnLXPH8o27kMOoFdaMd7Vuv9J/84iJSOGmBczV3dUpnn93fmefSpWoJ3wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662475; c=relaxed/simple;
	bh=Hg4kDiauohDyOIS44l8N0SOwsuaGekyBXsVuJDM66m8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=o/ARjXOXvcF4/BR3AkfK3M1RpWv+Ke9R/nuV3QJykTSTmPLfY67I2BPW+JCo1LVcUcH+XMYSHoFZVK5R7t27vD7Eixzn14F0HH/K4uVyonmbLOsHI3u3XXR+SFcSN7jhgXZImcVKMpplyCAADlnReoFWtMuJ8xRhDzqUnZhPGpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0SwyW37; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0SwyW37"
Received: by smtp.kernel.org (Postfix)
	id 8CBB6C4CEF7; Tue, 23 Sep 2025 21:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77244C4CEF5;
	Tue, 23 Sep 2025 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662475;
	bh=Hg4kDiauohDyOIS44l8N0SOwsuaGekyBXsVuJDM66m8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K0SwyW373kpzZ7RmzaC4M87vTAKhouWW4AoR3fJoj6EeSLL4cxX3ZbTVO8WHDFQ2X
	 lANfSUc33SfbymsZR/r2f6qqVYg+DOdHC39Sn/snPjb9z5AO0O6mjCKsHGPmZH1lmZ
	 ph0f27hKBZ2iI1McSfj78Ra0T4BgJNZlXFSNUhBz5BaH8NxeZd6aaJoevWLjMnNKpH
	 z+lFV7GEtanuLoEs3Wc9NAjP04nWNnEwTCjOxp+H0/CpYx8k9sBBEYWJXoG5Db0ssa
	 B5u9GXCp699lZDvHIxg6mpMxmL+8OWinyyFwYMHrx1qAtAnTzcXYAqjv1J/hcCxNIX
	 unQuJLz9PtqZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFB139D0C20;
	Tue, 23 Sep 2025 21:21:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866247223.1926563.12644120845394378814.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:12 +0000
References: <20250921020612.596098-1-andersson@kernel.org>
In-Reply-To: <20250921020612.596098-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 20 Sep 2025 21:06:11 -0500 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.18
    https://git.kernel.org/soc/soc/c/2136c694a045

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


