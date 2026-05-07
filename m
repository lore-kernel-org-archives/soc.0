Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE9F3ECBC8
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159216; cv=none; b=FSgnpIAIDwG2zp0vrTlzLVATGK2gbuTmxMj5bouFYo41udQrufcBdhZ3tJ0wTTJTPwaQpATTOGvmtZkAr7KdVdjLQDo5Qs6bAGQ3KtltH1Wy4Ay1l+XpzVPNLk7r88wwchT8c/+RqD7pTD17WS6AgeJL5UVQYaJfc5wbfWWIp/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159216; c=relaxed/simple;
	bh=4PG1GQEWRGgbNEZumgKrDupWgsTQa2jXD4DVTSAtaY4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DRuYEDSYT4S9avKTI23RHSKlhCANIrXqDhSkgPpvermG7ZQPNpqwucDAGX20RdT2RghyaMWuhaktG6uYK5J0V6tpZ2wrncpoFZHa9bA/9/6J20FOhioFVa/irmwgZ977VdduhyGsc4CuqbHCL8TyQCXKDnb1H9wmscwX0EuYDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bA9zQAWH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bA9zQAWH"
Received: by smtp.kernel.org (Postfix)
	id 5E6B0C2BCC4; Thu,  7 May 2026 13:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44459C2BCB2;
	Thu,  7 May 2026 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159216;
	bh=4PG1GQEWRGgbNEZumgKrDupWgsTQa2jXD4DVTSAtaY4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bA9zQAWHnbY+IOKyUwqI8kn5HyFPYFhhEa8I4aB/zDOXCX0Z/Vp1Wj5pVeJbYjOO9
	 I2gxxzBr70vCB3oQlDYx0xWi7H6HhmkW7x17hVBkAspiy852CzwBKhTbMnrmLFXWom
	 OaTMIciGK6pYD2TUcq/4jXijYfTme14wr4f6XqEuylh6KpQEe+N4lnl42tAfCmYNMd
	 oy0aHMfZGyZ6FMiiq9010+QOxpxOsZpswJ3SvF8/8bNW/KOTD+YtGsi0mC+rD0JWJK
	 +IsxjwBa9T9Oa94bZBOaGsM3/vYfi1GioC+6TVymP9zDBKfoy9zOL4TORNqoQODGJC
	 mM2t/zrlk0Gig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EB939308FD;
	Thu,  7 May 2026 13:06:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL]  Renesas SoC fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815916528.3933061.14751284559282357428.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:06:05 +0000
References: <cover.1777899408.git.geert+renesas@glider.be>
In-Reply-To: <cover.1777899408.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  4 May 2026 15:00:09 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.1
    https://git.kernel.org/soc/soc/c/b94e0e37d1f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


