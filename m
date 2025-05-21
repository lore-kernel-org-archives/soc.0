Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF25136351
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866667; cv=none; b=FO30C8cQQ8DGNG54RQt0GgZNn+EKL8bfNFWL1s6IMEasdpAWact5wKmvhMywu4M/ACyUMD0e7RN1/o5Uyhcpp1aRgwEldKg6xINQOY1qsSd2Rh3msm5+6/LsJ9bvEbvFVFqOE90PPDxikW4GH0WCQ25FBka6OSE2JZeFMRTL8bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866667; c=relaxed/simple;
	bh=9OJF9AWCCXCBMvrgkAIMkqlWXB3p9dZ2x9suavPUMNA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=D7PC/ONn8V0ewLEUTJmGnCbflBzL1fUk0OMuYEP8AW2iDHmtgls0pcgOpXUBCpOaAdNOlTTX0jTwaSBILl09aXX2QdktqvkpFmziLL6j401H3G1AqiTkdnSHwfKfGFoPrgzVVSd7pCzzCcRQtfH/6lkD4UDecSP9+lSr7ReI/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEpQrb9q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEpQrb9q"
Received: by smtp.kernel.org (Postfix)
	id 23628C4CEEB; Wed, 21 May 2025 22:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD9AC4CEE4;
	Wed, 21 May 2025 22:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866667;
	bh=9OJF9AWCCXCBMvrgkAIMkqlWXB3p9dZ2x9suavPUMNA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IEpQrb9qhchUJ95LP6lc5pds8hyxf/L8niRiNXQJtVR8d1bT9+8yh78YPqENWVrPV
	 kS79YNF3ofcksfDzMq6HV8p0S6+o29pSokvT5qUqsYWBgNGFlB0YAi5l7CSqYpL3qc
	 SwcsMi8hkbLjzup7/rRUJhTveIXVmiEs4zmFWxWSqUIdG3RFvTNp65fiORhUdduMFA
	 bzRAeM+opAGWs3DaHPLLJFsg+FHQiQqfSW11+47N5eo6DXEfwkEICD05XCrM77pTCf
	 kS9qoOngC+ynEMWHY3rJg/dRqp1xcx/BsFRnSpNSKUjv2ABViVy/GEYpf0pyWfjKi6
	 lVAoZ+dris4wA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC71380CEEF;
	Wed, 21 May 2025 22:31:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786670273.2299459.6943013466263489042.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:42 +0000
References: <20250513214111.43401-1-andersson@kernel.org>
In-Reply-To: <20250513214111.43401-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 22:41:09 +0100 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.16
    https://git.kernel.org/soc/soc/c/759dd3fea1d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


