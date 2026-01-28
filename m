Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5DC36BCFD
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624431; cv=none; b=SBIMNSqVV1VPi10+g9KZKbHm3o2jgChiPoOAuN+T/lEZ+7WfC1rhPj66NxCNMU6PcakTOJ8qv1OCCx6btSZ8zjxq7DBRIu1hEchpw3OxyV235WsrVwHYUoh3K2uAyd+iVIXNiu7cFIxFns0LC3qlhIFfYGfu50Kux9vjDxsr958=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624431; c=relaxed/simple;
	bh=+QMbaA3iIyXXUD87EnZcUFy6wgQNb+7851y2e7LDdvM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=U91g4QERLD72vm5WGr2YIqXpOkhvz/We7hPNIGA4/pCz0iU/9NujdRcDuuApPDVJQqdzK1sj6ra1ikOX1bCo4XRL0yc4v2EGVoeV638MkCDq5rcYMguOxSytlsmgg4e/H+LpvAarT1lbMEbGIHukJLu6JzHFBVF2SjmvukrR/PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3sfek99; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3sfek99"
Received: by smtp.kernel.org (Postfix)
	id 4B9A4C116C6; Wed, 28 Jan 2026 18:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3601EC4CEF1;
	Wed, 28 Jan 2026 18:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769624431;
	bh=+QMbaA3iIyXXUD87EnZcUFy6wgQNb+7851y2e7LDdvM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T3sfek99u95T4tyU+BOfvOkj1xFQZgqKBUAaIwqWlzhVv+EiLHzUXmUU+Eyiw9lzr
	 fCE5DPNJT2YZd2DrMoFGSg4L5Au2jhtQxmxsWuJWVFGFvDkJigFwse5GcwZoBfp6Q+
	 /jLZlov4RO3RDW3PhPLUBoK7vF2qhJZODgljG/King6Bya5SEp+nHmvRVcX962e6ir
	 w+SKpVyoBEj4I3CPiEJO3YWtbE3oxX3B0xAZbvfTk/iRWwfWpJZ5WNeu6tTsmMnCVi
	 jYgqXzhHlTbUyeP8Kv2c/db5dPJEdh3JX+5MU17ZeghU6+EcFREN44wg6eoeIiDXGA
	 zZ+P+8TSMhXjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8E1E39EF964;
	Wed, 28 Jan 2026 18:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176962442461.2180130.16972311874424631769.git-patchwork-notify@kernel.org>
Date: Wed, 28 Jan 2026 18:20:24 +0000
References: <20260122220523-GYD3596979@kernel.org>
In-Reply-To: <20260122220523-GYD3596979@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 22 Jan 2026 22:23:37 +0800 you wrote:
> Hi Arnd,
> 
>    Please pull SpacemiT's DeviceTree changes for v6.20
> 
> Yixun Lan
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.20
    https://git.kernel.org/soc/soc/c/332a1ff4888c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


