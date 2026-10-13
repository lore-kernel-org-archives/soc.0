Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E51523E33D
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907825; cv=none; b=IhTZOcz/DjQXpm05ue+F5uPDnznokKIS07yLQf1EXqLCgRblleRAfYqR5xFmXK9rMKem4itnrHaZNGPmGshOE+XgiFkY43urSCVmO54VBakPahs5fm2BLjML8F47wm02qvDhBHnoRY/5r87fzClCJE4dZAV0f5BGiAtPlDJ5wME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907825; c=relaxed/simple;
	bh=3qFMwFjW4uY5ePoztQpZgzTXv9k3pbPDcpOFizDYkqs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VDyFJ9zJDj9srlYBVWT97O0URgaSIsmmzZd5/vgPVrmL9yrQU1OWHelSvbrxplrWciZpfvmQojCnplaL5A5rTM3ao+9D/QmuB8/s9s/jTPrF6WN4U9BG6kMmPQPMswxIjXeptJ7RB8Cv2dQNqQCLwPsNMhJd302F+eegypjBO30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdU4mh26; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdU4mh26"
Received: by smtp.kernel.org (Postfix)
	id 59E111F00898; Tue, 13 Oct 2026 16:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431411F000FF;
	Tue, 13 Oct 2026 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907824;
	bh=zmjCXMax2NSJb5VpE8Z7pnbK1EF77YOoMSfK+oAhTTo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jdU4mh26+MhvKJhMs/8S6HxzgdAd2YS3BTBq2bDRQEFqQWXmCKGVqbF5YjFsG6zyH
	 zQwgm3TfSCRZ5LLWUBBXSUzWFxLFji334Ha6WcIl5iwUyWaM+GTHA4CAGO7slPbWlc
	 DN4E6CFgeaglkOdwjuizEinXPg1MKDjc/NgPbESDxZ0TqbGDujTjLvNuHBC0cNxIDm
	 m5+fmAMEbE/BylAgwejK6WVgmCL6OgzYzWt/U4Bgc6/aLNDvd1xh3i8pr2M6TrJeye
	 j6URUlCdn3szy8fmfawFN0EvwbIHjjxpT5KsCVm+h79i+aY6+WC++UT9taLTefK0Zc
	 Zs3U8qq9o68Hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2A739D5FD8;
	Tue, 13 Oct 2026 16:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v7.4 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190782276.417156.15049202389295536752.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:22 +0000
References: <87tsn16wqf.fsf@BLaptop.bootlin.com>
In-Reply-To: <87tsn16wqf.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 04 Oct 2026 22:23:36 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v7.4.
> 
> Gregory
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v7.4 (#1)
    https://git.kernel.org/soc/soc/c/465c85f96400

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


