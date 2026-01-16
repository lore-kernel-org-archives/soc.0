Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1C3254BC
	for <soc@lists.linux.dev>; Fri, 16 Jan 2026 01:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526043; cv=none; b=AK6G99YjtgEnlvgxfgSc6sqHq7i4EjVcT7lIPIABy+RoHJaaeHOWOeAqJVb9rgonV+aYghYJi/fTLz9/+7BB7CqesccGZdZi20TRebeia4Q7dDoqd7MdOJG/90yNCiD1eSzYUg1vYj6GHY94ENpAqsKXMg6ihm3/HKsT5S5NOag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526043; c=relaxed/simple;
	bh=l8wDGlF8KhzHXDQTrpfWPq+m4M23U5Ucjdl6UZDk6TY=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=SwFISpBbb6i8y6swsw7jl44FaeTl+YT3dazr/XaL/9DqFU2ZUQmhhyt8b1q1iKQWikRvwV2/jAOpDF0rq8YkzGbOhosKFbCNcANxg7N987aLPGQSa38457TPcCuEcGCm+M6yBI5IRiYsNBSG3TTd3LMgtvWJhGt2Z66YgseH0Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=llyvELKS; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="llyvELKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768526018;
	bh=8v/THlnoXVHvcH673OA27G5X5V3+koupdlMYV2m+jOw=;
	h=Subject:From:To:Cc:Date;
	b=llyvELKSiIznZFW2NMeR6N9UUpuMCbNG5eZ6NMYA4qKlLjDmjmignOGD8GbWRNYv4
	 sFXxCPIzeM/fWBcLbmmYM1v3fpQSqi3JvkS1FIW1D63OhQXIzSgtjMUlR+v3/6ZC0O
	 RRACwGPLcHw0sVQIxHcWvdPpyo6UZ/+gUZ/mPR1MBIYOghg0Mx+m83v6/uIukXIAMG
	 cYmA3Cl/6Ek4v7wLoorSmvF/+RoeP49KrRSUKQ1J1Z92QxTYWNr65kCik1JYjLavm8
	 IwvKa72cO1dqks7sMNL9vU8D16BxrNnzmlT+wIUKau8jWH2MNv3sPMfISTVrPLdwaP
	 SDEFLCB0xHvKQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1D5BC7A005;
	Fri, 16 Jan 2026 09:13:38 +0800 (AWST)
Message-ID: <392d9247f7c15d11b115c86cba762568f37cd10f.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of arm fixes for v6.19
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jan 2026 11:43:37 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm-6.19-fixes-0

for you to fetch changes up to 70b8c45d8621c4d77b5659270e9a26ce7b1123cf:

  arm: npcm: drop unused Kconfig ERRATA symbol (2026-01-08 17:11:35 +1030)

----------------------------------------------------------------
Nuvoton NPCM Arm fixes for v6.19

Just the one change from Randy dropping an unused Kconfig symbol.

----------------------------------------------------------------
Randy Dunlap (1):
      arm: npcm: drop unused Kconfig ERRATA symbol

 arch/arm/mach-npcm/Kconfig | 1 -
