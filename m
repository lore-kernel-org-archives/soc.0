Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017624;
	b=4gjLDf00cXwGPjAJMsSRuhno9xJeNJuVLibRVDx9CLhns4mg5hhgBSMumzvNwutn0LIH
	 5CE/aFm240YGWcUVFvROTRwIdyUlUASVzfLn/hW8KwBchNTto95ERPbjutzxMnk0b6zKl
	 pZLj1LESDHfSm+stoRD26Z6r9WWGxapCV+aP4qtvacXAgioRt5RYu4ncGCG2DIY/Z4Puh
	 v7eEZ1WrLy/jRzU3PRWJwr21bYVmRyWyMnHr7boNT3RBz2IKJzRlQB/Reuu17Guf657Hc
	 bq9EcKqLKA0WEV8vhvTjT9fH6O/feEwjSFllB9nylr66ko4aJde19AO6eXSiMCW61vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017624;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=i8x5YawnEbRLvzNk/+UQhLqNbO1wXLpxM/nn+/ySnfg=;
	b=sblnopC/KcnOIGeC+OCWZLZZLUjzJ6fxZfV1P4Bj7Bm2Qpc3tnVca9y5kXIhrGTfEoP7
	 DLpvIMvvrL7qtPt7EG3n4+ulGLCORWIEg6DCCvMtuU96Txp4/u5o5Sbej5DO93GfEFlXJ
	 HWbs5dBNxiZnMVLcMC4cWXAlbjL+jAZLeBFatsF7d8jfx3Ca0dyAwZ3EPXoCq7H3cFGqr
	 jqruuwuDsmnfYfKQAYXOE8lLkstaBC5v6CrJt3dqO0ges8ABYwB05kQO9uT5A/OyBTi2i
	 /Ppa1DCD041UU6z6LdOlwKVWTD8bqyC9oAgS8iu0YFOWwOOEWM6JgdQqE4BuyWQZwew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLTtvkob;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF42260A2600
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLTtvkob
Received: by smtp.kernel.org (Postfix)
	id D238F1F000C6; Wed, 18 Nov 2026 16:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCBA1F000C5;
	Wed, 18 Nov 2026 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017624;
	bh=i8x5YawnEbRLvzNk/+UQhLqNbO1wXLpxM/nn+/ySnfg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TLTtvkobSiA7x28wxkguCjz9s3hdOjkQPkY6DsomuxdvNRKpuF1lKCNxBTITkLFnn
	 UummXIAPBHdl8mI1S2diyG5v1h95eTZ/X1FasPgnyZTSbfG+aDVUQCsf+GoAHL68Xo
	 5/JUto+R6/NW4vlFQvzcrsSrccmE0ss4PZ/WiKAVYDvnnbMyj6afMzMkr4PQfLH7Dj
	 /UNzVuWf0D/Gpx+9DMplwqR4BvhM7fIODuuv/yVHq9HmRzcoghr0aiTGEMYdMS7HNJ
	 MvB50TPdM6s6covor4DFBoJrnU4MxqsJl8Yus/w13G2o70yA1DdlL4Lt0xxOKpu15M
	 7C8A9/KDxcjKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44153808210;
	Wed, 18 Nov 2026 16:00:24 +0000 (UTC)
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
Subject: Re: [GIT PULL] Renesas SoC fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501762327.1802028.5885945973852692764.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:23 +0000
References: <cover.1793960114.git.geert+renesas@glider.be>
In-Reply-To: <cover.1793960114.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Nov 2026 11:17:50 +0100 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.4
    https://git.kernel.org/soc/soc/c/f1a003d0141c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


