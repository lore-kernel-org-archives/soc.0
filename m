Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571373;
	b=qChwMO+w574u+d33qnbiyKZXQKwv+rlWPJs/TQosOHDFdNXs5NmZmMqBj8DJVn3LMa5J
	 m6ANOaogyi1l4lMFXTrwlhTMQXhHSfrYt5j5fObUe8ZUNtyBrB11vf7D8N4xloa570C80
	 Jtn8G9nB40RGxW09W23kU/u8w8AdLBg8NvbbdVy6pL300as1tKNd6nLpd08e8SCeB++V7
	 n36npD5vmKR90q9yEmBFEzWrbjxR9vdz2/xDSJ8NkVauwL3zij3yJAX6CRYcMf3cV0h8d
	 yhf3gG4wfBnhk+y4f2rmf5JFlqehbAhRvTcOV+4DgANApyDngRDuhCGXnkxl+aFdeuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571373;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=giZGJrmJ+qacYqxmdFZFyw17xIbuZvWJpSr/F67UmNM=;
	b=cvw4RnPiV9d2KqFOz756OWPrtM4uWZBMcXO62n8i16jWZ0PoayTh+C+Yw7Frt0qGQhFb
	 9ux4+DwFQdsIzoem2wHbfR95MDr/bFLcaDDn4HRVNsFYkWEGmhG2jjiuTHESrruM0QvSj
	 4LFBmd9eJHzSATtvanu9O0eEjRQ0dtqNvSxrTzaXk2AtrPtLGsY23W2LR7QCAomrEuI6K
	 m5Pidhxv1jS0a2O8y7DL0KXzKxQ5xrEPOExtY4WXqLzBjdPDef9RDgWCHKD4AGpIQXt6Z
	 vDlOOIp7xz8ZZ5tLdStyTbdyfERkjhcAlm4uHNHjqV+3ZydICA2A9i/EngFPgzrce3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jP10cT91;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA5360A2627
	for <soc@lists.linux.dev>; Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jP10cT91
Received: by smtp.kernel.org (Postfix)
	id 9DE7A1F00A1B; Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875131F000C1;
	Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571372;
	bh=giZGJrmJ+qacYqxmdFZFyw17xIbuZvWJpSr/F67UmNM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jP10cT91/z/TVGLS1LbXUmDx/BvBQNuhf30v2H4Hx5WDw1rP1N7tofXE15JkcGK85
	 TY4ZvR/OPuuJQ90O3Wygg4v8bQQ0ahkmCONct0gECzbDiWFDPOkH3QXVEdwZEtJ4DN
	 RMt0JvJMQ87UevxMmtffQm2smJdP6NQ9domQ1VkvQBjypQmqgyJNxyKboUrCmj3Tcd
	 ictPzu9tMSImPCe91AaZmiopVLrfx+ViUgaMDgE+qS0XL3b8BJqBpztEM1PI7NBeY9
	 6IQKGPRlxlhF/HULLFO1uRyX/g9zjnp66sFOxLItIhI6Bn3ygRjxPMYbBEAL9VJHGF
	 TslbjOWCm0e4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D27038003B8;
	Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
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
Subject: Re: [GIT PULL][3/4] RISC-V soc drivers for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357137104.2624073.12690536548445042177.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:11 +0000
References: <20261013-glitter-lingo-dce2f8d724c9@spud>
In-Reply-To: <20261013-glitter-lingo-dce2f8d724c9@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Oct 2026 16:38:28 +0100 you wrote:
> Hey folks,
> 
> Diff here contains a lot of clock bindings, so I've provided an explanation
> in the tag.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,3/4] RISC-V soc drivers for v7.4
    https://git.kernel.org/riscv/c/b45ebc4a7cfa
  - [GIT,PULL,4/4] standalone cache drivers for v7.4
    https://git.kernel.org/riscv/c/655e6054acfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


