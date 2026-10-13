Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F851DDE4
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907843; cv=none; b=ubhT2ZwXM3R08qLGRTMgINP53taou+keuzK0/K7MhulsDkJ/I1sLKHwRL3RNwsp3NWsPxlCTlAXpmuyq1ocFSYG0jZvWmvZ6NrPwjDuPN3AfnS9meZDAJuLFudgo6BfSOS4FYlchAksa/g1P9NUN0S6qvAH+ZyGT+1LsfaxvleY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907843; c=relaxed/simple;
	bh=m1kaEAfhA7Utm9PNyb6yTDk8r+8I8GY5ulbrQukNZPg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tdxmFjKSOpYbRiO9YFSRRfgBu1uAnmwvE8Ygx5n5I941qA7PRT66j6bTOBqF/BAanBigjOMiYvRiVFRZLeCCx3zotykQMU567mCAm9edb2fXKhiwo0g05hG/tZQM85KKBd+SXDJ3NKMNm2Mrre3U9PrV9+W76x/tjieGaCc23g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dS1QGYL9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dS1QGYL9"
Received: by smtp.kernel.org (Postfix)
	id 59A881F00893; Tue, 13 Oct 2026 16:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F0F1F000FF;
	Tue, 13 Oct 2026 16:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907842;
	bh=a3d0OKHKTBNWs02Xe/bZj7sbQpnBW2FYi1THRTjjEtU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dS1QGYL9x/JoQY2EwNiKwFMMn/NAY/JmhaBe3B6qLGXfamgu9V0iSmlfSyMWlZZLO
	 EZFaynXHWadacIJIFNWAsbKNr6rBUVRqs9JXtLCzlRpW8+d9gP0GlyT+/wcNwkhB+r
	 8ziEjVyBHdh+blLlvh56bxFU2wfzcrwVt8IEw5Tq2fDNMJpEKm3/Box2107SIryzCf
	 nmsMn2cAGIsXUrgJh8hFgAQxQHhbr1HqUq4NpNOu6/90jOxWgMk9Xeicp/IeLvKoIr
	 fz96u026ELpVcoL4QXjtPkLOg0ea5DjVESoWwQK3vEPmBxj0NUdFHHy6RfARjLW9MY
	 oGFSzyuOF3SKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3A239D5FD8;
	Tue, 13 Oct 2026 16:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: soc: OMAP fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190784076.417156.11351758881241042185.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:40 +0000
References: <7hzex19sxw.fsf@baylibre.com>
In-Reply-To: <7hzex19sxw.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Sep 2026 10:39:07 -0700 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.4/soc-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: soc: OMAP fixes for v7.4
    https://git.kernel.org/soc/soc/c/2d200c41b5ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


