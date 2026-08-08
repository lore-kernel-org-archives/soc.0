Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2391A9F91
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220499; cv=none; b=P6/Nlo9p3jxzoObJY62Yt8NEW98yfYD3fvk9A8CIveKS1KudToTdQVTQ0HA8AssQhbgb6QigpxH6UfllikADiALnNqyNbe91kittJqKFj8lDbrg9MKehvV++/gaFlq0esjbrsVI7g4Ii76psfPgKEpZ6OV+97G1jnFiYyLzSkvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220499; c=relaxed/simple;
	bh=H8KDDucadAiWJzVoZHoU5Aicxr2dySvetWRe41wkQLA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ia8owDDaKX+NpCONvYgix2hZgee0MEhqShorfzcMnuCP+jWxrlpE8BV4vAJsEGZenT3OL9sOhAY9YAY1he6a7tRG0ogDFCx1F2/0Ud7WCFa9KctllpXDGi9x0u1VNmAjGcWzqiRPhRZJ4fnnjhZF6cxCCyn1fBWls8pZrvJCLGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpDK60Ix; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpDK60Ix"
Received: by smtp.kernel.org (Postfix)
	id 8A0A41F00A3A; Sat,  8 Aug 2026 20:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737D31F000E9;
	Sat,  8 Aug 2026 20:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220498;
	bh=iudMxvvuxk1+7WTEk+iXUq7or9P+/Pl1rT5tSOInCsQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GpDK60IxpbKEZY5Kqey2EQ8eO6JsS7OaGtgsmBv0YBRYfzCs3SGV+pVOtsgLzSQfj
	 8yPv4u5/znUAikanejxxybbR4z0rT74NJCjDsDiU5Q/UGai+9zH2dYwWKqsh+gd4h4
	 rOCQX36Sf9Skigq+m94bcHc2izI5ylXx7UonHx9khT8749UnXm9663HGuMU53OGcvT
	 o2OUKz5pX0HE8EjyGsTHj5tGWNMGb0oXnn3NKTnxwwv7yKo9gBAFl84vA0dmQzx71M
	 FWZ/BfGn9PBfEDLqa/XjJxlcwmGTiEoVcpkyxksOKIHGTwR/ByBaDkbB9r8xZCqXg5
	 70kCvjSfoUe1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939AF380CFFA;
	Sat,  8 Aug 2026 20:20:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: OMAP updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622045613.2748994.10251219104826834946.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:20:56 +0000
References: <7hbjbjjj7k.fsf@baylibre.com>
In-Reply-To: <7hbjbjjj7k.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Mon, 03 Aug 2026 08:51:27 -0700 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/dt-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: OMAP updates for v7.3
    https://git.kernel.org/soc/soc/c/52b1700b3004

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


