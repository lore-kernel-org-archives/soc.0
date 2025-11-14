Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B0D306D52
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162566; cv=none; b=jlPxuVF3gVVJqnjVp7LUJsrQq1PuXl6a4b++mEYWEjhkj6QRCtiSbWKdK6aHOjndq1OFR7rw48DThjkMhGFuO5RFtoLFpderkBcGoRPH6vroWejlwIeplNSrRLi+vcZk2AxIaPZUEs45xLk/A0cSv198A3ouGh9d00Y0FAvxAEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162566; c=relaxed/simple;
	bh=kb+62rcxjkYgXTPdKUHF05GZfaQhRmGwC9dE0NMnv5s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YHVmPwjACnMEHMduGIt3PiG0K7QhVEjiVXRzlKEWyD5L97BYprwL2NxCuNoQLo315rtt9aOgTAG74jCokHZC1uWA81iyoehKY4V/p/OM5rtNXkUiZgIr84WJjcL7qfLm6lwYU4FERh5u4+fysajKUi+Y274vvtKibhWWrALMuoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLkrpS/p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLkrpS/p"
Received: by smtp.kernel.org (Postfix)
	id 99EA6C19425; Fri, 14 Nov 2025 23:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B84C116D0;
	Fri, 14 Nov 2025 23:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162565;
	bh=kb+62rcxjkYgXTPdKUHF05GZfaQhRmGwC9dE0NMnv5s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jLkrpS/pMrdOS/6+kM1kW10rhANr0tNK+uyHzEpREXlJp83PwPfJMU24O3H23l9c6
	 wk0VyK4DH2ZZ6b0HEFrHg+9ny5Th+Tt6xwkzW+McE+YaqgkNcImna7xankg9oCMLqV
	 qZ2FXx17FYPyw1qdBbdbZISoA8MnV6WKwafoK6+fWTotEOdBl39k6tZzosf1jgJ/cf
	 NBoWCiUdZ9igz1h+F5izc5LqPZ3exa51haYxvRqXyB9UkYFzEjUgQMb9L8fo3VjN7j
	 bCySclyMHn1EjxMN85+/xpJSXA0XRFyVWT+jCFOGiKebTZFJCY0mPZE4HKGs1Rv8Qr
	 LkVRTqSAZ4DIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C913A78A5F;
	Fri, 14 Nov 2025 23:22:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316253374.1867843.11089864005181377921.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:22:13 +0000
References: <20251105171619.3649345-1-p.zabel@pengutronix.de>
In-Reply-To: <20251105171619.3649345-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  5 Nov 2025 18:16:19 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.18
    https://git.kernel.org/soc/soc/c/c3216f1d62e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


