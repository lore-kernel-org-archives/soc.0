Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AB41DF72C
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756534; cv=none; b=chNfLMEsbOlQ+Hbxb2DoHeMDZzBIk0QnzgvO17uEU0SpLN3tsQK8ZH/DCmX8JBR/AbKiT5NKfRyxl3bUoelFLnD+NBu4oE5RxluCiA3KWHwc2kbTnlANuueNKi77Yx0cOanPF0sXzk/WoI3m7WoLt7Xh++QnSNIFEhIOfycpTj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756534; c=relaxed/simple;
	bh=feusy6bJLHtNTTuR23aPCc0zpeYiyydM22AZ+2Fxpv0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MDnlu7NFrFWm3L2KlPFJNxottBDSAXwP3iIid5AK/kqk/YmNJq/BvJ3Zf3pWuKexmP55YMtVafnqZyYmbW2o/E05wU05FlShWAmLg5sOMtrp9fh/H3l3PqWwo2i3x1xhnb6pQKTLAWQLJJL/t8UJ9MUYRT8wZs/0Mv+vHP4HkMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXAJAMf9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXAJAMf9"
Received: by smtp.kernel.org (Postfix)
	id F2281C116C6; Fri, 21 Nov 2025 20:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA56C4CEF1;
	Fri, 21 Nov 2025 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756533;
	bh=feusy6bJLHtNTTuR23aPCc0zpeYiyydM22AZ+2Fxpv0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GXAJAMf9L9+DBrt2oom2EeFaAN2Kvhl/4clLW/yQ8YRGd9aNtgWk7UaS4NTRYrn6t
	 1rAUVPqgqnB/K8gvGi/c0CRVxuZbl4QJkPxaGNOof1gIfats6oQzT9MJbOGkGevpfY
	 Ven6qWPKW2PGTUVjmjB3ASFu1FqP+NFkIepjMclW8tnLeQr0Fui+btmYmvfjGeWTZ/
	 tXcYHicFdh/Z1N9pkuNezXJ5JUnLPwZ1eb0PXR3rG1L/XL6s18eO8hMlrsYN8HhpTw
	 UcKof2dcVZUMLxkENWpHuzyP3Hd/PgH6m3vkBwUBsmit80UMOznHfoDrzCrQBcQeQb
	 Ct0RMaAEvIAFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE123A78A68;
	Fri, 21 Nov 2025 20:21:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.19 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375649824.2571237.8267228365090222206.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:38 +0000
References: <2311720.Mh6RI2rZIc@phil>
In-Reply-To: <2311720.Mh6RI2rZIc@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 23:22:37 +0100 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.19 #1
    https://git.kernel.org/soc/soc/c/d7eebe1098c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


