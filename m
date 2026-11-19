Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080607;
	b=3SgEsF7qi206JQJ6mRZ+fyzsppWVD9f5gT1lAFdQPCSFcPQBzb7B504VzdEAErf2dFOG
	 CRJrvHVy9zFpvPfWp1c5bdcdECM20xhesGPQTEUJ21WJJcg8VwAvIhYxSP6bbg1fFCPSS
	 FZ15guxIQ2SolBcsamnCCS878/gJHhwLOzdirF2makxMZq400ZHL/Q/gCv8xvm152a5Al
	 ryiU546ukQ8WXXJxJ7l7xPCs0O948wE1avppWhQBO2Qlzgvavs4bnxjmJ2mHKGkq6exAE
	 hkhvRAqyZ548yjkvxH6rtOCG3LqQiRv6p2og5ziLzs8QEfeyKiQH7rOtRODFtcaTGaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080607;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=2mnrNPLNP3NWLpv/ODEg85LVblhrBXXiuQKB52LB5OM=;
	b=ne3filrI6bg3Vhk9Biwj3CPpeB1RgFJMgDf7jvZ4r/NcVXRqb1/pEWeizXgeTASmTFU7
	 3dtpvxnfWOqe4cHkpVyQl4SAzjqHfE1MVd2YCyXLqF8V+RepU5rasyUkZW/Fo2aTdu0wM
	 XDK1WJ6ElHZiVlxK3wze/PwvhkkevJ2n26wv4R56Wuj1NY/dWOTf3k1yKktjO2dbuyQ96
	 OdP4xYO11jbqDu+mtqHo8LmfQWnlSbpq4QPxDQpl+xUUGfmg6zEHVTCYKxeqgKcPoI3JX
	 hoavJZAozdQz7CvC84mvHY0KVjR/QGVakQbodtnd5SZf/Mbdt1bNUPz8ZDCJKFrpLLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhJDVTjz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E221B606A325
	for <soc@lists.linux.dev>; Thu, 19 Nov 2026 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhJDVTjz
Received: by smtp.kernel.org (Postfix)
	id D45971F000C8; Thu, 19 Nov 2026 09:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1F41F000C4;
	Thu, 19 Nov 2026 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080606;
	bh=2mnrNPLNP3NWLpv/ODEg85LVblhrBXXiuQKB52LB5OM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NhJDVTjztISpC/xshQrf+mvGRBanevMTbZ7YJf4OG6Khcl9BL3GoSQDgahy8eY+fk
	 GgmoRJw6dYII4bhJJlXtu/bkC6dND8PAckih+ZCZySSkhpqKPrtx1xPNlWpvkaRA+b
	 5cTvrxiPcutjw1gJt5Et3EECO1g07Rt4OJhJlZU4gnn4UrN+++6JU1FdYEaxCWiyCU
	 /FIajUgwvX7G2BFNW1FcAtKt03UoCDTYj8Ae4X9hQgKBOA0zkkso5XjC22dIeqdKZl
	 c9ewn6uBtTqSasKu18v4tERavY8FA0nX/JygJSD7atnS6ue3DS6byK6pl51gLSjBtI
	 JAgsrq8p37FaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B42E83808210;
	Thu, 19 Nov 2026 09:30:06 +0000 (UTC)
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
Subject: Re: [GIT PULL] ARM: dts: zte: Declare zx297520v3 CRM device nodes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179508060553.2971054.2397464822072080564.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 09:30:05 +0000
References: <DkHOTiB7TW6tXJRTDczLjA@gmail.com>
In-Reply-To: <DkHOTiB7TW6tXJRTDczLjA@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer_=3Cstefandoesinger=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Nov 2026 00:31:28 +0300 you wrote:
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-dts-7.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: zte: Declare zx297520v3 CRM device nodes
    https://git.kernel.org/soc/soc/c/bc06179ef97a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


