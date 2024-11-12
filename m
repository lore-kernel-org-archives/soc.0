Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C347A1FC7FF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424979; cv=none; b=aGrdVQZHHrdoxGpZeaQtv2lSvSyb6/o2UZ+cj+KMUYTk1suKNqbH/rt6rfP9jICXEdgTkyhrU+n0faKcP9aLkP/dtQqjy5+9Akq12FnbN6hmUnv+WLSoQzNjwY1RH748eWhleiqKpwKVDHY6vIz/W/EhL/IJUi6jstnB88SUmts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424979; c=relaxed/simple;
	bh=wbpnnbpcAsm09QlhmsTSnW6jLuHGorJ5jNn+lrp3fGg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X2p76/bwwtbMKiGFrNAIGCHTCPzV/DP7Nwm3eMne8h61sWDuw8ICJGwAr5RZwIgVxzcSjwevOuVZLf/WBSXqeelnLXaZGxrOf59Io8IfJzLhZJVasA1LZZbsjGr9lvII5yj4APH8CekBsWd5tm2rcje3bKoYTuuSYroeGocaITw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7hZSwHx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7hZSwHx"
Received: by smtp.kernel.org (Postfix)
	id 5D454C4CED6; Tue, 12 Nov 2024 15:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46909C4CED0;
	Tue, 12 Nov 2024 15:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424979;
	bh=wbpnnbpcAsm09QlhmsTSnW6jLuHGorJ5jNn+lrp3fGg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=W7hZSwHxM5g+iEm8aWY8gTmn+PeCdZFErgkRZkeQrRYRs7m8dCZbzXMvdycze8p4A
	 Q/+/xi9jOYWZsN2JCDvzD8CM3mePMBrSyeqqz9awCG3CoKDsgtNxaHgPxSbz5inWYY
	 D5voppm0/t2xtJ7lwrE4EluI6DuBN2NZbXUQ8uFzDdbgZfn+Qe9xUXhlkCE8sAqYQ2
	 e6VajVtVx/NL50NQP9xiLitOR4kfY+Rb+LNyPKHgqyYtHdmMTruKtswg4ncZqwEUqp
	 xWWAZayu2bxS/4nhgQQ5Z1vzlm5F6PP8C2OoYIOIsUxLXBuC/TNwOOriq94rIWlMVh
	 NamJMA77QiKvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE54D3809A80;
	Tue, 12 Nov 2024 15:23:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Rename variable holding
 GPIO line names
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142498923.562452.730592103021373764.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:09 +0000
References: <20241111121945.14217-1-kabel@kernel.org>
In-Reply-To: <20241111121945.14217-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Nov 2024 13:19:45 +0100 you wrote:
> Rename the `omnia_mcu_gpio_templates` variable to
> `omnia_mcu_gpio_names`. The array contained templates for the names
> during the development of the driver, but the template prefix `gpio%u.`
> was dropped before the driver was merged, since this functionality was
> broken in gpiolib.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> 
> [...]

Here is the summary with links:
  - platform: cznic: turris-omnia-mcu: Rename variable holding GPIO line names
    https://git.kernel.org/soc/soc/c/f335e0157717

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


