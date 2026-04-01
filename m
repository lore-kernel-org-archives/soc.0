Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B83230BDB
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081430; cv=none; b=TTLVp0w9ZdN4o0yi/om5urwmR2fK34XFdXPpq9LK/jmpNgZeOoycUhwidTCKGvX1rDcJwKWt4diBqba0XEivxsLGNUsDK2peomK9EdkN1h8dM3HDCBSG3n5i89Ns3VmzZubwQqQonRQv1NlFwhWgagcvQ8MXANI06xD9BeWNOJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081430; c=relaxed/simple;
	bh=wQVBNYBd4DIoc1L036+EYXXQ4PMCCFWPuZs1jR/cWkQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oLu8Oi+x4C2bpaH2s7sMzRHP7JD2SXr15IKyxvKlLcBQC24UzOgzQG/pQdslPRfqemUGLaQfYDYhdYE/dLVSVdGlaVajvQx6kEm3vfzAlBlYzbELK1HnxtBHdkU1uz9SJED/dOEbeLKGgPZ/itoTDOsQnTpADgvqL2hsiEAs/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlfYnPK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlfYnPK8"
Received: by smtp.kernel.org (Postfix)
	id 521C1C2BC9E; Wed,  1 Apr 2026 22:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388FCC4CEF7;
	Wed,  1 Apr 2026 22:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081430;
	bh=wQVBNYBd4DIoc1L036+EYXXQ4PMCCFWPuZs1jR/cWkQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NlfYnPK84Mtl0t5jJznmkn8oGc5eU3UEq0HkWAmjiYZIbxO2tc4/MqZPo1Io9Z0j8
	 KT4Iqmk82h+G8rmXfbBefX5ONJr1fI3DXzHZoYJ0MyrXVhOozov9MqXLAnp5p5AYtK
	 wtW65X2WF/9mF4J2ddHXQReJKiHYKB8LMeVqJdAVTLdU3khK5QzuJpKpkwLGd/f2ug
	 Qo6dqIzNX9LKAnk11DaMx974P0tC6KelPNiC3zMhoO08MpbgWFY+R8fTP2WRx0KgV6
	 HtYfGCPV9y8mKI1Pq5LEgWFcgi3SHQGgBjTNXxR5ii5v2Xnz3QNd6KMkbYn+UZbXI3
	 QhhlxvVkLdJpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE983808203;
	Wed,  1 Apr 2026 22:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v7.1 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508141303.3882930.11510337401901282096.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:13 +0000
References: <cover.1774606536.git.geert+renesas@glider.be>
In-Reply-To: <cover.1774606536.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 28 Mar 2026 13:11:03 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v7.1.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM SoC updates for v7.1
    https://git.kernel.org/soc/soc/c/9ac420358dd8
  - [GIT,PULL,2/3] Renesas driver updates for v7.1 (take two)
    https://git.kernel.org/soc/soc/c/78b06e0a76cb
  - [GIT,PULL,3/3] Renesas DTS updates for v7.1 (take two)
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


