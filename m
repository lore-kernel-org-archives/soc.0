Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEEC2AD37
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281601; cv=none; b=nWG8P2e6t6uoMb4jOsyl2bjcbLrDp0BOXyY96OEIjsJQtRksdthgq87qPnESjdmPvdpzfqZyATgfdQhGyA620n2+EcVLbC0mnXsHQTTJDRFND7tRfiPoN4LE6zvykiQSlrS04jysV1Cr3dKe4sXiHlIje/bZDM6l7Avy5EGIyF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281601; c=relaxed/simple;
	bh=nAuS2usmENLjVCxPt9riabDPBpxz/Tqkn3yZnOUEl3Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J2c6vjN1AO679+1xT/Luifoun+2y2qY0eZop/TWhBT1TcROU9mGj/XjHFFwv3TTm4PqmBKPUB8nrqDPVQuyjbLmI9+3XGYsYYLGM7GtJqUZnMlPNe0TczEAjcNckyw7vzJu6gtxFP8OK1uHRCj5pZE+Tfvw3s4NoW1/TZJyJNnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAJD7s6T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAJD7s6T"
Received: by smtp.kernel.org (Postfix)
	id 40B3BC113D0; Thu, 27 Nov 2025 22:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B53FC4CEF8;
	Thu, 27 Nov 2025 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281601;
	bh=nAuS2usmENLjVCxPt9riabDPBpxz/Tqkn3yZnOUEl3Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fAJD7s6TREA9iZ028JKTBvyAMjD4TLoJ0TyGHIob6nxIMwXHbzRmLc3MQa9BbypSl
	 hQrgoIJCCK5RP3lQDoiwFqgx0TlC9tIiaRkDBgWHnO7ktLkyeXZ+8khp+K1ykZFC21
	 PBDZCygpYk5Rsf+Vex9dRv7n0IBzJ1ElhC3YUEuDJZ9DucLCdvsJNtIJHI/Ijox4df
	 LMunJHe0d+KJ6XR7ootuBGQDqLAcCznyHMOuaF6dzpmv76OCc7P/YDXd8cdkxYfcbn
	 p1VBoy5QjRKHfSkwnVTami1i72qwQ3bEnnuUPJod6mbOXmCRPeTSGuOsT2d5YXLBFr
	 4Si6Cu3baY1rA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B55F53808204;
	Thu, 27 Nov 2025 22:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428142327.55019.11792362096526326316.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:23 +0000
References: <8386665e-b465-4efc-a5c5-72354397623a@linaro.org>
In-Reply-To: <8386665e-b465-4efc-a5c5-72354397623a@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Nov 2025 09:43:21 +0100 you wrote:
> Hi,
> 
> Here's the Amlogic ARM64 DT changes for v6.19, adding new base hardware nodes
> for the Amlogic S6/S7/S7D SoCs, pinctrl for Amlogic A5, hardware camera ISP
> nodes for the Amlogic C3, non urgent fix for the PCIe DBI memory region and
> support for new Tanix TX9 Pro board.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.19
    https://git.kernel.org/soc/soc/c/6038f30aa898

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


