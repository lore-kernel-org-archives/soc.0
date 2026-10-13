Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951C519914
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907840; cv=none; b=Sozeh/lT8uhM3fp+np8ISScA11vKVvfImOL+KhbgtQz4u7mvoa9cWKD1BrOHL9SXTzq4nalNs2dvI93UtbtOrWrqCvgvvXv3nZFV4+jikjP6gjnfuhCATpfffE5zx8OV7NaYgLMpU5/Vntl0kZjU0VKKkpYCUENToO6ddSQ+cqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907840; c=relaxed/simple;
	bh=iUbNSmViiHgEED5QNn4Vn9jG5UY427rBr2EOgPUSvyY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dMcgEeX41VQjbor79wYKhSlejOgwaAmhn90I9/QVRGqa3rehaChuFJ4JCQEw/rpmB+EphgUMnP5v64brBMYmvzO2j6/JC5EK9db/WRju8S0Hx+c73u6/1hEd+ev5jm+/vyQjaoshpKvuk59GurO2GWV8/0kpxKuwkFWneRH2QbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdEqXsju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdEqXsju"
Received: by smtp.kernel.org (Postfix)
	id 59AC71F00893; Tue, 13 Oct 2026 16:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4378A1F000FF;
	Tue, 13 Oct 2026 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907839;
	bh=D4hSlFpV79wMWXVM57Dsp/c7rZQWNMTPS8zatGw+x0E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FdEqXsjumjCMYyePPsbTGMmC6N6Fa7cmrvzh94Pv/yx3mqeH5PtuZh04HXDzCd+44
	 CY6ot5HQYKSE+Zto8Or7HABJjJMFuI65KKHoK/OAkq+BV+OjQjGAFAa3xdE6Y5vHVQ
	 5liEBd0oPT5fSsIx5osBafG4Jga9DgnNvN5DVvS4dp6WaaHPQDhtNqIQJCvr7rdvnY
	 dKpFzCs2GlDmgq9G8fDYnE+wh1fek7PfkViYXl/9H5bv5V1IZ4sMM4OVVD9GrFtdLT
	 G6VxRChZlFuPi+NHmbCzc6OmgD/jc+2JflT6qstTvHqUPTgHdzukv9lbp4rShjFqP8
	 Nk8JJ5JkCDMcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A35239D5FD8;
	Tue, 13 Oct 2026 16:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v14 0/5] coreboot CFR firmware attributes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190783776.417156.3721149018307710717.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:37 +0000
References: <cover.1788284852.git.sean@starlabs.systems>
In-Reply-To: <cover.1788284852.git.sean@starlabs.systems>
To: Sean Rhodes <sean@starlabs.systems>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  1 Sep 2026 18:48:01 +0100 you wrote:
> Move the firmware attributes class helper out of platform/x86, rename the
> coreboot-table firmware driver directory from google to coreboot, and add a
> coreboot CFR firmware attributes driver.
> 
> Changes in v14:
> - Rebase on current upstream master after Linux 7.3-rc1, preserving the
>   intervening coreboot table bounds and CBMEM no-map changes.
> - Drop the standalone include-order cleanup. Replace the affected relative
>   includes directly in the firmware attributes helper move, as requested by
>   Tzung-Bi.
> - Split the DRM coreboot framebuffer dependency update from the firmware
>   directory and Kconfig rename so it can receive a DRM Acked-by separately.
> - Keep the CFR driver and its runtime behavior unchanged from v13.
> 
> [...]

Here is the summary with links:
  - [v14,1/5] firmware: Move firmware attributes class helper
    (no matching commit)
  - [v14,2/5] firmware: Rename google firmware directory to coreboot
    (no matching commit)
  - [v14,3/5] drm/sysfb: Update coreboot framebuffer Kconfig symbol
    (no matching commit)
  - [v14,4/5] firmware: coreboot: Add CFR firmware attributes driver
    (no matching commit)
  - [v14,5/5] arm64: defconfig: Update coreboot firmware symbols
    https://git.kernel.org/soc/soc/c/876108e1d248

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


