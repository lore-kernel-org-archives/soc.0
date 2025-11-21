Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3992D130B
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756549; cv=none; b=UU9P5Jhjj6ITmq3V9JnIxkJo6Lhhgh/lDpf4LVe2bXvCyjNzFDdsKLIF9jKTqiXUftr55o6oateW+Q+bTpluIMCADxWthFZYJmvvozkoNrKInPmS1CEzOGE0/Js00sHU0HVQjQZHCb59l2jpHQU09oN/g6neXbJue42aCOLjZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756549; c=relaxed/simple;
	bh=0aVXdXKX4ZdeNX9AaH5OLVPJ1QhQGIYT3r5tPRSmDNU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cPVop7QidGXhy/n3Ti6pS9HGKQrTTsrNyn+JLrqzRKWtYySlJX865E5cT0hSwi6jmjfN9ilIVlLiPHCMXxjx+cMKCHb6IoYi6XzXwv7o9OqpLsTWLip5W2IIC+FkEmmIWwQu7MMekLwjWudehTZo9UBA7Vzz7kT15BciOSklBMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFHmhu/l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFHmhu/l"
Received: by smtp.kernel.org (Postfix)
	id F166DC116C6; Fri, 21 Nov 2025 20:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB25C4CEF1;
	Fri, 21 Nov 2025 20:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756548;
	bh=0aVXdXKX4ZdeNX9AaH5OLVPJ1QhQGIYT3r5tPRSmDNU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nFHmhu/l7DIyfwPgvBI62C52Hv5fc9AKWfVyjtDTv7Xkas0Waz811138g/h6zjGBF
	 Gt9RdNMMcl3ZRV0SCocUQXb7uCZFv5/l51c0eDfh0kJRWo3NVr4I3/TbPl8NFUvkGj
	 mjeM/45erEn0AVCJbwnnHVX8amxJZpY09lz1owgNw/14tQOxzFUXJ9dF0JBKGj+HkP
	 fUILoiG0GCAgMF/YfkY810xdiYK4gJ60XC6NRYoDrfZg4Ol1RtCh83p0wRR0Qb5BqM
	 cmgC2QX37OgXlK8pUqL3j92dIxf6jE+EvpBCH51D/iuiXTUAhLtQ3Ca+E23vwpxU9U
	 nz9u96mNdZ3QA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD8E3A78A68;
	Fri, 21 Nov 2025 20:21:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner DT changes for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375651349.2571237.4756990931251900426.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:53 +0000
References: <aRmEvz0F1yVCgE-B@wens.tw>
In-Reply-To: <aRmEvz0F1yVCgE-B@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 16 Nov 2025 16:01:03 +0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner DT changes for 6.19
    https://git.kernel.org/soc/soc/c/e828dff381a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


