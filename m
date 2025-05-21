Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15769442C
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863022; cv=none; b=jxRHEW0pPNGfaM5ysDg8jaC1f8TlxyhBKujCSQKQH67ymXE6VTqsmzyKJ4d5zKViRcJezQFuUe/qOLQKpzEZ47UuE+leoNoSUa/kZe6m3jVXXjpHRtPWayAdjWthiUS2bFSJ2gPTPqRO3DM87GrlC9oLG00T3adiJzNoZWzOs3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863022; c=relaxed/simple;
	bh=NTdU2sa0kIJz5m7qm9+6XEiOUg6lCi714l/CtBL1KeQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SI3T/Y+2za2tFkF43T7oMwubinfnMFbsGSx+BIFxE3VXhEVExD+zzsobE0l7pSgpljfWjqm9+gUq4KqZOT+w7+zN6KCAAPgbT95WIWrTb7DM5tXGURtZFSx8AVN8taWSMWPAnLWcMsbzf/p1YsbHukcE1xhtinVUA3fvVbvnrsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UACtpQg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UACtpQg9"
Received: by smtp.kernel.org (Postfix)
	id A20B9C4CEEB; Wed, 21 May 2025 21:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC23C4CEE4;
	Wed, 21 May 2025 21:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863021;
	bh=NTdU2sa0kIJz5m7qm9+6XEiOUg6lCi714l/CtBL1KeQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UACtpQg9UqGmr+cUQuZ00/WMX/P7AVGX4KwYV/eN/1aWj+rQ/xV8XXcQ9NLJT+XRa
	 kkRXY4Zz3LrTkRJG/TIvrt43C3MrP2Xh13QZF6VaI5Qfjm4cA5QFYowSfbCPN8PWYS
	 mKCbUz5a/CrGLKCWvSs7tLXfebUKektgTqyB/x6jHZVt2ofxJkIv6BVlvrCgtxJSQL
	 phj+OxsdFjHE6mvBC6h2avkZeUxnDeC5tPGd1m7KJYEMYgxoMXuWPPKGNe57EevbAY
	 LOqRMggcZOVHMW/pzA8n66qkXK8L3mw8e7Y/blALAEIXnspwGbE6jVso5G79Bv2a5S
	 Oh1s0C+jN6Ivg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D63380CEEF;
	Wed, 21 May 2025 21:30:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm driver updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786305698.2284637.11974781787770587002.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:56 +0000
References: <20250520024916.39712-1-andersson@kernel.org>
In-Reply-To: <20250520024916.39712-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 May 2025 21:49:15 -0500 you wrote:
> The following changes since commit 2c04e58e30ce858cc2be531298312c67c7d55fc3:
> 
>   soc: qcom: llcc-qcom: Add support for SM8750 (2025-05-12 22:26:21 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.16-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm driver updates for v6.16
    https://git.kernel.org/soc/soc/c/4d1c69e53ea7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


