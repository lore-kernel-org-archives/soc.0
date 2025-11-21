Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954C19B5A7
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758251; cv=none; b=RPUHfTnid1XwOCV88OAEM87lUTlGidD3xtguzTjXIlj2KuGf67v2nlUv77rIH+ty4XhWHmsO0yGJEJAzJZFtYeGJXRpHWtK46ZmQeov23YPFF1l+9FXUWgcJxXiAA/3e3LSmdzlAq1Vmzc5WYNjTU02Wjwvidsv3kRE+4zprTk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758251; c=relaxed/simple;
	bh=qRyRIQ89COXOlkjdAXz8RkVMVlZ4Z3nxa+DJ4CS8slA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EZtR4yVSIzymNK+GQnVrNOUWp19chQ5iNRliej/p77aVF5osTjVZVW9qUOaMt7Au/oqnjlZTgC1yms/2dYtSNE3YrPESCVbyfDVSW4o6w7QQ5VIumLItSCeUlklHvpseGjJ6ktNe8g7Hd43pUJnOnOQ0NCzWj/bO653rorNc0qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxhapqdL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxhapqdL"
Received: by smtp.kernel.org (Postfix)
	id 781DFC116C6; Fri, 21 Nov 2025 20:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D234C4CEF1;
	Fri, 21 Nov 2025 20:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758251;
	bh=qRyRIQ89COXOlkjdAXz8RkVMVlZ4Z3nxa+DJ4CS8slA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hxhapqdLDQBUWWH/+kFGexpJ8BV51irxCPJI6BdWysyzN3Aq7rDsTIG7KINMQgOAK
	 GIVjY7teQDHBU4w0ct0jQBF8tl2Ifm/9pVU5+JO0haQrreapmNO1hOrx8CBdLAqZ7p
	 A9r2906ccL6O8T3R5qMOu0EHMY7bujh2m2cdB/8t0zUiaYoOxZvrJ4jDywkP6CXEtg
	 EWjz1LW6uUZp7PG0vV+Uiu71eDBhG1pGDhVqW/rqTUptkENAGljd2IaI29UloJQYld
	 9foHgJWyYwqs8yrA+mtp/H29MUrPMJYPHHscOStEVvMEUF8Uz0RUOzqqIHdP2u7BhD
	 ukfmLDj65oodA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340FC3A78A68;
	Fri, 21 Nov 2025 20:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/defconfig: OMAP updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375821574.2580769.18084783654364233715.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:15 +0000
References: <7hv7j8k1og.fsf@baylibre.com>
In-Reply-To: <7hv7j8k1og.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 09:29:35 -0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/defconfig-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/defconfig: OMAP updates for v6.19
    https://git.kernel.org/soc/soc/c/f65372ea2f34

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


