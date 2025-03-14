Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9550420469A
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973405; cv=none; b=ej+oiJGu/v79Stje9TA0c4+hzfqkTXqIbWvq9X/8CZhlQGdweFn2z+hmLu1kLQYZ2WpWwoPCGN1YGn4jv4WA5QcdcDdBylp71vCq05WrYcwwvgKDYz178kGMvMp++S4P6zyzOB54/xUajqsZOFz9fIhq8drKCt+0jcxN4FFRT8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973405; c=relaxed/simple;
	bh=A28YBY+bnLSxnpdw4oT/SyS4yqJqPpLtO5uhVL2I+YM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iuD3+T2yrRDakCHyNBSFgwoW8GOxYxHCY6k4iZeVbNOM+M1oTymsnaLyRRfEr2wcfqaOfZLVVo4gsnpvE8yWeTw4qVIsow1dWYboinhI02FJEKFBWP873SsiALynqs1AWlRap8ajaHHlfGq0qiEIBVLLq/DMENkVuudKPVpNd+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzh9E/d6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzh9E/d6"
Received: by smtp.kernel.org (Postfix)
	id 8D373C4CEE9; Fri, 14 Mar 2025 17:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7747EC4CEE3;
	Fri, 14 Mar 2025 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741973405;
	bh=A28YBY+bnLSxnpdw4oT/SyS4yqJqPpLtO5uhVL2I+YM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bzh9E/d6kV2Vqo1Ab0PxqbFZnUxti5NMztfgkRiTcX9QYAnd0VIz/GJsY7PNqGhln
	 PqPF3Qx+7RpoTiz3w5a+myZ99SXqTEvHbGojtyRgoVBJHYLAAywspFE8Kja1o1kXZx
	 5N5rwJ9J0TMjN/QA/F5eqDTc7jvnx+scg8xyM7D/hfqcBVeVobkQhvYYyLb7brNYeA
	 90GWYURgK3/r540RzDbNKIU+RC++j1fZPvuz1elpDqUs4h0L0GKRXLrvOdJ2AnNQJr
	 vDR3IjyWLF065xkUc9i8X0pzNUElGGyp4sbGspykMgTaXyrbdZ6/A/E1ksC3vA2wjA
	 a9o7QiV8/wBSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D5E380CEE2;
	Fri, 14 Mar 2025 17:30:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Broadcom devicetree fixes for 6.14 part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174197344024.2324103.16862700343772619229.git-patchwork-notify@kernel.org>
Date: Fri, 14 Mar 2025 17:30:40 +0000
References: <20250308150528.1900822-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250308150528.1900822-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  8 Mar 2025 07:05:28 -0800 you wrote:
> The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:
> 
>   Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree-fixes-part2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Broadcom devicetree fixes for 6.14 part 2
    https://git.kernel.org/soc/soc/c/0bf88b1646d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


