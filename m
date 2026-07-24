Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE01644C51F
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913642; cv=none; b=VojUTlChZWn6PA/xgfSXVyOUjeXHBCyLO7eX4PpT9FUXHyunln9Gso0Tm40x32b+IsodIsqJweKgMNndiYcaYxQDN/jm+NGybavLoTuFDiD4sxDeI17oQivobi5CUyz+/BGbkLiZJ8lZrrlm7wGyXisCWgm6ZyoBX5VXcPoYL5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913642; c=relaxed/simple;
	bh=YsVuH7dt75wbwA9vN8Al+eLXVNAlsO2FqykgL+KYM3Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Vy4/kX2J09TVl19nvln4lKxguI66+Mxj8Mi7oySEJTPYMiC0wUt39iXoDoqPvtXIPlCGUCcO6PPRsrQYyUkB9pjnuodsO1Y/4k3aC1bYt7T+msb6X4zJxwVVYhyeWKkTDfSrCop7p/qQhsL37S5hga0Eg5wBM9ECTPcovCxWgyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnfWbQ+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnfWbQ+P"
Received: by smtp.kernel.org (Postfix)
	id 290BD1F00A3D; Fri, 24 Jul 2026 17:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F321F000E9;
	Fri, 24 Jul 2026 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784913638;
	bh=6L3iAUxnwpC0Co+f8/8yvSJRKFgAl5/7PtQ9i62qLsY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XnfWbQ+PvdzNtz40OS77rFPUGD7XjNklxyxTDxN2nOwU7hKTjgUvxNf46EVddyumy
	 LttssIY+vo68cjPEv+XlkOdZ8Wesa55UIks+WMuncVjkMtl0SkyQBn62xd9YfdWlFX
	 PRSEuJ5BsJ7R03xfPwtXq8E79Ex6IJKWEzhZJh3PK8mXy3afY4zR45kjI20baOY3GH
	 iqx3HT2r+qq3QacWfabVEgrBeNTh3Sf4VPdUCYtas+6FonSB6hxbEpX8XXlIM+yspL
	 TDjfeACKpEcWKbaglTzcTno2lKadtEePN2N/0Eg7kUaahY/PM4Faix2q6x1k3LPlkc
	 Sp/SBCpIGmK+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AA039263AC;
	Fri, 24 Jul 2026 17:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] ARM: sa1100: convert gpio-keys to software nodes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491360514.3243435.9931961747631032671.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 17:20:05 +0000
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 06 Jul 2026 20:13:59 -0700 you wrote:
> This patch series converts StrongARM SA-1100 evaluation and handheld
> boards (Assabet, Collie, and HP iPAQ H3xxx) from legacy platform data
> (struct gpio_keys_platform_data) to static software nodes and device
> properties.
> 
> The first patch registers a shared software node for the SA-1100 SoC
> GPIO controller in drivers/gpio/gpio-sa1100.c, attaching its firmware
> node directly to the GPIO chip prior to registration. The subsequent
> patches convert the board setup files to define static software nodes
> referencing the SoC GPIO controller directly, allowing pin bindings to
> be resolved via the attached firmware node without relying on name
> matching.
> 
> [...]

Here is the summary with links:
  - [1/4] gpio: sa1100: register software node for GPIO controller
    https://git.kernel.org/soc/soc/c/e4671f292ebb
  - [2/4] ARM: sa1100: assabet: convert gpio-keys to use software nodes
    https://git.kernel.org/soc/soc/c/ea07a154791e
  - [3/4] ARM: sa1100: collie: convert gpio-keys to use software nodes
    (no matching commit)
  - [4/4] ARM: sa1100: h3xxx: convert gpio-keys to use software nodes
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


