Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE3A1EE03C
	for <soc@lists.linux.dev>; Thu, 20 Feb 2025 21:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740087926; cv=none; b=pieMmvmMS7nrWUNv7/lhpjkow4IH0nJ2LfLe3kbL4pdTBS7NSwuoNMDpNjMQ6raj0B//LqWWi4B0Try8/Hxjd3V7Wiinc/zqcxsAlSrFKIJVNc1vaW9it/Cg2qqzNZ49szB9Mods1SUVhEeGSK2AMVmbsT4UW6dTMKYR24Deu5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740087926; c=relaxed/simple;
	bh=Ch/G4B9nairMefsdEhR2Klc0us6gIvHWjd5+qlEpSlw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZZCBDviYZVz8v7TsU3mfjqoJPCAglFpVuTQiW/KYKaLN0bf+oR0/x1QVTAjKNBfm7ciOmEhdNQ0kq9MS2gtn8t29DMzGzcfc6DxaxPxCUH6WHb/koIVRF+VyVGjYz00seqEgywPoXnq3IUDh6VzDWiF5uWjG6Ds4wQ7r08XfIlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XmOD3EiO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmOD3EiO"
Received: by smtp.kernel.org (Postfix)
	id 93F3DC4CEE8; Thu, 20 Feb 2025 21:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CA6C4CED1;
	Thu, 20 Feb 2025 21:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740087925;
	bh=Ch/G4B9nairMefsdEhR2Klc0us6gIvHWjd5+qlEpSlw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XmOD3EiOQ4r87Bofj32vK526xV28FTDPciSjDJgYO3htekJPYPkxrQ5vtKQJlg1zh
	 x6c6jTwvfPXzPiPXkI20Ztg27Efb6ZNqTYB7alQO8fOdfeIkoWn3TO6qFKzoS9trgg
	 YaH14thewhwaF4kv7ci6TuvCKrkBaBpfoSwZqs4xwI/Vl9HTeNi/vpp+oMHJKi70zB
	 F4a0/rN5hfAFJEUZliCCollwGGmo/y9EDm2e2r4aYhoBSE5MP9ndELquexdh8wHT+B
	 T9QGmppvJvOJkgUNRgUiuL1jnUG+m4yst4FTm7I6RPNlPHzVZ155YPMqFetBPsDDmm
	 wxbO/+LkvngUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71372380CEE2;
	Thu, 20 Feb 2025 21:45:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] soc: loongson: loongson2_guts: Add check for
 devm_kstrdup()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174008795627.1465804.10808188769814833766.git-patchwork-notify@kernel.org>
Date: Thu, 20 Feb 2025 21:45:56 +0000
References: <20250220081714.2676828-1-haoxiang_li2024@163.com>
In-Reply-To: <20250220081714.2676828-1-haoxiang_li2024@163.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 20 Feb 2025 16:17:14 +0800 you wrote:
> Add check for the return value of devm_kstrdup() in
> loongson2_guts_probe() to catch potential exception.
> 
> Fixes: b82621ac8450 ("soc: loongson: add GUTS driver for loongson-2 platforms")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> 
> [...]

Here is the summary with links:
  - [v2] soc: loongson: loongson2_guts: Add check for devm_kstrdup()
    https://git.kernel.org/soc/soc/c/e31e3f6c0ce4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


