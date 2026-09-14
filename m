Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE3849AA57
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398691; cv=none; b=Ql5WZG/diJz08/vzqgeG9yD3+GCh6s/gPk3foYgQWmMEp8bPl7MV2cCsZoRvy68frE5/Mhrh9w2c7N+EjG95Gyg0jfSjQWYKcc67qZg7aaaJPIp+bb0STNDoXoSeuF18t0I9CuY3oMnZt8bNdrVZGz1ZlpttZSjChrtymV2CXMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398691; c=relaxed/simple;
	bh=EqT7kIgYYFgEu3cm7x5EY0NZgC3ADa4BuixZquw0t40=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JV0MRV2TNbRZhLToBfI+Z4OV+KMXQRUfdIXoUeBwjvPSB+beyTB7bhWc2mnvVONRUv5Vuq3HSJhXqkzp6CUT2b5dh5K5k45jM4QDReHKctvNsGkgZb9qwxBWwcebOd3EKOwe0dEX+jCdJZ6mgrFqunk9sLRu2gTmmIKw/opFIIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNSrwdTR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNSrwdTR"
Received: by smtp.kernel.org (Postfix)
	id 8A2C91F00899; Mon, 14 Sep 2026 15:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7343C1F00898;
	Mon, 14 Sep 2026 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398688;
	bh=4J9SuqAb0wap2GH8EXIZHnOjCKbKYoR5X1PwFm11EB4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FNSrwdTRYj0sxW9LY9w7zUubtRK68rJPQdVjt0HuBwJzbOuasv4X+qBhEbvwYI5xr
	 oOh1EUIaZUpi2fHWf6c8Gb/aHstlbkzj/2AV8I/CrAO0aFm7SOYK/iRF1pxMx/Aq7I
	 IW53k5AGD82FT5Dg5K250+9SRK/oGbpVYwSWNl4EO4c2tpHz3eZr9jS3ZTsKG0YgX3
	 SsMZhMEcPIE3l65mO+jOC42nZ8eL3FgCm5SSUUI/D8N/DtRv0fSQRnIcMJ3DbYWZ22
	 ogkB6TMXFEoyB9mmXgu9F0q7D4N6OvR0wK59cFNgqHpaC/gfxLtGQHG84iHM+DamdB
	 a4WcfFW+F0v6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D098B3924A6F;
	Mon, 14 Sep 2026 15:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL]  Renesas SoC fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178939862344.630437.9208197252921883581.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:10:23 +0000
References: <cover.1788527983.git.geert+renesas@glider.be>
In-Reply-To: <cover.1788527983.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Sep 2026 15:21:23 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.3
    https://git.kernel.org/soc/soc/c/2d5adffc11cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


