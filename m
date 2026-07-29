Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B73054C7
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340851; cv=none; b=mC+UQR5eiwKOrGf0OhIZ6Vp11okjeHvYvNUvx1nxevqm9KLDL983NFYY1+yju0h13v7FMrxwlb35A4D+PVyEuAokBnGERKSYhikqDKGCJrWBzWi7sJCdN1RqtWxHGsa26gvorqYDPaLC+sp5TWVmFGXHwDmTneXzQNd1JfdPbJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340851; c=relaxed/simple;
	bh=gSGEYe1mG9T8q06hamhMKn/iurW9gkpeFTic8w2yNoM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IKUWzN1X1gNpU0cb7DsXywbTfA8MqYLHScaMzpgLM1ue3zG7drSLKZb191F8+A0KM0VkFdhQ3pkK8hnj+o1bcgyqe+REne+izIkzc2Z/jdd3oAqjha+DJlCrfZtqSTBQzmVKAkEE61i5wONn1uDQVnK3SGRxohypoSBYq+QagX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diKi7FfZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diKi7FfZ"
Received: by smtp.kernel.org (Postfix)
	id D3CAC1F00A3A; Wed, 29 Jul 2026 16:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2CB1F000E9;
	Wed, 29 Jul 2026 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340849;
	bh=Ra5y4W5fkgZD0xnY7dGJpTIpMGQ8FN9hkTsDDvMcAtE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=diKi7FfZ5cF5OyMDBdADJMBR1gBuqHsJ3IJMeqbLWNPxX+7DRTKYgLEXwWcGSe/Uf
	 +5pCnNzcEeXGlQF+hEEhpp5bPWZv70hIX1rFzNIlPTT8zJUix8UNhzY5PnNKvtSpuU
	 PHTiGeV3aeK8cGfN158qBlciuEuVXv/XFo40sYv7ENvw4yDfgINBQ6ooAdCtOpjQlz
	 ig4CYp78OYcNrVXvWK9uHPMW9ItrNw9ESHWWdSzMP4CjSehpnJOUKreUzHlNFsXSyh
	 2VVfTUAnyMF9Cvj/pGpORClpkMoSd45FTOnA8X9AgTumP0bMZw4DhQmZsHR7KTmWSG
	 SCkOIt2q+n+Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3297539253CF;
	Wed, 29 Jul 2026 16:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] CIX dts changes for v7.3-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178534081400.3143403.5187521903320604083.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jul 2026 16:00:14 +0000
References: <amnryOEOpK4PMmxS@gary-System-Product-Name>
In-Reply-To: <amnryOEOpK4PMmxS@gary-System-Product-Name>
To: Gary Yang <gary.yang@cixtech.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 29 Jul 2026 20:02:16 +0800 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/cixtech/linux-mainline.git tags/cix-dt-v7.3-rc1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] CIX dts changes for v7.3-rc1
    https://git.kernel.org/soc/soc/c/ec563ef1c006

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


