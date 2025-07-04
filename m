Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C662ECD11
	for <soc@lists.linux.dev>; Fri,  4 Jul 2025 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620184; cv=none; b=itmk/Ggp/IKKUCvHGFO94V+DwxJcJG37Rr4QGA7p5n4c1jU3REKTCz+WrdIGRBR+MQf6sbRgyxFW74IrnQkCUcbOQ9eCp4ABzT52Dc9kiTVRhydHXdF0qukRQS3OliOSTwooHUkCuM62RzbdhWyGyuLn2WeRSGk7PKAiE16u0VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620184; c=relaxed/simple;
	bh=STzLv30+LuqWrZ0fBrz0isWbYRAIYvJAsazHMzE0d8M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=moVl5ziaN7gq9vNSGUK41TaGw4SfpfSh9NgkSyTrhrwPpNrJxDN2xrB4pMMtkSObNskbPlgjO+Y9D/9J6yBfYZ4u8VIWQtidPz4lTfoZaKwPuvv817Nci8/68HKthO7FmdibxB10/qqvdUqcBf6htHfJb72oxqdbjrNw3EXCScE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6Wj9tTc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6Wj9tTc"
Received: by smtp.kernel.org (Postfix)
	id 86A73C4CEED; Fri,  4 Jul 2025 09:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C94DC4CEE3;
	Fri,  4 Jul 2025 09:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751620183;
	bh=STzLv30+LuqWrZ0fBrz0isWbYRAIYvJAsazHMzE0d8M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n6Wj9tTceT+uiti5KPGHaagyDOUQT0ALvv1usVMkhrmtx8hJXVi3elhusNWoBfZyR
	 IB/edMbgOrk7i5fQ4UD/gLCCym7wzKiOYvxsBOA5UVIZQKRdqL0/J31c5gQ4I3YAaf
	 t150ZnvTLY/uOqFZrG3LzngccdYGoPBaJqcJ1td0sy3tLWm1RHASVYg/9z5q900LL+
	 NkSiyiqtpZHwhaQqJaQo8qg0Ogh46ZNdTtvOzMgCOiPzCLULMa1R/OV+n5qGkxvC43
	 vtMQoWWewICvtZfSbYAtc2AMyoXGbm1BsjOVmaUsWS341iC30GmQ3gA8I737jnLg9t
	 rPoXaqxthyP1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC77383BA01;
	Fri,  4 Jul 2025 09:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175162020751.1782818.1640014464017504198.git-patchwork-notify@kernel.org>
Date: Fri, 04 Jul 2025 09:10:07 +0000
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Jun 2025 12:02:12 -0700 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/defconfig-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
    https://git.kernel.org/soc/soc/c/241a3be47756
  - [GIT,PULL,2/5] Broadcom devicetree changes for 6.17
    (no matching commit)
  - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.17
    (no matching commit)
  - [GIT,PULL,4/5] Broadcom drivers changes for 6.17
    (no matching commit)
  - [GIT,PULL,5/5] Broadcom maintainers changes for 6.17
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


