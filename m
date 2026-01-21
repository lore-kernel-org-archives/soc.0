Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C5D1FC7C5
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011222; cv=none; b=ZzIOVtxzL2R7ref+Bpt47Enzn/ha1mS/2ZIH5EQRlLzPPBhLarsmWXBtemoxeA5x8hjl1VaPRpeVb0arF+B10XirR2t422vCB5e1ogsEFBD47RFLoVlNYe4zixZ/h2ixiPHNTQHlNtToZZiPZl6BmXWzqkI7tUybvqkrgh5tDC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011222; c=relaxed/simple;
	bh=tR+yjL4nw8OIjAd75KE34+ALqa1YGxYqveb6pxz5Y6M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GbT6wl3AdUG9i6CvPwcYPly2zEG9GYINTDSVEDxS2wNT6euLfagqccGpcI3BwjWh+8NljNN2V7L5L4T7zvTRCatC4hQFY2WJpy0AkRtW9aibCx7Mmt9Q98cnLyuVbIYeVa3XelynINVHEyj+WuhfdDa+5TypkbYHhFDw9n0l17g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+BtvD5x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+BtvD5x"
Received: by smtp.kernel.org (Postfix)
	id 5E54DC116D0; Wed, 21 Jan 2026 16:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44250C4CEF1;
	Wed, 21 Jan 2026 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011221;
	bh=tR+yjL4nw8OIjAd75KE34+ALqa1YGxYqveb6pxz5Y6M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q+BtvD5xU10y0X2HYCfxRqc9/cBLiXp5hHN2QXd34/C6BREpqq+0/2r2kZ5zefZHL
	 C3OSDbzcM1NuWwgv7s34UwWH1XAUYyiq3FUwegDIDc7i3r70SwzRncELlhvO3fu46X
	 2jsesNU2yzzhUzD6xjBV3TaYBKDY2c9v784XGHrQR6QaO4YpY0jM8JKnpmtNXYlk7o
	 4H+6bn6OgSnN7HT1ewYAF4tFstTXS+1x3FlNx4TcBYeTOKiErakMejQo7OvyqE6yhn
	 RRZVpx84HjqSfpa0sYf8BFqckos4kY5kITJVZnKpuRpLPDbliSOzLOjMVCE3qb0Fb6
	 ukrE/Ku3m92eA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BB133808200;
	Wed, 21 Jan 2026 16:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.20 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901121809.951664.904962640646255893.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:18 +0000
References: <cover.1768559762.git.geert+renesas@glider.be>
In-Reply-To: <cover.1768559762.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Jan 2026 11:50:15 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.20.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas driver updates for v6.20 (take two)
    https://git.kernel.org/soc/soc/c/f716774b2cc8
  - [GIT,PULL,2/3] Renesas DT binding updates for v6.20
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v6.20 (take two)
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


