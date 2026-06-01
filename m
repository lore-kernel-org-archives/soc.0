Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CC7340407
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 22:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780351364; cv=none; b=lqYcJc0LF2aSmhXjkjWchFR4dhGjpznG71riwtKrnHvrhwuIF7V1dUe51K95mBid+dF4c/9QNryyik9qW5X4qyncNbj0pt75l4teO/jvUnBzz7eIbEkj3ktOaQ0UldTdJBHHGcOaq5yvFQzENO6a+a4S/mU8nFnRnkn0/qfvgAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780351364; c=relaxed/simple;
	bh=iVZSLi8oWZIDAgRjpMQd4pzwdrAOurcuNkQjM0cO418=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ONfsiSxVpcpwhmNTYTI3PkHyULLVKZWW7Pun9Cqk79f/k4MOrNP66f9ZZ0J5rSUZanVrmme6J9uKOrZyFKH7Ajb8PiLwGyHXrkrFs5wtQokl2cKvON+q+O3WyPGg46/qutIDVmjm959vqm5gz6HtJgREo9WTS/dvNvyomh4Mskg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jd52lD4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jd52lD4e"
Received: by smtp.kernel.org (Postfix)
	id 630BD1F00898; Mon,  1 Jun 2026 22:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB801F00893;
	Mon,  1 Jun 2026 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780351363;
	bh=mPWmQH437VNUyeyVgvX0+JmN57DSkZFKDENDnT/PJ7s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jd52lD4eW+NhZAV1JKpPcAZdF8UDHLkvVExP0Dlgc0RT9QqzC4HZPqBwlPeg7GafA
	 3RcN4scNPMlvXuW52VEmTYWVaXM5pR5+XmbI3feHCATPIB0ZkZiaZsNRhMEpGliXPY
	 u6bnZOQF/eO2UqPLgcSMFpaFngs+Vi3JFxMeYitbJPweLlqUgb0MDv6dowHvaLOdDM
	 K46+XAPzqBDUlAmGDFQfV1VXeYOUYZnVsrvcVhwDGV2iTBX0C5in4MrNM4ZXS+Sznk
	 ug96DY1VEasrmCK8BOZ29BpPy3dt175hymPmIXSM25zpy+Yv6WwhJ7KYTD2F3BA04l
	 K/oGOGbMiqucg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BDC38119F7;
	Mon,  1 Jun 2026 22:02:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ep93xx cleanup for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178035136538.102348.17235304442923914735.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jun 2026 22:02:45 +0000
References: <20260528224507.3772367-1-asv@kernel.org>
In-Reply-To: <20260528224507.3772367-1-asv@kernel.org>
To: Alexander Sverdlin <asv@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 May 2026 00:45:04 +0200 you wrote:
> Dear SoC maintainers,
> 
> Please pull the following small ep93xx cleanup for 7.2:
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ep93xx cleanup for 7.2
    https://git.kernel.org/soc/soc/c/30b1e0a47af8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


