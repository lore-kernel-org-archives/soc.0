Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60514350A18
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023232; cv=none; b=M3gKh5YF9MaQcXuvquLQKPX+2LEgOYy+u3jwE1LqaB1YNihIYJB78e+AquYyQUP5U4/biTH7BFjMKLacSDlrJzNTI8wWa1xNBbYgfnxxl1PJ3IEjotFbq6atWSl3VTsxQjNkQroYKf6MLg2hcc+S+kScaKTzbrFFjGlHl0qyXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023232; c=relaxed/simple;
	bh=oct48E8WgLo1+F/RFA6SxLGa+ESl/YdgAYFASFop2Ms=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CyFgYq7JlSK1Z8esVU6QZvgzCohDPF9d/oFeUz7Wsm18+MI51mVF8kzZhjT6hEDXNb5lssdDxBanZRqFh814nE71PUZ4SxmYJpf9qa8+SKnsobcs3XFu1bGY8FMHptFquVG9UKWKyOkdYDfCwNur1H1j2dwndoVIQcULHvRjtZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5XRsVI3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5XRsVI3"
Received: by smtp.kernel.org (Postfix)
	id 1FB251F00898; Tue,  9 Jun 2026 16:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AFC1F00893;
	Tue,  9 Jun 2026 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023231;
	bh=9GO0LB9i737y2je349NwarcD81x12xv2ilzBbL6G7uM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=T5XRsVI3gO89zg14ijw8MQvV1eNJ79WMU7zyhT+2BxrfmP+0wyBzmWTAzFdXIxW22
	 tHIAG5di/B9VLGXT3tcIXJjCIf9zLiaPIhFJJUzVbO7Ed7RpCdMhoWPZp8dgcKPQay
	 ggJrmDX2SzKA8ug3KFVaEcFnYkB8HcFDug7cZR43ZuXS8JPUTxKpuMoAdMJjalWvG4
	 FOuSdPx1PDGgJV9KDB6H5WIMedZHVXo9oSGyawBDUSCJhc7QWwypKlXaIZiCxek9jf
	 G8IvBbVX+dvIK+8IdceAAYkstLJpcEdU5KIUEnLLciBbf+SSS9Ux/vrTYSZ2uxX+H9
	 9P9sPU9HJ/K2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A3F3930989;
	Tue,  9 Jun 2026 16:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] soc: ti: Driver updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102322913.2135346.10791259860455737639.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:29 +0000
References: <20260603154029.sozfqrlkptyvslbn@stinger>
In-Reply-To: <20260603154029.sozfqrlkptyvslbn@stinger>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 3 Jun 2026 10:40:29 -0500 you wrote:
> Hi ARM SoC maintainers,
> 
> There is a minor checkpatch report irq_lock - Check reports "struct
> mutex definition without comment" but it is indeed part of the
> structure documentation. Things look clean build wise and tests across
> platforms are also good as of next-20260602.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] soc: ti: Driver updates for v7.2
    https://git.kernel.org/soc/soc/c/10c24a2a37f3
  - [GIT,PULL,2/2] arm64: dts: ti: K3 updates for v7.2
    https://git.kernel.org/soc/soc/c/018450d76e57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


