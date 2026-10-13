Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F25379979
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907849; cv=none; b=UPrJkN7m64Pje7hyW/+uvUNYsbWxRYET55HVpMfu4kAP4K3osmtgZij2V3FG1GjpXUdPagnUgnN+E1kJKLCz8SvBRRnC3vsIV/izVLWgKJzJ8rU9AZesNTeCpOMtFf7MEyGPJ1XH+IgcbJpH/KwJEGm7y+mF2+AqVj42vfVRgPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907849; c=relaxed/simple;
	bh=yjsqGyHLKny+IG7BPLVhmoOX9vQbDfb2LG7IHXWPLDA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DyJiylyyVq3u3FZTHiu+ZBfE65AUkv1zEd4iuyJ99vf1viLFAQoFnV2b0YwiwkxU3Wv53F4MTUqKftwJndboEKv6nkDtzISmC4CnnteMq9JCW2JtHgs/0J2hD/plGAN7oq3QhhKZytcLgpaOunju0BcUgxWbZTEE9h1CQYi+6x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrZZMdd3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrZZMdd3"
Received: by smtp.kernel.org (Postfix)
	id 5AB381F00898; Tue, 13 Oct 2026 16:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4485E1F000FF;
	Tue, 13 Oct 2026 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907848;
	bh=Rz7p08uNGSr5T6tN1G6bK2JU+C8RpVMa1tngL1QiJrU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=YrZZMdd3vTIMqn2Uk1WVA5dHw/kWaYXS/lctVmyTPAdsNLBYkZQw7PZYdnv3S0mN5
	 4+RvoV4KCx7+bQbtd6b7COVsyaQTW7bnwMsCp/bfa3tdfXTNqjZ3S1r6S4jLJ80bDb
	 kgyBNcPU19ZvM0tEQdHPzTjYi3o+Y0uZhh5v7Es4O1NB3mEMRpoqnB+J6/gszFRkYL
	 qYQhI6zQWFrx/gzuhS0usbM3aX/SSp9Yspvi9kJYzlWczx497JybWy536bDCHzEVRZ
	 I7bYSktIr2sZnIYN6MpJFnNhC3qgvTV6q+Hq17qJT5W7YPwxEWctDpdZDMpBvfB3nx
	 RYaa8KVTKUGow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A39439D5FD8;
	Tue, 13 Oct 2026 16:10:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX drivers change for 7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190784676.417156.9271880467085891749.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:46 +0000
References: <20260928190055.1994853-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260928190055.1994853-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Sep 2026 15:00:54 -0400 you wrote:
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
  - [GIT,PULL] i.MX drivers change for 7.4
    https://git.kernel.org/soc/soc/c/5ef071df59ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


