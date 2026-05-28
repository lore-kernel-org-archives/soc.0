Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9630A30F92E
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006206; cv=none; b=KTZqWaXt+N/pzrUD9N8bEA61tWGtjzD5c+rRHbPBaskCqCPL+57EUiY7mco0HCV/izcFi1TtyfYbHHJfEnVdk5izm2M+iElYedSI+/wEjL2wVD7RopNszH0K1hnakpHGcPEy+/Ikn0krxIPpvhxCatYHIXIqayoy69AjE1/u9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006206; c=relaxed/simple;
	bh=RsqEMWrEyDaKlqwqkgb5rTeAtBHodlMkiFYolgNme+I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZhZ/h8zs/1MvzNfT26DyjpHXtSCktraNbHLWO2UTWKc7Ewp5SMXjJIqL7YwlOmoMtBm9ssGMaiXfTkl9cyqUcy/NDEA23/fyyh3UETzTG3Td1/VEX1fitqWZV0Mo5Z7DrsH/5SjkEJEO9sbO1dTm+jPVkhyGw58eCCREtmeh/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvImSITr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvImSITr"
Received: by smtp.kernel.org (Postfix)
	id 4070D1F00A3A; Thu, 28 May 2026 22:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3681F000E9;
	Thu, 28 May 2026 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006205;
	bh=ab8+KnxpDkBcacmL+ZUQSLiLOZQtbZipX6TAVKYdm+4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TvImSITrdQt6mGid6+p4N2W1gURhi/t3huUFV7vd9pMlVVJ+OpmnkDvx6Pdakrx4r
	 2J5EnGdelIfHxVJSko2qLchePn/5GehBHV+9MqqX3mK//UUH10LPmPeJ1b2HYiLTyi
	 HFByng3XnDP+ssKflRS9Mq/nr1EPlYf0jZ2J7p3aHnrsjjTIpBTAliN+3HU/PgUG1w
	 YhJ9c43wBZ6u3evIW/CQh1N3Eeg/N9uECGAtFAECwAGyi4hWXITYju/JwJqKuzYc/g
	 6tLD1jJEHY34VQviiEzL3EvOXmajDxMT63SbROB0jRM0Gsjeejl3VlXzj4UQOmDTIk
	 k2BuHM1er2nNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93CA73811977;
	Thu, 28 May 2026 22:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000620914.1533055.5408465508222368074.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:09 +0000
References: <20260526145326.3243-1-andersson@kernel.org>
In-Reply-To: <20260526145326.3243-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 May 2026 09:53:26 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v7.1
    https://git.kernel.org/soc/soc/c/d1b903651393

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


