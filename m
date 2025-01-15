Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B315688C
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961195; cv=none; b=BLt/UMRj2NDmQcSo/Vx3/78CZVeGlVn1FdC7EI2KbJsY3dHRv6aSeelnlKKn4846IaodD2QNYp+EbpjwsSde5KoShtHMA42ZnTL31Klb6UP3uQjJWYt1LvJzAe+7l+YgAQDp58LkAKgKpgsa9TcEvuZ6dnoeQp7PDB9YQj6tnLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961195; c=relaxed/simple;
	bh=pPMbJvQm5ZhLJ4l5FBsi4Q4Jhvq5QN5OpeB1YYhbtYY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HAY5cDcUtJDMLwP+plNMcKeRZXtevOeR8FyFApOSVAUx9UTHm5WAaEQB4qAq/R+rsh+229cWaw670efuDAzP98UX7esJixZ93xY5YiqyJu24uNMhcLM/EOsktvHn2GMHHlDICKdPSA8q52gh8kQXfVegud4yq578XtdXCYFfIG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/r4qbnS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/r4qbnS"
Received: by smtp.kernel.org (Postfix)
	id A509FC4CEE0; Wed, 15 Jan 2025 17:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECBEC4CED1;
	Wed, 15 Jan 2025 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961193;
	bh=pPMbJvQm5ZhLJ4l5FBsi4Q4Jhvq5QN5OpeB1YYhbtYY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=I/r4qbnS1eC3tkBZl/pr6KO2oajJ6hmvABvTlAVtcy8S9NCmzyIgh/rbxRE0TYTuo
	 mSClzdbj3KR/3mCe/F24bO+KO5dUDzh5hOpDSOhbPHvZyJmtKFaCj5r8QX7Rfmhppp
	 QMFrIwoC9m+5Y1AEjcKQIZ1TFk1qrlm/gk1nmb6EDqN7c4oyu2Coq0FDc3r+pVaPZp
	 MhPGGqY7TOlYcyfr7m7csGc5T+k1uGFJ57CNJU6WGspo9GONY0R308MTKcRZIZlGJA
	 2SQS0lowkYSg1Rh7VAKmac/AqZkUnKfX4MBGFhG0YuWvzYCUMwiXwQyal9zzKcha1Q
	 Jah7PU6O6zBWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0FA380AA5F;
	Wed, 15 Jan 2025 17:13:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] soc: ti: Driver updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696121624.809051.748244415030628368.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:36 +0000
References: <20250110210753.exsx5yxmxpcdn64y@amicably>
In-Reply-To: <20250110210753.exsx5yxmxpcdn64y@amicably>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Jan 2025 15:07:53 -0600 you wrote:
> Hi SoC maintainers,
> 
> Please pull
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] soc: ti: Driver updates for v6.14
    https://git.kernel.org/soc/soc/c/352bba6c19cd
  - [GIT,PULL,2/4] arm64: defconfig: Driver updates for TI K3 platforms for v6.14
    https://git.kernel.org/soc/soc/c/5eb5d4c6d4a3
  - [GIT,PULL,3/4] arm64: dts: ti: K3 devicetree updates for v6.14
    (no matching commit)
  - [GIT,PULL,4/4] MAINTAINERS: TI updates for v6.14
    https://git.kernel.org/soc/soc/c/5bdaf99424db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


