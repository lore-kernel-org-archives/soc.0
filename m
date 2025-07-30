Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE97262D
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 06:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858634; cv=none; b=CF/g9V6RdRaK65Zw0CvpglBx9EBEvIpxAV0U01cPHeCm7U1Qf7BelhB/35ZDLt2IWx176qI+KivVXqhG0SD90MTlS/VcYhlMP0sY8XQVI2bgabG2/ao/7OUObCbyN2GJ+VpHro6h6lLOGuW4WUdPZPC+1WqDZs0yjDFFb5ontqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858634; c=relaxed/simple;
	bh=bZ9x92+/JG5sz94nMlz0R46s9R2SaV0yMl4tYBCWTlw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kgyqq6j8T4Ze//EQZD2XfAc0/gy55TVr5eSP/G2LpD2Yy+/0ZP0Q5fc7q27xfB0zie+GFcNCyUFjH590m96wsx5XXmTvQhHVWaaCBClEd5Y8D3DFR7GK4Hs11XKDnOPNEYXpsv/yS2DgQna71dfXffliJqrwAvgcf2NUltzTvxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uoy4zBpX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uoy4zBpX"
Received: by smtp.kernel.org (Postfix)
	id AEF08C4CEF6; Wed, 30 Jul 2025 06:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99192C4CEE7;
	Wed, 30 Jul 2025 06:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753858633;
	bh=bZ9x92+/JG5sz94nMlz0R46s9R2SaV0yMl4tYBCWTlw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Uoy4zBpXSCFhZxRsVeybgUPDnIJYIVBhKIRiohPGxW5SH/ovDLbSmTgc54lbw9uJ4
	 q+tuxfNwh28wvZriqjiHwJn84IJdrF/sFpgmChcFGUnIJ1jlho45nplUpo9PgY7QPa
	 gcR6RjHqV7sodVAHALufutXtt7HX+602w24pnKsIGSHr4Bw9cD34V8v/v72n9u4qaU
	 V2agNhZxOzUgWdI1mfLbQy73Dyu6Kgzn6KalhCxHEiACr553yWoymPYdufZNJBQSuj
	 fUuBvtJvOvvkpsdIc8ccTW/NSYOsCKDRcVGCK+ZfPIpsrqeHTCp1++4YakH65CyjoZ
	 cS/ap42xuP69w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD80383BF5F;
	Wed, 30 Jul 2025 06:57:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175385864976.1808741.10162989699260855684.git-patchwork-notify@kernel.org>
Date: Wed, 30 Jul 2025 06:57:29 +0000
References: 
 <MAUPR01MB1107297124C9DA0CD77DA3DC1FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <MAUPR01MB1107297124C9DA0CD77DA3DC1FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Jul 2025 15:13:21 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.17
    https://git.kernel.org/soc/soc/c/11949d263a56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


