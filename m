Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB424A07C
	for <soc@lists.linux.dev>; Mon, 26 Jan 2026 21:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464229; cv=none; b=nA7Gly4DbCKNjSAwi1xjHrpB9Deb8cVDy1/Lh6FFmZEHslqDdZYwFwIQCNSuB1avWS0w4OLeWB3YIIwySJmhlIuE7s64gmFIsvo85zsG+Wu8s4E1byZ1bwA/faZelOPuSlhQpY+OnHKlVAo+9bi7kQbhXZ4L81stpqDsW39Ae/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464229; c=relaxed/simple;
	bh=ITilsaIkqyymOT0S/a8bNuoxmKS5qsXQqsWG/2hdrXc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pvb8UEaxQW8Iq21UZeoSD1W6P7uwOVAlLrvvM5pMIa/jGMZeG0WPjbg+HN0IuXki3pogR6HGsYzHE2ZTCar6D+U1nLzHBIB4v4IER/8BF5tekwEIdA2S0cVVOJvNgdU/mssFbIWhx54ZCvrsu/SFA5/U3ZMBiF2zCy20bSF9t4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgejLWIa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgejLWIa"
Received: by smtp.kernel.org (Postfix)
	id 118E1C19425; Mon, 26 Jan 2026 21:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF99CC116C6;
	Mon, 26 Jan 2026 21:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769464229;
	bh=ITilsaIkqyymOT0S/a8bNuoxmKS5qsXQqsWG/2hdrXc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rgejLWIaLSGjV+AT4l5gqWde0J/tDaH1uzKQZyEIA2XAtCFGrhZIocHGdmHUvHme3
	 07pt1HgceRKAvjXyxhfY4zS9a7NW72+CIPrxyB05Z0lY5lqDGlNZSLUm/NxCV4yu9D
	 gEGbwQVYljH/dsGcYgDk8G0KVXHew5CaO2afcn73ukkPwbvusWJXI3xQWbChtLDFpK
	 tipmz1vtfhDQZaYpqgGw0QlOd5eOSbUKZFj+W9KxIHbcQmfmGFCkibKQ8L/nILQB9m
	 wqODtovpfg4Ylo+cysW8A07kRNvP5yp5M2WN3LklE7KZ9vljBdbyqcqBUOSI+GaR0L
	 7zUmRMk2+h5Gw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BB53380A958;
	Mon, 26 Jan 2026 21:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: cleanup for v6.20/v7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176946422323.190855.8363787806925738971.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 21:50:23 +0000
References: <20260117182117.14483-3-krzk@kernel.org>
In-Reply-To: <20260117182117.14483-3-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 17 Jan 2026 19:21:16 +0100 you wrote:
> Hi Arnd and SoC folks,
> 
> Various cleanups and minor fixes, some acked by respective maintainers, some
> just missed (platform is in poor shape).
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: cleanup for v6.20/v7.0
    (no matching commit)
  - [2/2] ARM: dts: nuvoton: Minor whitespace cleanup
    https://git.kernel.org/soc/soc/c/aeec6d68b673

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


