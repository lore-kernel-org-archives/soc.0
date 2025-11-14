Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CE12F39D1
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162644; cv=none; b=fcdpce1ihQZQa0Xm+CSHKNNyxnJkRkh6DFmaU9rskqDhTVXlFc2lBVk2FL3fLK8lsqmO5m9YEuOyuWkRbHCJaD+kxyOnvLtddH8Jqxg2pmhNjFR+75azzeXCXg/24pbjI4gKqFEVpUlpP2UDyA4X1OobZ/jeJOWHbLUtzr3J+eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162644; c=relaxed/simple;
	bh=grSs0kn+bJhVj5vLRzvBmSiSPXApurP3+2eLpt6QfUo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lQbrBtMGfNuSkN3wxqSYrHsQC3f2+NOlYfzIw/QSCT+jgp2rs9KLIyeJOyIoicD84wg2edkgc5Nt005mNXTWDX8nIVznWUYvi2f/0eRH6vXLfcfHBtmRNS7631xxSXv0UnX2r4TwjYXvzt0VJwD6SqgKE30YczlsMKulYa8JhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOqujNkx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOqujNkx"
Received: by smtp.kernel.org (Postfix)
	id 8DAF4C4CEF5; Fri, 14 Nov 2025 23:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7884FC113D0;
	Fri, 14 Nov 2025 23:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162644;
	bh=grSs0kn+bJhVj5vLRzvBmSiSPXApurP3+2eLpt6QfUo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HOqujNkxO8yKmn9kOmug4kpRgdwbCZoT2x4PePehVtdwmOXRklEQ7bEc+cdWpcjeB
	 cRbJLhpv5xK8P82xXsCG94s7p3wXjYjjMCrxCR/br59Oegej9n2i2duHJKV3/M/tWe
	 Pm8F4d+Ys0GyE2/HkmE/MG8/UKO8c9EkFqbn3X9DQSYQ0/SoW3mV9VXLqQMxTjlmz5
	 g4LD6FALRxRYdavDnfkpfRcCScxaGs8v9YwvE0A2Xymh7PKU8HFHoC2VnPcNgOseQD
	 h5V1HpcuwuPMcNrh/sMPFQD0fhyy81AROltn/5P7bc82ktHBHYgaf3euUYgzqJIPiZ
	 QUo3HBbNR441A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B073A78A5F;
	Fri, 14 Nov 2025 23:23:34 +0000 (UTC)
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
 <176316261299.1867843.12657854706465903046.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:23:32 +0000
References: <20251105171619.3649345-1-p.zabel@pengutronix.de>
In-Reply-To: <20251105171619.3649345-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


