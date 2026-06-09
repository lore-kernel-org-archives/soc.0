Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70143B3BF3
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007013; cv=none; b=C8760VZjUji/AYJi8mMx6RdpYgCJ3QzjwJxWKKIsuRLum/ffC64honcz4jJo/L8vIXH32jmNPIC6TYspalvKYfjqzWFlPuZvfySoSU/427uhs70RieGSWmDY3nhpqZ09B4j1g0zpnLbdn7PS6JSUbyTxcbyLHuUr3tu4TjFrcjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007013; c=relaxed/simple;
	bh=4fKM9f+DjS7v1St1H9Ow15L6T6OkBszEbncr5c9xknQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nzI48gDBC4IeqKeCYll8hR/+bdHIwJyNIE/D+ZZTyY7q6kjPE/lOOeh7aifDFnomYHqy9mBP65+AOLA0mAtlSiVLDDTm0Yshgc2ZvQcG/TzaprKTwxaVrykwFhicb47m2rYAQgLTz9E3INKL8RWuOhTzUnbsFbVNCDQFVJdE9RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7GWWNL1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7GWWNL1"
Received: by smtp.kernel.org (Postfix)
	id 836101F00899; Tue,  9 Jun 2026 12:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5801F00898;
	Tue,  9 Jun 2026 12:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007012;
	bh=h6Xj7lta2cHqwAdcXWzngcWpp+s+Z1+z0z707RdwdDM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=f7GWWNL1VFypTyIyMvq0ir1xrrRfYEX3FqBRQ0DMvJ1Hm0YtJBV8phfC9q2finRii
	 iwj4dTszSJfAXgUMcWl8Zksu1sA0P0GsQ/QH/iSoqf1V4Bw8+SqQ4AI+Q1xrlNuJw0
	 +kgSgjHrTFMYuHVhw0qAg/5wekyRgsRivysiIiVdceQDOvBXje1LCN2jtqdVyu/Zbt
	 4y2VMh9tMx/yM16lIW38RXUDd+3t2SaZlU+CFwXbu3aReCrMZtTPfPVKrc/zzS6vBl
	 kPKdDPN+J5V28hIO0mKvaknIzD1A+IOQrl9mD7q4nD4q3UwMg/b0FQcxI7A8kpCa6r
	 Lr25mRfvzqBzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1972439308CA;
	Tue,  9 Jun 2026 12:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX SoC driver updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178100701063.1991839.9957131970492009228.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 12:10:10 +0000
References: <20260604164526.1612520-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260604164526.1612520-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Jun 2026 12:45:24 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX SoC driver updates for v7.2
    https://git.kernel.org/soc/soc/c/356b93d11c62

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


