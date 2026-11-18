Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019412;
	b=IhS1Oxm+T76uCrt+eLDp/11N318isvnepglck05wgVnM7k8niiuVtTBd8J5yIw5ql12Q
	 aYucnVXvTPQVuo3ly6EHpD8rgYtO1AdbQUIGXJgKh1z9qf14Uzfgf2sgHhIamKu7F8srS
	 NHu479dqTOXn3/sHTvLcw84YIXWagQv+JxAS/QRul3sy5cc++m0l4y//SCRJk2Ky7j72g
	 LjJkAEW4rs0tvHXMS/sbelwstryJoZ2jvMjkFa4M7eF/gfUVtxb9IB/8nO7k8ln7p5wA3
	 hTKNglN5Jy1MmeXq4Td/wAnPiS8hxK3W/ApU4Np0IOGMU62Cif/DqTtI4+44imYzWmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019412;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=1Aye9ayN0z8yDHD1qFsp4UmSa8MX258Th50ulx97SNs=;
	b=Ra1eF5UWoY5JAMKjJBOLzyOjcRYcyqzJ6QyAR3qkaEYaht95nq23YECwsqYcP6wrOz7r
	 gO/ZPxYu17LKlxMXbEvOh+mDAyZsG3jGkAC2q+TE3pL1zO/PQrPAbk2wqM18b8AfIIZ3i
	 efMxU22S1tmB7xQ+FQNOCNv2sCb8rKb07lLdwD1ttpadKuZ06it4FRyNgEkdUICUs4DIg
	 qfMgomDSeeS07I8IseJav7LD61rZ8hrxfIuW8FMsncpFt5Ja5uaB15OccLGJLbYpsRukm
	 ogHkz6Q2KS1bzNepZeEPvNtUWIQhZhNACj2ALEp2AT7GDjSh/wUnIa1WJ01Q9/nEwuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWrRLvU7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53C860A2621
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWrRLvU7
Received: by smtp.kernel.org (Postfix)
	id D91E21F00ADF; Wed, 18 Nov 2026 16:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAEC1F01573;
	Wed, 18 Nov 2026 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019411;
	bh=1Aye9ayN0z8yDHD1qFsp4UmSa8MX258Th50ulx97SNs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HWrRLvU7vF7+jXzyPMbG8+jkqeHFh7JCrIKKqF/uatw1Y6Ni3rEc94DYm/pm3NHjW
	 oXgFOz7n/T/BeobeFzrb2h9Ov15hz/GTc6nBtETNWSm9KiTLBl3HpgfKUzNiy548oH
	 GEyWRGJQnJ/goiUlnBN0k5LTNd+/gRugRIy8fYEJza1JhgbWJjjsZFA2ZoLwlRcHkr
	 85HDWt93hqeXJKy63le8/DbXXpeUOjPusp8GGhCksnF9/od5nqDbWwvMoUgDL4IF8j
	 ktpCvVoJsLcc8cEQ6HLi4sSni/n3abBL3mP+O7aGorajYpIB3HCMWZzqk+ZNyqlANZ
	 iLgyOzZkVEupA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43EB3808210;
	Wed, 18 Nov 2026 16:30:11 +0000 (UTC)
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
Subject: Re: [PATCH v2] arm64: defconfig: drop four symbols that no longer
 exist
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501941052.1837438.2145000799734629536.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:30:10 +0000
References: <20261111220718.2586239-1-takano32@gmail.com>
In-Reply-To: <20261111220718.2586239-1-takano32@gmail.com>
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 11 Nov 2026 22:07:18 +0000 you wrote:
> None of these symbols exists any more; the lines are left over from the
> removal of the options they name:
> 
>   NFS_V4_1                  folded into NFS_V4 (7537db24806f)
>   SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62)
>   NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4)
>   SCHED_DEBUG               option removed     (b52173065e0a)
> 
> [...]

Here is the summary with links:
  - [v2] arm64: defconfig: drop four symbols that no longer exist
    https://git.kernel.org/soc/soc/c/866c6b48b700

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


