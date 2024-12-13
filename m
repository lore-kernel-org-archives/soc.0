Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCAC1E1C3F
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734103414; cv=none; b=c8HkzO5zZM4I0EoxpIkR6lZ/t5zOMs+gioNHpNnlxWZFyZRUH7bjveaz1AXbD+kgzDCoqSh0B9rveBOxsWahoMqm0QwFejCKP0Q0xDegaWXrenWumA2rpsYOFXACoN50s1hYXZuOrs8L8yNPLmsuZO1MviKMvjpjDfvSDy4HfbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734103414; c=relaxed/simple;
	bh=SffVnIZr0VPxDeGRm+CI6URD4Y9UfA4r8M3n2VF2CxE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XJXqNIcGgOekIKIW1c/MCLtzVuwcJsyH0zUrY2Lo57L2pMMq8E9FxP8GGc4E3gN3jy2VepyswfuK7fiQPvomgPpXIEkZJdbr2UfS/2wbaw+mZF/bXpcozSbeM9JgtqtSTf98nr0DHgiRG/mcvE9RM5zOpsX2+ce5mNTMk4xVoMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/qMLKLG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/qMLKLG"
Received: by smtp.kernel.org (Postfix)
	id ACD68C4CED7; Fri, 13 Dec 2024 15:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C44C4CED2;
	Fri, 13 Dec 2024 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734103413;
	bh=SffVnIZr0VPxDeGRm+CI6URD4Y9UfA4r8M3n2VF2CxE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u/qMLKLGaEz35AMmvk+lRLNdo7/mZeWJbwH158hu9w+8LszEwNdyrCpHfp7NAbYO2
	 KNbZtphiHT9/zcKbqML5cM1mQl177SfMwYscDa5ffaBBJaKi8/DaRA3OeJ1404w0tb
	 pjo2avQTdWzJQTaXugdrvCv1FkKlIJIJ4czQGXZ4Yh20ck8p0lxiAKXBSMMlhPVdjP
	 QOfQvCV2q4wpOGWiOJ8MRxC64D+iJpWmVkAtjZ8JCAxMMfttnOZXoxBLsHYg7dWnQy
	 fcqf1dtAk8HtEeB06piIZJN+3tb56XWQiD3mT4cVeBNW2nJiDWLX437GEDY31RCRsV
	 VIC7HNUrnc/xg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B52380A959;
	Fri, 13 Dec 2024 15:23:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] reset: ep93xx: add AUXILIARY_BUS dependency
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173410342998.3014960.13558672849371022788.git-patchwork-notify@kernel.org>
Date: Fri, 13 Dec 2024 15:23:49 +0000
References: <20241111104418.3891756-1-arnd@kernel.org>
In-Reply-To: <20241111104418.3891756-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Sebastian Reichel <sebastian.reichel@collabora.com>:

On Mon, 11 Nov 2024 11:44:12 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This fails to link when compile-testing and the auxiliary bus is not built-in:
> 
> x86_64-linux-ld: drivers/power/reset/ep93xx-restart.o: in function `ep93xx_reboot_driver_init':
> ep93xx-restart.c:(.init.text+0x11): undefined reference to `__auxiliary_driver_register'
> x86_64-linux-ld: drivers/power/reset/ep93xx-restart.o: in function `ep93xx_reboot_driver_exit':
> ep93xx-restart.c:(.exit.text+0x8): undefined reference to `auxiliary_driver_unregister'
> 
> [...]

Here is the summary with links:
  - reset: ep93xx: add AUXILIARY_BUS dependency
    https://git.kernel.org/soc/soc/c/b6d445f6724d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


