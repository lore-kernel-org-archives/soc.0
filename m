Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69363A8745
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352479; cv=none; b=VR4+6Y3NSpswXXaoIGi6ju7Pplv19L555XRc8DhwbFUpHYrJ94EL7SDD7QsVdOCkKs6Z5EWUTjin/RgT3D7DL2F4NG0yIAw4tU9Q7gvyKxczXb7FSnY4t9BYMlKk9PXjsQBZZuyAJnYu5bSZzW94zf8yQypGxf3a19MrUrDzFpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352479; c=relaxed/simple;
	bh=+a/EjvdvntFjYiLUlNZlP1SkZNg5UT9+Z+SHdfCP7zg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=vAEa5ijDIiYIRrDE8Dt0R3DHciFqe9NiTJWfSju58XDgFGqrhdjkM9O1VMNGpZ2F6klki500QBrmzjUwbSCXxL5hlo+FYdB3x7T1nFcZ8Z4+JHIO8ZheYpBxfIiGWBd/suLssU7GmdjddgFBM9FjB2x2edsHQKEIpqYtwKbwITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ovw+j+Mx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ovw+j+Mx"
Received: by smtp.kernel.org (Postfix)
	id C66421F00A3A; Mon, 10 Aug 2026 09:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFCE1F000E9;
	Mon, 10 Aug 2026 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352478;
	bh=yCbAsQYR7FZblcTG3F5KrQ/7PklnUh3r0koYUQDo/90=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ovw+j+Mx01VcRkKbNLmD6RNZO6tKcsy6xhhDV9h/FLRFsioGBNV/xqGgFaKOXSKB9
	 997E7QL1l4xkZ73hzIKazIpnBrnT6Kkbcfx82gsfmHCo5BOEmlgiTmo6YFXGH3YNd2
	 81QMz2FK2/Z389+cxzFUzjy2J2hCu+9OBL5vjAgab0yszUc+ykSOziVM4SaLx/fSoN
	 QgNk/o8FiIal/vblXGZJk4JTTlyq86DwEA3xRod2k+CAyCatDnx4Szx0F/mdcbXeIR
	 Qt97Cco4x5f9hMtQ4zc1rnTO3hMOr1k9flhfNfTmd+vXM9Pg0dj3V83V8BEJjgHYsD
	 B8fj24ZL8KsZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09863924FC2;
	Mon, 10 Aug 2026 09:00:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC driver changes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635243539.3658557.11768023560671109180.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:35 +0000
References: <20260807161840.6011-1-sven@kernel.org>
In-Reply-To: <20260807161840.6011-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  7 Aug 2026 18:18:34 +0200 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC driver changes for v7.3
    https://git.kernel.org/soc/soc/c/ec833fd504d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


