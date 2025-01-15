Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BED61553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961200; cv=none; b=cILFTyqMaIK1zwLUt9pcAtWPBp9XWJsIeM5IBJgblx6/Z1Vf7mYO59cTcW/cPEdVtW7AjNonpUULvhlXSFd1jvX4vKwbjBS5KMK2fioDOn1fnlDfgWkp2GynJDdxEZjgW4rRK6PYB0VHNSGK/9xeaYqeB0yH5VBlkrEeW8Ne0yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961200; c=relaxed/simple;
	bh=DkycO9xGIn2vDB7HQmhgcOfxRiO/nJYyRPjrCmOXhuA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KpKo184ZhAk0hyM2a4Kz6LzbF2sayTRjTiqVxWVcNP15CbVZREjcn+GMgJfZ5f1EP60L89YvutQIcFUs3JfyW4yD8sRv+Zvyd2Ewo5xhlq8ZKf4h+FJ9oWwodIqQBld54U5GCuoJLdfZIPO8mAmUm7Wrzzy3+vLRhKvFX7mCf3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uepYI2NF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uepYI2NF"
Received: by smtp.kernel.org (Postfix)
	id DDCE2C4CEDF; Wed, 15 Jan 2025 17:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7ED8C4CED1;
	Wed, 15 Jan 2025 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961197;
	bh=DkycO9xGIn2vDB7HQmhgcOfxRiO/nJYyRPjrCmOXhuA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uepYI2NF/Tcix2Rs+9x0ddUSBk2L3OtxgXJ1ifq3myCDA0F3rdjezTVmux+gJYEw0
	 VnRlCjSVM+AogLFPpfG6HXMZ500jL6diw3e0cReYMFSDbpd4L7QBeZ5hTxcI/tOK3w
	 NCHpw/5n969S1gtwqrX2V9ydVtxWdi/FjD8Rd1mN/zFfThYUDOwkB0/ViCuDHpWGuZ
	 M1k0Ptx17pvybupqD1WLOpTKaPaSWbzRHHKNDTO4lTH0gjOAmiQtkyk1aDhWk6rSqt
	 IR7VymaTADfcsq4YxpyzSQCHWvPFvDttkLeqHd8u3b8N1l19PBJFaEWhs0EIjAgxNs
	 H9N3iUKA4jT2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE25380AA5F;
	Wed, 15 Jan 2025 17:13:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696122048.809051.14403088358280731464.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:40 +0000
References: <20250115165404.1269500-1-p.zabel@pengutronix.de>
In-Reply-To: <20250115165404.1269500-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Jan 2025 17:54:04 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 5ae1a43486fb3febd5ce78da13eb354f16d049e0:
> 
>   clk: amlogic: axg-audio: revert reset implementation (2024-12-02 17:21:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.13
    https://git.kernel.org/soc/soc/c/bc6a958d76f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


