Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD83B47D7
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911255; cv=none; b=IZSsAYgRvuCfT4zEphR9PQgDb3eBhnItVbF1mjbwedWqn6g88I8+oYhyWIH0oo8LUhMt6VhIbKRE8fjCAgAZxtvHAK1fDi9U8QExPmhWXS7iv6oFYfE9Nf+DgRy8578PKuoTqaLjf87i0pDVSToNT0clulULA9GDoAI/haqooO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911255; c=relaxed/simple;
	bh=hodirMpKIr3RKPEA+A3xik5h3r47yeaLxiqqGyp8fEU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Y3DegnTeY6WyJhcaTlBGjixZOpRorl8NJuRRuKKIZgJlKfI5mlNunutkHU6Nr5HDwPVNwbfM/ONUN6cFTvgUhgqoZzSUwXPpkQFpXFlOCC0EH2GhMAgEap/oD4hToIuveapPDOnuSeW7c/1HEBAHhyBrUEG2oteEd1hFCBrqeF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzI+8Vjx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzI+8Vjx"
Received: by smtp.kernel.org (Postfix)
	id D9AF81F00A3E; Fri, 24 Jul 2026 16:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30881F00A3D;
	Fri, 24 Jul 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911253;
	bh=DyKNnzXuy2Xqle7rWlb/2/DMph5smjZR6OtyA4mVC0g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AzI+8VjxIe1KsR6j0zZusWQ4P1auXHfiLES2ylCsK5k+GWuMUz0W5W+ggr9ddJ1du
	 hShCkgdHQ0VpeVPCzGwCu8wmUMDqrGFu/nCDK9R3C7HqQhNowj++Kq4fFA6YzPid/s
	 fDFZ7CU19a7oilLOQxY/64WvvMzdt1dQiBGWzY4PCp6J56oC4+2OaeLnmHnt8Orfq7
	 D2essU+ujnWdRz+HG3PpV+tWRbKM2ntw6hhB+SWEoLShQyaeh4Ijk/RAzSVjpRW5Ir
	 K4bHFh+z/RW2idYZrvvJieCeR2fzl+4Vz4Dcp3Kcp/6EtwTC2SgvdC950rPOysKAim
	 uE6ycwOnwF0ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569E639263A5;
	Fri, 24 Jul 2026 16:40:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491122088.3229915.5208186881422638041.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:20 +0000
References: <cover.1784194401.git.geert+renesas@glider.be>
In-Reply-To: <cover.1784194401.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Jul 2026 12:03:40 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v7.3.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM SoC updates for v7.3
    https://git.kernel.org/soc/soc/c/044c20254f72
  - [GIT,PULL,2/3] Renesas driver updates for v7.3
    https://git.kernel.org/soc/soc/c/6bbf8038f8ca
  - [GIT,PULL,3/3] Renesas DTS updates for v7.3
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


