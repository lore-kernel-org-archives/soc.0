Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552808;
	b=lPCyFllolLJEJZWbVHdiMfP4hQOF9fDIhCEY1eIiklEdSIVYYYi67DDF2DyoR6AJb013
	 G3VPpzsMtI64nsVLPPaHu6HpVVzYZlLjrcMipQ+1awLvP1GPfnTbA00gBYaZd9huwDl/5
	 HPA5e9GC+J5JqtPtDIQXepY2zxKfHyINBNnojtO7icrXxVsV4t52SSxgaN7kINinjCMVm
	 CyHxFjvWinwY79TwE2DMzwfNbDai4fYvJaihvANeFhC0HhJoClDN/d3FWdxChiqN6Ai3q
	 Z9S2MleB8WHh21RPEBDzwKz+6ieM8uTvOfQ8/lhA9yKDPoXURyv4kbzqxjRI+x1e1Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552808;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=8H+Vta9HRfK20CYbGfXYaaqJ3I9sMUV8AXWzg6kveQs=;
	b=ABmiAv5qLK6bX+fF0bUGm3GxZBj6k35Kg3Ia2JDKorFJ0Nt4sLqp47sN34LHAmA9ybdE
	 oE0/U1b0I0p6HAbgHRH1jUTr/Dm1/e69PsNAhZ+r2g+xFdXXX5PQ7YBouDK4o5YP40QTw
	 w/K2jewqm8Wz4XWHVhw/3zMguH3iake/mf9/Y9t5NDzEJSoEIkWc+J6bOH/LhWKiwQ91b
	 ZEQ1s3Acx+g+bvKnVztypFiIVGOTa1WK5EHYclJcA6jLfTVPxR4eWMKF8RWXl9lDIQbGl
	 X2jDB8DYN8rZHvOWUg8w0FaLcGridRMzvF7cEx95GdN9Ghi1qE5+lcI8oGzYRD8Me+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXPV3+yp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6170606A31E
	for <soc@lists.linux.dev>; Tue, 24 Nov 2026 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXPV3+yp
Received: by smtp.kernel.org (Postfix)
	id 799D61F000E0; Tue, 24 Nov 2026 20:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078FA1F000C4;
	Tue, 24 Nov 2026 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795552808;
	bh=8H+Vta9HRfK20CYbGfXYaaqJ3I9sMUV8AXWzg6kveQs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OXPV3+yp00eZ7nRjGgeFntoWzPG18j5OygMCBsSuIeRM+5kdm1K6fUKsZ3Z9O7+kW
	 NXishtvA0rW92xLTYOjEH4RCCi6VBtMSVmUN2RW8m/LtLnUzHh6xYubYYEGJAg6fBo
	 thToTW7YNkIU4Uyn3OVmRjIrwUpTbbikZYm3roQwuj/rQcF23fQJlZDd/xwVQq1IZO
	 tFX5Nn969Qm7vJ0FZ5De+/MXBCzFkdYGJB9mXGQAw9BhQ1MJYEY0xFU0NM8i0VLOeW
	 eOr4mUgPzNs52yBNVUMGRzBZyVndyjxemcKiEwlN52vtdh1UNWUDaHArvFjJDiXxe0
	 Tj92jd3Sp068Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F162C3808209;
	Tue, 24 Nov 2026 20:40:07 +0000 (UTC)
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
Subject: Re: [GIT PULL] STM32 DT fixes for v7.4 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179555280651.41195.9730114024069202330.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 20:40:06 +0000
References: <7acd50d1-fe84-4c30-bdd5-11f67d7fdb1c@foss.st.com>
In-Reply-To: <7acd50d1-fe84-4c30-bdd5-11f67d7fdb1c@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Nov 2026 17:06:52 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT fixes for v7.4 cycle.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT fixes for v7.4 #1
    https://git.kernel.org/soc/soc/c/30275e284469

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


