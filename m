Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6501438F24D
	for <soc@lists.linux.dev>; Thu,  9 Apr 2026 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723297; cv=none; b=A6qLWjNsTJGbPfaL5Ocp8i2LC2lwe/28rGJG/xTrcY4xFP+pg6SQ2KOqx+HWSgCycS0h50hyz0xJlCs3T2GP/zpBYau5CDnarJ7067ojWKfYuuhe93UzZeiuRjM7JSD6WHM/TlYgR8b842/YX1oWGF8nd2v7jif0hl3XKQY2KXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723297; c=relaxed/simple;
	bh=RlZ5km5xMJgq+tEMQrGqYFysGgwjA0BQnwiz3SWtV9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CUKqxzYakEn0LdM/4MlJZoTowcC2iXPg6CZBA3mvASGZxsQ7NYu5yKQDOwe4I0nqcvMvhkQyrN3Z9vgo9j6zP6liycF1d1TrRaBQRmylHn8ZSfqrq5Zw7CCmdC4mbOz5ey0/EkrHc9zIIoRRLC4uINBzwUvGN7Qnmx8IhZu77yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L6SlGv4q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L6SlGv4q"
Received: by smtp.kernel.org (Postfix)
	id 2FC91C4CEF7; Thu,  9 Apr 2026 08:28:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27F7FC19424
	for <soc@kernel.org>; Thu,  9 Apr 2026 08:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27F7FC19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C0E91C5AABA
	for <soc@kernel.org>; Thu,  9 Apr 2026 08:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22A8B5FDEB;
	Thu,  9 Apr 2026 08:28:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B27BE1045024F;
	Thu,  9 Apr 2026 10:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775723292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=0gNMksGCJbd7EqixIA8vvHKcH+FZvBP9KXWFhtHZFsg=;
	b=L6SlGv4qS1oSXd1UYVpGCwW6362M2yLv5Tvzpe5++GDQpXy5wMRRE0pHQGs0yC7LzYrPNK
	K1Bwpvx/Lorz3V/omsyVnNcnq/nVm7b6pFZ3od3JIIWaWM6acZFmXE6wh9OJfqNGcec2ND
	0zk3vWhk1i/JHCRgQ//1dMZoB71YJSXkvYOVyZYpDH25G2saznlfApYuHbvT6Dzrc+2mbg
	aJmJ2ww2GEHVQVetnLqQzGNGky4Gto2y7mKrwEzVotMjYlq34Ux/nm7sbVHS+3NfxXywNt
	GGZaRVf4NDPkunlQy9KU59Vp6x/lEQVZ20+l8PVh38aKR+1PQJDIWbQL7HfGWQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Date: Thu, 09 Apr 2026 10:28:09 +0200
Message-ID: <87tstk35d2.fsf@BLaptop.bootlin.com>
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

Here is the first pull request for fixes for mvebu for v7.0.

Gregory

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-7.0-1

for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:

  dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0100)

----------------------------------------------------------------
mvebu fixes for 7.0 (part 1)

A new device tree has been merged without a binding, which triggered
warnings during dtb_checks. The commit in this pull request fixes this
issue, enabling easier detection of new problems in device trees by
reducing the number of false warnings.

----------------------------------------------------------------
Elad Nachman (1):
      dt-bindings: arm64: add Marvell 7k COMe boards

 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml         | 11 +++++++=
++++
 1 file changed, 11 insertions(+)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
