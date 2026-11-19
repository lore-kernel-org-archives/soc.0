Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080606;
	b=1OzEbZXjSHe2HPmkimut0YmAgN9yaSF1kHBya26bWvm97aVJqdF3rgCHpTa8iLd5Zk94
	 7Nuqn4pfjcmsY3Q2e2uj5e++fsgy/yYEBEGAFcCK32rcEbrNcaQTHHfI3FFRHEgUPW1D4
	 9gFJJnG9hpyBMleRp9SS7EtP5N9ToxgP0k3D/pWNj2nF7OGV4VLIaf130WmD121akFCH1
	 sHlKn/W7myTXUdpnb9DGhoaNUWy57pOo0k53PN9GDvFVny3XdTVof/lGv599GrPyE58N/
	 ww3c/yG5HixRE2QPEYLGN4Kgkzqr5MFS6O66pcnPS/uan2Kop+5cuX7jBEl0HSMfL6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080606;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 To:Cc;
	bh=TUag1ldW2aF+UJM3USRHCqF4gnFnb2h2t/WoqFhQ+LE=;
	b=Bl/1GMp8ZJS90uBzLHr8jCDQt2pyAEXdrwI2w/GDPtaTCEztxndbRIeDrEvVNQ0ovJVG
	 rKPwjw5XTD57WV+za5Ht4r9098egLClZ2/PzEzIt7ftvPw3yAf0LoNoMKGWLrKgl4BMuY
	 wAnBPJhOu9ge3rvUeimthCkFkaOjlm3grfH2eSUoJQW1tcw9RQ+LE7ltZ1Xq6ie9ID4EN
	 9clkAshSJFEklVnj9lDDjLe+8UnBuaLNzxwNkA+xTId9PSu7SON4mVwxl/UPr132t+EvI
	 EB2peGUU/toqYLbiqa0w7LaXwzTFiTMiCHsstowVz1M1RzxermIiQpAEida+PppTsiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mivn6KK6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0B7606A324
	for <soc@lists.linux.dev>; Thu, 19 Nov 2026 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mivn6KK6
Received: by smtp.kernel.org (Postfix)
	id B6B8A1F000C5; Thu, 19 Nov 2026 09:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F641F000C4
	for <soc@kernel.org>; Thu, 19 Nov 2026 09:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080605;
	bh=TUag1ldW2aF+UJM3USRHCqF4gnFnb2h2t/WoqFhQ+LE=;
	h=Subject:From:Date:To:Cc;
	b=mivn6KK66BYcQEL3xpigCStxj+b2Mn+dz/TJ8mpe2jMYLEq8t38tBl+YUC2hcfQe1
	 vVRlahg/t7AkiZYBbajceeRAmCPXnoeLqZt6MfEehzjKE+e+AkrlonZyJBKJwOWslT
	 q1A5Ek9AmXEnHicbnVdNKzRIiz+WLNzw7ZjQjYB92jE+5FSuk+DZi5B050P1z3ZAyF
	 6RpExOQecT+0Bz0m3isz+tvddWq2vOMT/ZjtfvGYlHwl6uFEz0I8j98dtLhYcIU88d
	 Ifzw9D2oVzP9A6sPa/IQFRGDLUhfACESKx6Bj90h6QXjiDbe2RbwwC2TYHrN7EDdD8
	 FQSvuJSyV7uwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 79B483808210;
	Thu, 19 Nov 2026 09:30:05 +0000 (UTC)
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
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179508060403.2971054.11303289399878492529.git-patchwork-summary@kernel.org>
Date: Thu, 19 Nov 2026 09:30:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: dts: zte: Declare zx297520v3 CRM device nodes
  Submitter: Stefan Dösinger <stefandoesinger@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1206480/
  Lore link: https://lore.kernel.org/r/DkHOTiB7TW6tXJRTDczLjA@gmail.com

Patch: [GIT,PULL] sram runtime PM
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1214195/
  Lore link: https://lore.kernel.org/r/CAD++jL=1xfmNQf-=ejeDy6iL5BL_yiEFnFtPsakufN4QkipS3g@mail.gmail.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


