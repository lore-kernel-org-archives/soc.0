Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F8A3E1692
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 03:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033832; cv=none; b=mWHIUXcDaqYMohpx116ZihQYw4thCyLrP08RfbBPp1S4fwkbI+i/IcdfLBTNP+cF1LuaRE8V8vy7ECwmOs5oIPQLU4cVHO80U4Ba2WANH9udzTgL+FXDtulYf7xDbCZuWlCQJ2/kN0HGwbB4M5jJ59Xf27NF/UEWjZYmlS9XB+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033832; c=relaxed/simple;
	bh=yyoho1UQIkrmPHE5KpPd+xaqTFbj0cy26KKwtCGM22Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=I6EldOA3YO3Lv8wc2+xKoC0ukDxSlzQvBUX6R1HIjyWMWL4tma31KAzO2wcoo9xPvIjH/9rq6rEQ2/vH39yN0K6OqD1zlxBahqDl0VQlR0CLYt0+sT/ptTfJ1xHmw61scKlE7w2GhPGR3yKfjCCR5UqxI0BZ+MNwd8bLem9Hzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VirIVpSm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VirIVpSm"
Received: by smtp.kernel.org (Postfix)
	id 1C47C1F000C6; Thu, 15 Oct 2026 03:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AD71F000C4;
	Thu, 15 Oct 2026 03:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033827;
	bh=9m6rlNla0gUx1oF0GrpF3jGCJwKdmjrxK42tNnm1L6o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VirIVpSmBmvJyTq10UWHuk26SFbYRsqYy5tS3SkxHhem4VjXElOc5IPR07/u8x3cl
	 juXarxFmFKmLeaIvgGG/YSc4TJQGg13Zzqa3/ObnscPNGGgIhDQF1hEWajDrbcv2Xq
	 Fc03toslsL/p4cuiRBR/tI73wpyCeivCL8RYaFNmNnRMe0aySdacvPk3tLblqnE8Pt
	 OtIrJ0NnxpjMxhoTkojVuQ/mOkfgdZ5CPsvqWB+sUxClwUjwABc59Qdb+2wxoWDuSX
	 kIU/nd5gEbwjCMvbZr74xfYGWKOXgEibiBhkoFq+EqRKhEZYESjxmJztHu31e7ayKM
	 BuLXafyteaCBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15F1392E992;
	Thu, 15 Oct 2026 03:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX arm64 dts updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179203382551.3155468.12253782718945495034.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 03:10:25 +0000
References: <20261002142852.3968477-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261002142852.3968477-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri,  2 Oct 2026 10:28:50 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX arm64 dts updates for v7.4
    https://git.kernel.org/soc/soc/c/c49df889a015

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


