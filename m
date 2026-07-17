Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4FB429825
	for <soc@lists.linux.dev>; Fri, 17 Jul 2026 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298036; cv=none; b=UF5eDas8ymwaaLbDez4nWkiZWpnsJC0scbfndq2OztAXZDgs//sZEKA550OdrXXLD07z2W0W0wka4k3EcuWelqmeOH8LqL9lh7eTTS128WmwvULsB31bMKnDNcefX9unNt+es8p1qYrwuxeeJ165NiH+GZLKum15i0OhLS6d8t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298036; c=relaxed/simple;
	bh=gZ/dvDwaW8alQnRyWa2d9HUhIbDCXyaAj2j9fTLlq9g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=T6JAAZiPbs9ngogGMfqEo7CEc8CK8aEFJOZ4PvfjjEnDZYhB9nZXTcrR51WgMdHX/VXytmtwAAJR6oIq/xTeuXSxEazloGy4iinv5oU9vZjS4q2EwQjfxFyOS12+T4kK4bXoC/6m6FeRGBFNfAIpJSmoC77iqUfny+ZM/a0M0YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMKIkA6t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMKIkA6t"
Received: by smtp.kernel.org (Postfix)
	id 8208B1F00A3A; Fri, 17 Jul 2026 14:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF221F000E9;
	Fri, 17 Jul 2026 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784298035;
	bh=bzX7ivFm5mD9t3zjkRvZ3pyrwaiJX36+gUZobxzBhZw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XMKIkA6tK7lPS2S7mQv3o9sHWwhr5quQrk/Cu5yOlm1EGD0jKXZ9PCiaYZShRzy5D
	 inSYrriHDR++uqTe2ppia2cj/WTn+qMlkbceYFiSOjBLUvV0usDnTY81DeDe6+/C3m
	 y1Hc22dauinUqT4nv4Ne96ZxbSCVJa9jPlti2Q46iB1v6KesvSlOBLiobZFLVLJZpZ
	 +tuMmja3d191l1rIY0piUBEmNNdc44032M4c88dYLyKoE5N/9/cUFwjC37NvwuUZtd
	 ksiQdtHL+r+4B0O82y4l1zUtROL6yPUs1xPRwnOdvaSqpS9NGyKmcRd2KXFmbGlXTZ
	 yImqIpm+n2VWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197EA380CEE7;
	Fri, 17 Jul 2026 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL]  Renesas SoC fixes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178429800763.1738088.11893791315089506143.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jul 2026 14:20:07 +0000
References: <cover.1784193843.git.geert+renesas@glider.be>
In-Reply-To: <cover.1784193843.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Jul 2026 11:30:40 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.2
    https://git.kernel.org/soc/soc/c/3d9855d114f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


