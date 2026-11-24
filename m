Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552808;
	b=q/f9jWGgKgOnq7+fWjLIW8jihPg3eYUNkJfIVbsAqJquR3/e9yDKfSFadQ17VBZjWLWr
	 pjp1RUTxosViKxii7id+zYpmDWYrzH6e1vGCeMNe9uoHoGiVFePTNWY9e9e3JlUO3wppD
	 DjQWZ+GsTXlDOojiGfYGvjFj1oZzTHAZ+Qn5+pNiPvfkVf6SMauiBC3pc3xvEetdKmQap
	 OqS62l+lsQYGV7ZGfbRYjb5XXR6sID6Toow330zn8Hn+vjBJb46rEfFtd/bdRvDuOIhU2
	 7XsPrjhYEXw9ovyJh0SVl3YwLl+4LkbIinAFKuMALvYMihCqTYfFdQaWpRvoh8KeSxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552808;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=WfH5qw3WW5w43N9UAjCMjfNV0C1CHceJHxBYkswQXOg=;
	b=EoA0I1EEgwBwVjXoiQ0a6jns0INFlUgY2kcemmPOBISM7iddhOjzGsNPcTnLS03WnbMB
	 bRix37ijU1H+zRnQgjZK12nwhnCumD+wzXllBIOU0ohtporppsN/xMiaaxM7hT67SDEom
	 DFjqdrzXIsE+MeEVASjuUYuGMrqtjVkwqJ7XR0gKJ6jxxsZwK4fsHpgJv97/HLQT6ktVL
	 c6pcs+XFqdHdmtxOZjK5Lx+i6UQq7pKM7tKqkzXU297nIjlZ2HUjkxy5v5WgvDuKJ8Yts
	 MIT/8ZGS7IHBqcCRNr/zsIRrF3bBFFf6ZofNx9zcW1l+Ewp7LpFMq4fVfV5MBJJMIvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k11LECNM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008D7606A31E
	for <soc@lists.linux.dev>; Tue, 24 Nov 2026 20:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k11LECNM
Received: by smtp.kernel.org (Postfix)
	id A63CE1F000C0; Tue, 24 Nov 2026 20:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9FC1F000E0;
	Tue, 24 Nov 2026 20:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795552806;
	bh=WfH5qw3WW5w43N9UAjCMjfNV0C1CHceJHxBYkswQXOg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=k11LECNMjzjd0IYjkwFw2NoA91Zarub/wB5GVL3IVS72himSCRCidLUYWoP7foyMP
	 eTfyS5XwTZbx4vElbPdwDuzSADzEZxGMKKatJ/EOcUHGG8LJpGAZvDI2DloXYs1l0l
	 Rw2bQj6ms2/ih0DczfdcUPeQGCusCOz1gPcJXXkot5cp9lJV8I7hQIcXNYxOyqTYFd
	 IMwRU29gp4JQTHhaljTHNP1bUt1ZIR8saIcQJ2inAJFTbR8WQ1aVYz1LAE+tw+hBTT
	 tW3mLTHhhQtkXZ32Q8u2IyfekM6r/xwfYHHUA26z/3xS3kOqsomZ9fFPle1LifIvfL
	 /vdBZLUtARgAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774713808209;
	Tue, 24 Nov 2026 20:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179555280527.41195.2318200002848983425.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 20:40:05 +0000
References: <20261123161633.2530037-1-p.zabel@pengutronix.de>
In-Reply-To: <20261123161633.2530037-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 23 Nov 2026 17:16:33 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v7.4
    https://git.kernel.org/soc/soc/c/889dd44491b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


