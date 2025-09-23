Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139EC265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662480; cv=none; b=FZ+ZkhsYzSS+7F/QuHFhpHNuf8sV860rP6Y2rQEiGDwVelDYCcdp1Hd4hG8kkUbMYl44HEymM2q2ccHS7KXgWq5Sf+7hdJUWhD2FQLZsecdZq7URI1vor99QJyQk+cEb+s3fcLbboDKIysI7cdYkAnadKrWK2deJdW5Rf/dmFXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662480; c=relaxed/simple;
	bh=ZaoRuQIzl1l8sFZlp6oXme59Wq5YPGOxaDCnRS5HKRc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=o+F6SEF/qv96qnOQBD2paZ/xw01HcBvbfWWBQX2AuRagnfG4HjKS0aY19oImdFzznGcr2lLjCc3VFV2sW531mMmJzjSmZ60Hp1H646Rm26gZhbUCi/1J2QcE2sZX/69d7gMsmXQT27rt+wJsj8zS+P2zGLV1O3HgTTavcJgLAhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tz/7hg1D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tz/7hg1D"
Received: by smtp.kernel.org (Postfix)
	id 0A61CC4CEF7; Tue, 23 Sep 2025 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E930CC4CEF5;
	Tue, 23 Sep 2025 21:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662479;
	bh=ZaoRuQIzl1l8sFZlp6oXme59Wq5YPGOxaDCnRS5HKRc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Tz/7hg1Dx8xOgLFzFm9GBlkzUh+tQbtLENIdUsAvieZ4CkPpK3hWDPKZfKXrDYKzD
	 evZ7mV7m59IpRSxKKy0vn4GBNrF37hh4boawts171Wuy81pRcwc24EjC7Zivo7sytd
	 htpq7928k8crYz5IBdYTWJ7/sza/7WDwarFK9mEVvv1O1D01XoiSLzDjiJ5Pc6H3tb
	 Y9hgC/L5oGfOp0W5tZfH6DIVjsJX++BbwZGN6f7ggkHOGXHaQVPWoj+I8T4C8/sIWf
	 JGLcXsDk+7ucSnOnYmvAwQgNAWEQjw1hNzUhYo4QpLhmeRpuqu8g2TRbeKbpo8tvA0
	 H458IvbM4+mGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C3A39D0C20;
	Tue, 23 Sep 2025 21:21:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: microchip: soc for 6.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866247681.1926563.8531038066539361803.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:16 +0000
References: <20250916150328.27015-1-nicolas.ferre@microchip.com>
In-Reply-To: <20250916150328.27015-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 16 Sep 2025 17:03:28 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Dear arm-soc maintainers,
> 
> Here are the at91 soc changes for 6.18. They are move specific to at91 product
> line and are all related to PM code.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: microchip: soc for 6.18 #1
    https://git.kernel.org/soc/soc/c/1cdfe53d5798

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


