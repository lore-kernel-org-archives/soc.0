Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405372AD37
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281598; cv=none; b=C1fZLq6pg22SUITH50uQf/FeK+TUmMHFycwLw/gipmbUXOORdfsevM164Mx33pOkmy+zbsRjHoCjabHXn3j59mmL0wiYpHzgj5+j0h3S7JV+bHq+POpaW4Z5p/hrUisWDMpRrQUSQ3TTjPmbNxK/pQXbuFozB4TbNOZwo04riLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281598; c=relaxed/simple;
	bh=9E3int88JIwalhpA334CbvG1hxmu2uzCh1qYaQ+ICtI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uLqfTMqVHPcWsLATDvro1Cq3Udlm5lwBV8pD0iRlghVLqBsdadBCKMVdDJ2oXKHWesL1ErwRIXXJ4XYr4+6HOIb5brI0x+M4gcab2Orqp6IUcn95LX+fqDMh/hILdfvqjQgEkmPfMugTVXA5PTcDEp7aCmm2h+owvIr4OvcuzoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjfQKHPe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjfQKHPe"
Received: by smtp.kernel.org (Postfix)
	id 32784C4CEFB; Thu, 27 Nov 2025 22:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF76C4CEF8;
	Thu, 27 Nov 2025 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281598;
	bh=9E3int88JIwalhpA334CbvG1hxmu2uzCh1qYaQ+ICtI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PjfQKHPeH1cc2hPoHRbVmLGSKVM/VFRjuIJMP9SmzPdgeZgmecYV+ksUwG5fUTNXn
	 gUDW5iPmsaH456j+3cLXVM+pR3Bxpg55NIyxVaY0cyyQ8QQGHHojXejzUaavV1QK5m
	 7kuS8Kw1r7cjaZt6s2hP/qqL1hLaADTo84OvWJ+rQ7VgXkzLTy7jnX/BERwIisDp1Y
	 4QZc2t0gmYzYUVVbjtIK9AJqiNxtP34CxNC3kiEWcval7G02/OBsJPSrHCnaEgEro+
	 Li1OtZUHa1DlDdqoCz77ByK8cWoX8kKOp+WAlcS+vDmRSA9WmqzsjG1IZE5mGukGOd
	 r9NNAIpR2RLWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B57D43808204;
	Thu, 27 Nov 2025 22:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc-drivers for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428142052.55019.5489303065675535374.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:20 +0000
References: <20251127-wish-shining-300e8fb80599@spud>
In-Reply-To: <20251127-wish-shining-300e8fb80599@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Nov 2025 16:07:07 +0000 you wrote:
> Hey folks,
> 
> Please pull my 6.19 soc driver changes.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc-drivers for v6.19
    https://git.kernel.org/soc/soc/c/909752d392bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


