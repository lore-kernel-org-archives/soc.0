Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A8F4FECC6
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907832; cv=none; b=ZKgxcjSGSg9rqKjjDlCq+MkI4iWcSqRV74uB5CBHvfB90TqHOj2wPM4RNaOYvhEmEQwEWYA5PcQnbucYQkm+rp4hER8W7TpP8Ye6RvaLk2X2LwATBbjauM/gOnGbuJ1/Yn6shG83zFjLYmO/TEgEjmJ3ODEL193Jkot0JkTqHyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907832; c=relaxed/simple;
	bh=sCWTRE7XNZ6/QEAIUm0eTl9IFCElJU0M6v8l6WcGPYA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=d0m2dQVPYKaC5YaZivWFDsyUc+3PlJTot5qdzfRfcWb2tbRu8ZKF5OdTnDz0GT0zALoblkGzwmwCBAf8LHy6MA/o897gdFTfeP/R9SMUcloou1KKafQSseTqBm2MyexguOI3JBXz1p+yKbiTu/sxbHdF5kXRVRTw1EVQrFBt3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uaa95oJH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uaa95oJH"
Received: by smtp.kernel.org (Postfix)
	id D2A621F00893; Tue, 13 Oct 2026 16:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2071F000FF;
	Tue, 13 Oct 2026 16:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907831;
	bh=8TbaiyRUHUqnzA5a8+xsoKDU328FCZre4EONaCxLDKA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Uaa95oJHbq8u6R65KvDBcr9qLZutZQb6G/iqv9vOKJy0SET+d2pVwWuHR99xjFPvS
	 sVE8we8WdwamBPMzO9wqJmx1KB/JI4C1j+sIIribyvrGrhDTLhyOvtDdhBGQbnZIw8
	 FZDeR7q7eHz/xmgJzmJ2qwrA8S2++Zi01CF62yVAaeEGVYn2FoG0clIxf/LrwCWjjZ
	 sQ4E95Q7hP/dfNkUZr1kNOAjXnbAT/o3O+zapZUvJUqG7opPIpCvcJeC8b5ZJZMgfD
	 8YdeZx1jWfDfq4cnMrejnN+G0SIw8zZ34/ZUJPoJiBLYPqTPXkpz7zZtiyJUpfeHL5
	 1ea8RqpNkFm8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B432939D5FD8;
	Tue, 13 Oct 2026 16:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] samsung: drivers for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190783026.417156.8120385305048095545.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:30 +0000
References: <20261005101845.34752-5-krzk@kernel.org>
In-Reply-To: <20261005101845.34752-5-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  5 Oct 2026 12:18:44 +0200 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] samsung: drivers for v7.4
    https://git.kernel.org/soc/soc/c/ff5091590ed5
  - [GIT,PULL,2/4] arm64: dts: samsung: for v7.4
    (no matching commit)
  - [GIT,PULL,3/4] ARM: dts: samsung: for v7.4
    (no matching commit)
  - [GIT,PULL,4/4] ARM: samsung: mach for v7.4
    https://git.kernel.org/soc/soc/c/f32069625524

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


