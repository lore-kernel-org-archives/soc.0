Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36939346E57
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874863; cv=none; b=gJIKBocnw5eqbdAnUZZZkndoznG0AVcXcQj3HLjEGIvBYopVFkkRYIOZvVXLl47ZOsiDRShBPTI7ndh/xNTzaPwtbdonnjB5hNsB1+3eCQC5/7oEnpKGAMtCO/nJuLKwz4YUpNPfxNWHKIredyFMgno70UBQeNk4DQYDLUHWTkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874863; c=relaxed/simple;
	bh=zSrHR2gF3lO/qW11C7dQJ9dAuTP3SjHBACSR4t8Zm4I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MHj9746uFoLyQr97ZLNhYhspq2wQU4J2bMWexZsFARwTaQhLSzh7UAnbaj2kW6m1qwf5k0tOfmq1H00IMv8mOh+AG1pyw7oC4rDX2sTHOjsK31J8s5lSJSRbLmqhNkGPCKvleS4f8THEsuOHbMYbKU3Jncp2XtlDXyYUBQJodJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJMR0mdB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJMR0mdB"
Received: by smtp.kernel.org (Postfix)
	id BFD961F00A3E; Tue,  4 Aug 2026 20:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F2D1F00A3D;
	Tue,  4 Aug 2026 20:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874860;
	bh=0PmxwIn3w6WpF3E06TYn5jAaY/XFBQZHImS8G3WB0Sw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oJMR0mdByXyAoVO/xRGRI9CyaM4IoCglDFwrR2JJ2llAEf5GMYaxnVGOnZbTHBDXJ
	 oPJYgmGOPBPyYjxMFnQt2HCn7i9Ow+sHVJIvUkkz+mq66gRVo1M+fMRsdGIORMIbhz
	 3hrI4HtMVifTjxH4pnUZtiiTBEvf6xOdTIOfJIgzjLU9e0/8XIm2BdH8ehi++E/h+U
	 iMKCIwEoAy8RiOKqAJn1uvVPwgsJnD3BIkyYlly+OhUA5WP+PN2qCjf1bUSnWVDmxo
	 p9rT3a3FbGzyL1BWq6hGW8SNQEkjvd8H98+ymOgQ9GodaqQQSpb+gFuy2yM19poAYy
	 1Al2/I00tGU3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5691D39263B9;
	Tue,  4 Aug 2026 20:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v7.3-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587482088.3769923.5961452486553589407.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:20 +0000
References: <20260802165148.1259649-1-thierry.reding@kernel.org>
In-Reply-To: <20260802165148.1259649-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  2 Aug 2026 18:51:44 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] dt-bindings: Changes for v7.3-rc1
    (no matching commit)
  - [GIT,PULL,2/4] ARM: Core Tegra changes for v7.3-rc1
    https://git.kernel.org/soc/soc/c/1ec9093bc9e4
  - [GIT,PULL,3/4] soc/tegra: Changes for v7.3-rc1
    https://git.kernel.org/soc/soc/c/3a83c24d747b
  - [GIT,PULL,4/4] arm64: tegra: Device tree changes for v7.3-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


