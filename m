Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1674C28935C
	for <soc@lists.linux.dev>; Thu,  3 Jul 2025 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558395; cv=none; b=MAcagU9NmcK9nIhe8JbX+T7UhmxrGFWbqMuFqo9tfYjSZD8Y1t1HRA3w8ynVmTz7z48k/AnaspqFcSmg1jNdxnTB5Ru7TvEXa586S4f0G1uTX9oYPRIxR4MRR3vvRRMTu+yFqnpMPSSCPvaVO+DPxN6ue/Xcbu4mA87Et0in35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558395; c=relaxed/simple;
	bh=vWNBtYeogqn4MCPsZJsjyiyrklQvMtKeK/eK+b88vKw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=u81hhFBYzk3030HJMkBxOoNMV+AAKNWuoCz0QjYIoSHXfXRLGQyXu47WG0JKBTr5j6WJeYZcz6U3JSe9VC3fTykC99bVEKy7+4kXHGeNQURyZNlR2M4DE1bkIio9DQDNMZI8TENt5Bgv/6ehXqKFBXATWQMct5TWQjM0UiIzrtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSFncPEv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSFncPEv"
Received: by smtp.kernel.org (Postfix)
	id 0D08EC4CEF1; Thu,  3 Jul 2025 15:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7C8C4CEED;
	Thu,  3 Jul 2025 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558395;
	bh=vWNBtYeogqn4MCPsZJsjyiyrklQvMtKeK/eK+b88vKw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TSFncPEvVnw1nZL43M4AOGfTo8SvgJFQWoEgbVAO+p6ILGvY0wWS9ojtKVOD/fNQL
	 +iGUpEuXbVau45LFu/TAYR1fy4kYHZ0P1rnXknhVgVMEqyVE3FfOxNQMxIb35rgm7W
	 UeALBKfCGLbtgSldeO5UgGXwkYpnKAqZM0O33o+r1/z1cJZatsz/EsTOEsA+b2xMyK
	 DnTixVHaFLDbSk5Xb9siJu8XaMPPPZg+we/qIub7avk/NGWtAEN6V/e3T3nrIefB/S
	 kd8wVCWag9/uwfz/kFRkrV66/3ODAxxLVrwxSHgorxt3HpwSal4qq7ju91OmzLVaJh
	 H5KBOWDwZ8Agw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D80383B274;
	Thu,  3 Jul 2025 16:00:20 +0000 (UTC)
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
 <175155841924.1537604.732477397924403033.git-patchwork-notify@kernel.org>
Date: Thu, 03 Jul 2025 16:00:19 +0000
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
    (no matching commit)
  - [GIT,PULL,2/5] Broadcom devicetree changes for 6.17
    (no matching commit)
  - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.17
    https://git.kernel.org/soc/soc/c/7eb5b8d0b2df
  - [GIT,PULL,4/5] Broadcom drivers changes for 6.17
    (no matching commit)
  - [GIT,PULL,5/5] Broadcom maintainers changes for 6.17
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


