Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A130296BBB
	for <soc@lists.linux.dev>; Fri, 23 Jan 2026 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188737; cv=none; b=k+o8O/w3CyBxB/MgSuXnyxaijU0fWgJmaq4Ms7oPWzpqS36oIy0nYKUxBMWVPZ2nEr0xY5qABSRah3fAQNLZKWZacrAe2v3+O3yd1O3iZt76mJXHkM00Xc5Lq3jyP00P52FCUpT0UtYhiKGWqX2lN2DKK7s3tAqsJxiMmG4AaLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188737; c=relaxed/simple;
	bh=7q/xfbUa2BHm5NoCU2Kz9xEBZtbGxqHhzmPboLaV0mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fCu+FnnE9lRoyvoBV/cWu7f2iDPr5kgZ2e28OF9gOSr5pVtbBgPUFSX8thKjODoGLBsvcyOTmAzTx4oJFv/1SZxGRZRQdtlcHGledzcg0gjwqtzBiR+45CK+CepkrFJVReKIFT7J9nGBFjsEJeHGrkNqRWK6q7q7A4GkRLMyHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OEeCt2t8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OEeCt2t8"
Received: by smtp.kernel.org (Postfix)
	id 83869C19421; Fri, 23 Jan 2026 17:18:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A1D9C4CEF1;
	Fri, 23 Jan 2026 17:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A1D9C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 803264E42225;
	Fri, 23 Jan 2026 17:18:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E1F26070A;
	Fri, 23 Jan 2026 17:18:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 561DF119A87DF;
	Fri, 23 Jan 2026 18:18:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769188729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nNAKJNF7gOGJ5liBgu05LUuy+DL5ctxb2S96YSva36A=;
	b=OEeCt2t8mdIuM49U94I/z5dTR3FI5pSSHiE5SAZg5q7FMGtx2Hg01pyHzVAgWjWXPglJYV
	W6XACQ0Mbio4XSm0jx3w8V6ajvwVHm6Yje8XZx5wS6DCz8fx+OEh/2ny+pcCCEfsS8Fsbz
	DZrTVPHjAvdlsoNzcjz6e92IkxKaCxVA6gHUdtBplzwclb8fufE2bx5V6oALrlVCuwjT9K
	/DE3I8DxmxyJToCZfkTrpuBXI+S4rC4sLl7xiHmap89NEYxgPJbpAStw77hMnvSx9l2bHb
	5mExsUbVHAPyLkLxiq6NfuORVvhWMGGvWuSjl0GQSYpcaqShbAh2FTFNQJ8W2g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v6.20 (#1)
Date: Fri, 23 Jan 2026 18:18:46 +0100
Message-ID: <87343wl021.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for arm for mvebu for v6.20.

Gregory

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-arm-6.20-1

for you to fetch changes up to a1a359e12a4226f3ade63ee1c08cf21ce896a07a:

  soc: dove: pmu: Simplify with scoped for each OF child loop (2026-01-05 1=
5:03:43 +0100)

----------------------------------------------------------------
mvebu arm for 6.20 (part 1)

Simplify Dove PMU OF child node iteration with scoped loops

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      soc: dove: pmu: Simplify with scoped for each OF child loop

 drivers/soc/dove/pmu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
