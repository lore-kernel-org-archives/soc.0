Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC873749EC
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037010; cv=none; b=VfNX5RRTJLgu6SeEkxIaiyjSXYBwspmOVmcCpQUT+CHc8ecCaqcvKSOt9QIre0H2ge+XKu2xngOmRukZ479+Mr+1KY1+1xwy4OGKoZ1k1qkPJ7u94yH3iITHtuHO50SyKHFCWjG/o/SZUWWzv+cIJwDeixp2PTbP7eQ+T8P0oOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037010; c=relaxed/simple;
	bh=ENxG2QVd+bl5pWJLzseG+93hmSEBZUW+i5ru0Lxtn6U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IldFoOcVuW8X8UVWIeomtaWhuezIkKcatogoEZ9QDEK5ts7RtC0kSo8IDcWBv+yYNm6VU4Gc8BHr2PHjOyPnXYxjC6xNSZLkUzpEyRl7vJLdxx+swG0+OVDn8bGLu9btBy8HCL0V1xUNLZfPc8Lulz3OtqJNcEiRgtcPAKBuBCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ds5vi2DE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ds5vi2DE"
Received: by smtp.kernel.org (Postfix)
	id 708361F00898; Tue,  9 Jun 2026 20:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593811F00893;
	Tue,  9 Jun 2026 20:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781037009;
	bh=a03OquDaYD/Q7d+dPkldsA0F0uI8CQe3gr6+EPJzSdY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ds5vi2DE7SPLjWsXWbFPVgvuOgUwRId/CpUEAC807VOXZKhmPToZIJ4wGFF2wIETW
	 Zbr9nO1XfrdFcb5zZCpHgEFtITfgrMYdUhwM/6b9d1+jAPlJWCnsEx4qj0oewANO1t
	 QLv3yCsuK4j7ZDeVCVkN+iyWyxgVwoQ2h68Sy79yNjwKScXGAwNLkWhE0JiKiG+uHS
	 5cxT/VOk5fVik/2Kq8XXLiBv/c9h5Nq6hJMQ5sT6csZi/gJqkbgm7FUiwQ+4gKj3sc
	 ZhOJQJUqJgNdCe1ogtlONBe98+CatxA5bmLZm7b45ZIT2wcFaPFFHdncV/0/kdA6uf
	 O7cX2wFkIX3OQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D097B3930A09;
	Tue,  9 Jun 2026 20:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: OMAP updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178103700738.2631762.5135162171324823724.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 20:30:07 +0000
References: <7hqzmhm54g.fsf@baylibre.com>
In-Reply-To: <7hqzmhm54g.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 08 Jun 2026 08:19:43 -0700 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.2/dt-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: OMAP updates for v7.2
    https://git.kernel.org/soc/soc/c/2ab5179ebb5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


