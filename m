Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F434B0CBA
	for <soc@lists.linux.dev>; Wed, 16 Sep 2026 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557687; cv=none; b=sFsP1FhzoIf9aVznMU0AOE6WLMAmEguwetfMSP0gBFvswWUHNh4PtJR6fEyzyECyZVl2sNuZsTqJTSuWXbYYJ0kbVWvRF91dNC6wqxa3GYVMbExP+4FJkH0Wdd30KKbkEtVWEagyjd7LWYyJvVMEy3vudo2qfDaEKTd6ROD82UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557687; c=relaxed/simple;
	bh=GrJ7918fmFieEouvw685O4CBzbmqipqozOJjdY/hvF0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PJl3ZjAirezJSuvh0QxE6erfevy0ulIV2V8F2K2Nv1bdoAiuYI9onVAbnbQuwbBsXt9d2Ol2Suk8TqiYT+0BeWUnMZyK97p24c2DoOcJa/E7T8yiU4PaLMrfzW1r01pTU7H5r1zlHs+LdomiHKPa+kxfzQ3+KDDGsWL1BiML8/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nq5FJQtc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nq5FJQtc"
Received: by smtp.kernel.org (Postfix)
	id 060981F00898; Wed, 16 Sep 2026 11:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E439A1F000FF;
	Wed, 16 Sep 2026 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557669;
	bh=8Nf1sCvd5tvIYLmWo/i/xCxcFng47vlJosE5CeBU6RY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Nq5FJQtcoc/XuN95bXbtP4qJAlg6PV+Xmb6ImDxqwEtx4+AtXFT+f2o44A+eNdE9y
	 uIIgCW1P6uAOGMRLMZeX7udMWap1OY3+pHSybMUU0RTSLwZxUdMjfwcCpZkfH11yM6
	 yHh04BOXk0DnpwrjWlL0fVQL5d4W95f32Ij/yaonR7v2ujLZY0EI2HajZ1KEjqUy3g
	 7BxzQk58aAl+oO100wF3K7+/yywMUcw5SZaulWTm8I989329dbIX28Pbxtbsy+nycU
	 UsM5eXf+rV6wHjbsLjkzPDblPydOidqLb5rpJe9fxLkNGWJkdovaSTN2nz88/z0vqx
	 X7EAyXeoK+jaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5696839D5FF7;
	Wed, 16 Sep 2026 11:20:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT fixes for v7.3-rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178955760414.2572068.15638179801361298569.git-patchwork-notify@kernel.org>
Date: Wed, 16 Sep 2026 11:20:04 +0000
References: <71b955e9-dd75-44ca-8eb8-90267dc70eee@linaro.org>
In-Reply-To: <71b955e9-dd75-44ca-8eb8-90267dc70eee@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Sep 2026 12:09:21 +0200 you wrote:
> Hi,
> 
> Here's the Amlogic ARM64 DT fixes for v7.3-rc, including a bunch of fixes
> for the Amlogic T7/Khadas VIM4.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT fixes for v7.3-rc
    https://git.kernel.org/soc/soc/c/ce55a6545a37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


