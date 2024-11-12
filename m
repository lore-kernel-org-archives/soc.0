Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356062003B7
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424992; cv=none; b=S3bVX+n0e+YYcocRm2MWptwHHuMuXZpW6vlfr2lxm+WsOtGYCvtPAxL09zkWGOScKxsVBH95SnuYSW+8orqXuYQ3lGzJk6eTv27P6UOC51t4tYdUhNtwT/ErsT71SA00KDhI8F5FqB16uwdcRdZpFOq4eXGsUUQLMiy47l1k6Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424992; c=relaxed/simple;
	bh=WfFWnJa+j64vTruGJXw3AHbj3E7ubo2o9XhalTEKqME=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cYWHUIo+hMMtiTTb9u56y1BURwgWLFx4paPulNy3f4RUPVLk7G9S7hI2NBpZPT4vHmQHgQXTpMXsg5ZuHlKgAizoQP48FuKcL5EBcTUnW8Qz7S7MXpLJxrpKnhMPN8YL8Oy0S2LDz6EVcAYMv5t9ckYXtshCP1+GnFgPV/KQIPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBh09ETz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBh09ETz"
Received: by smtp.kernel.org (Postfix)
	id D5B6FC4CED6; Tue, 12 Nov 2024 15:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01C2C4CED0;
	Tue, 12 Nov 2024 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424991;
	bh=WfFWnJa+j64vTruGJXw3AHbj3E7ubo2o9XhalTEKqME=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LBh09ETzDYEkkA0ekEqTBjG11uOxJ9O+QKw2xzDq5Q5oMgJSnQ5hQ8iWdOUTwOD0m
	 SyQSMTvm8CLFJMy7c8P+HTFdTz7HRGjkmPKO3dzmp/MNQqse3Clc5MNKaFSia3+lPB
	 1hNJ+hQEsuphN7A44mkHq7n7HzB3DDP2OSFnfs/Nxw/N3TAmNacOF3KYnVOy0jkcXR
	 Qb9Gby8l+CupiiXCwMds69A7rRhIRjgbhi8TRgLymeiRSimGDeDKoSkxnyshO+4YbY
	 fIZtvZM2THcFzqJhFWEJzmxbTJW3uD9uGpjcmt50w4WsHB9DwT3Gj3fkGPdCpxBANa
	 wFwFMGrHi9fDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B623809A80;
	Tue, 12 Nov 2024 15:23:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142500173.562452.11451762687158072229.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:21 +0000
References: <20241105105229.3729474-1-p.zabel@pengutronix.de>
In-Reply-To: <20241105105229.3729474-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  5 Nov 2024 11:52:29 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.13
    https://git.kernel.org/soc/soc/c/7d6f7cfc34a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


