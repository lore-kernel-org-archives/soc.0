Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5785E329E79
	for <soc@lists.linux.dev>; Wed, 10 Jun 2026 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781130016; cv=none; b=JVUdp1EEi5/5r2Mgw08ufLHcql740KtTURVZhHZUQGqCXU1TdqEgqfq09eo0jX3QTz8UvO0huG4zaFoBJE+EcsaOrHDc4A7ZMUWIJ6M7umrFWdLSkZW69YlA10L6kFhJgBD6IH5cGB1nOBSiaOtr9X9vVt5j5DIsW7z0qV+IgJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781130016; c=relaxed/simple;
	bh=8csdBVnUa6fL0Zc7WIkib4up37CajCGuIvhkSsoGlK8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b/zs0GtL4QdNCELYmKvPrVm8H0zSx7VU73FKy8WCRhGS/M38Ve57UusLNgghfPtnUNNtF6MagzIsoDuBadmtmEuWLS3fLQ/CYwY8Ue8xZlEjKCRaV87VqH+gyPdcowTYcsr81dE4fk7w9eVuFVt8LmY9hhgoh6pKGfRPJDLf6Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcM6rDYy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcM6rDYy"
Received: by smtp.kernel.org (Postfix)
	id 02AA31F00899; Wed, 10 Jun 2026 22:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B3A1F00893;
	Wed, 10 Jun 2026 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781130014;
	bh=BOFKtZCHPGxPIMzI1nVxJeTGfeifbFPqy/DBACISlEM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jcM6rDYyqPMybZsIYevpTGH2OuEiagHwDNQcQQ5TSVeidBvCOjnIzolroUU7c9rSN
	 d1ZxJTVHYylVWFb+2u8ng34p9TEpKjjV34kp75D5AgTsl3dLmmlv0ju6rNETBx/vbz
	 oOZlawBWF/X3r2M9Bg8ZB+3FDNrlPToo0GSazA3+XMOYmHWjJNie0RQ/FrYvv7HwjF
	 MWIU072qzEDuz1TBx2diFVkcTEp0TiVJxASNluFcpI+YqwM9Fn4S69SQmJuMHhXl+d
	 7DJGWRJyL/h3/O+TAZaOV9Ym/7X6blay1RMhS9hq9A5yn9Kw8qdAxmXtlmnXR8npX7
	 aSbTIekrweZrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A543930DFC;
	Wed, 10 Jun 2026 22:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX arm64 dts for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178113001264.3654873.3765240570916564610.git-patchwork-notify@kernel.org>
Date: Wed, 10 Jun 2026 22:20:12 +0000
References: <20260608155731.2323181-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260608155731.2323181-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  8 Jun 2026 11:57:30 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX arm64 dts for v7.2
    https://git.kernel.org/soc/soc/c/b8d5578e2e3e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


