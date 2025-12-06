Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9810627815E;
	Sat,  6 Dec 2025 02:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764986619; cv=none; b=us4MwgSvt2zboPcLwNm7yCiJvBsTQhiwLLnRnMItbdNTkYmzyfCYdo4SCP+lb6vuYSlK4KrxO/6j5X1IUmNO/iCqiQs7a1ewrw1hJHJ2LxFASVqgL3Zn3LvSKCQuKQ5jnZF3v3E85Paj6MmQWnYd4KrJhAva2GpX0giKq5u3Kkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764986619; c=relaxed/simple;
	bh=aGGp/lX1t1Lk68pVkOmI689SPn+RS9weCv6GtkPCftc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=medRJmTWWgFH5+8mjSHNu6+2lxR9twTaFDsSNK+PlmRdCsNeUESY4Zi1UsRk5kaBy83tbBT7e1oM17bUqO+XIDT+fhxkyO66D6dyHTEzK77v07nZjF9BF7GinKyI0BxqRZySmbX4dT7xi/Qm3URSi6StsnJJ76qpPVQ9rTTF2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJjHp5Kz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJjHp5Kz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCF7C116C6;
	Sat,  6 Dec 2025 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986619;
	bh=aGGp/lX1t1Lk68pVkOmI689SPn+RS9weCv6GtkPCftc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EJjHp5KzsndRR3R94eVPFwkkgLd9ASZF1AV3EJ4YMugZr/IO7dDh7J2Cn2CyTHfAH
	 1m3ikdIuy99q+6TTKN7HJJdBTT7oTp9rbgW2jYbfyWFAC0BM8+nwEd4V5QidnFJwRu
	 YRZAwaqEc5who2TZrEMK7JiR63ELcd+QP9vNp6RM6L6iApw4YBJZC6lnHrmuaO8YP9
	 bMRPJg5/6xY9ePNYpLCFvBUIs5x2aVAqXLeedgcd2iyrdW9r8Vej1AqtrVgX9/7lpV
	 df23W2uI06rxLU/8JHWAPr4QpnL9adDG6EMaQDJmPJ2JgE2Kf6WxzphDPlM4mK8CBx
	 XjFTwApVg24IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2AFC73808201;
	Sat,  6 Dec 2025 02:00:38 +0000 (UTC)
Subject: Re: [GIT PULL 6/6] soc: driver updates for 6.19, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <16f9deb7-8717-4983-99b7-91a6e84eb560@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <16f9deb7-8717-4983-99b7-91a6e84eb560@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <16f9deb7-8717-4983-99b7-91a6e84eb560@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.19-2
X-PR-Tracked-Commit-Id: 68f9bbf4dfc356ccc6586ba6e7dd79576c48f7f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 11efc1cb7016e300047822fd60e0f4b4158bd56d
Message-Id: <176498643691.1925836.6118525304815513749.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:36 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 05 Dec 2025 19:33:21 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/11efc1cb7016e300047822fd60e0f4b4158bd56d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
