Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A09420899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422303; cv=none; b=nvzdz3xKraNUAnQOFxEcx8j9oHLi+C7fHBqsIsQxRDuzvtmQ+MBFemHyDrXdZw3XIdXHL7W5mW+7JMmRSYWrzsBfIK6JQ6OThP7QqQEw7iwJ0P2V3wNRhTik6696oheCzkaB5yPc3D8r7EzSZDX2JSmJI+kEoxxUs0MBksw+2ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422303; c=relaxed/simple;
	bh=HhCFAsnV0ycSaRrvwFicPAyCdmY9Xas9fC+UcWX0LE4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VaRXIabKr4WiQIUpLIK28C2c/lZCgseOiVO+0rdqjS8xa+2O+p/bXX7yxiD75mzyJauEH7hWi66/j/QQNK4WaPZgDnKD1KT0h6Jl/DEw7t8bs3euLGre6qXVDONGIga5jPeLE9sHqZ6LFKc47pJDdMfbc7Sawaer/W01IQnMvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeXcebD4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeXcebD4"
Received: by smtp.kernel.org (Postfix)
	id 60289C4CEEA; Wed, 19 Mar 2025 22:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC3CC4CEE4;
	Wed, 19 Mar 2025 22:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422303;
	bh=HhCFAsnV0ycSaRrvwFicPAyCdmY9Xas9fC+UcWX0LE4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aeXcebD4ecPPbi48FKR9zR9XBeJuMChUDQrXJ7ae2dAv2+aMtSFro8lhStDFMsadv
	 8/+zPzGrboMAhytvlg0gJRG5Q6DAzt28Lwv/AeXozM/1GV3hPpd47aUNZQ5/n6/bxL
	 pOxIVGwE/myytChYtNYBOb8njO9+ENyPnic8gYUDGAMmbdMD9oqHnJObK1vDggiulo
	 9T7rVyQFNLeMZXQam0I1z6HR6LBuJEiWX6GB3yInUPLm9RdCOcCrCsc33ihVptpg53
	 0rq0tWjpPJNytQnd4nYAbG36iFWoJQVix00JcFRdDUF7guCHjIWKgyF8XIsA6DyA7/
	 rDSg6swSxsEvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342083806654;
	Wed, 19 Mar 2025 22:12:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 devicetree updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242233881.1211847.1757085533178825822.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:18 +0000
References: <5d612c0e-4cd4-469a-9856-dd4552d74412@ti.com>
In-Reply-To: <5d612c0e-4cd4-469a-9856-dd4552d74412@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Mar 2025 19:13:57 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.15
    https://git.kernel.org/soc/soc/c/35759662efff
  - [GIT,PULL,2/2] arm64: defconfig: Updates for v6.15 for TI K3 platforms
    https://git.kernel.org/soc/soc/c/1156ebe3f925

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


