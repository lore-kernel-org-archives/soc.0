Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD920899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422314; cv=none; b=HZGrEnlDdaa8xhIVz/Cqq5MsUCaJTt+nCxGkJpB7xPziIzy8mDVMorsfVSRT+3s3od1Su6TTdY3hpfKikPNk76QrWusmmcua5g2lEdwOsg5E7pIj1xZOleKDRJe79fA+ubBdoR2x6wtDhGyguLF/TysHzo5LVW/Ny8NptgPMn6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422314; c=relaxed/simple;
	bh=WsscIDIx8ipOadxBiRS+/+e2GYv1Y7yNOvCWtGtrXTI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KTBHIUQP97Mx7PJgM60uataLYz1bzhB/uSV//QSY12LWhdaT8ALcOvzjjf+DgfsC9L9GtlTLU5C97M60uD+dRpOw8LmQHi1efRJIo8qYlJT8Dpx/UC/4vKBBzUmyZkDya5lTBcA1i19U5P4R7areVEkzU3bAakGCq89BiHBuZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8LebXzJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8LebXzJ"
Received: by smtp.kernel.org (Postfix)
	id C82EDC4AF09; Wed, 19 Mar 2025 22:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30D0C4CEE4;
	Wed, 19 Mar 2025 22:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422314;
	bh=WsscIDIx8ipOadxBiRS+/+e2GYv1Y7yNOvCWtGtrXTI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t8LebXzJw2J6h1Pi5/xtbIsIg/r6SaZVWgdkFpk7ZyhRs6ucFOaeR1hT1A3oahSq8
	 goP1FTv1+N1o2VLT2DQD5fCv1VM+cC4vgCf9X7nkO71vsIstBuZPgVL9mV2pUV/CbJ
	 gZqVq6BwvOBHBVwQmbobxjLd3QEguodC64PfSLoBKLz+BzrNNv9wl4WmSUJIcIPZy+
	 N8AmzqRdOORyZhGownNkaJJ/mngSgq0oCJyjmQZtOXZAiymQGR/Nj4olRS+dM7F5lh
	 h414Dvof02SuWCcUC5TBA6rhuF+YnfTZ0ScgpPoIKOaMggvw9XgFHD+D/SmQesEYeO
	 RqXIVY3voLq/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE2E3806654;
	Wed, 19 Mar 2025 22:12:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242235027.1211847.9566379440037061449.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:30 +0000
References: <20250314164406.744117-1-p.zabel@pengutronix.de>
In-Reply-To: <20250314164406.744117-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Mar 2025 17:44:06 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.15
    https://git.kernel.org/soc/soc/c/29759d272982

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


