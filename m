Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6287262E
	for <soc@lists.linux.dev>; Sun,  4 Oct 2026 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145666; cv=pass; b=fKptqAXDupWDYxPXVXxDwu7oRGj6iLEQO90/p3xP1YN2NskZldp6z43NHGnIp3iNM3qQMZ9EKy/5cqNP5W/2kLo7BDIq4EAQi8yYYx8hvT8H4KSp3Yqv/WZbWOpttAXxcKolDU+wRQVVq6VsX/aaLn0UcB900b2UPQTr3cHDAns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145666; c=relaxed/simple;
	bh=yfAfkw9V0tDDFX5eBciqW3G4u7p+87YjpDlfxtrhMuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hre8wNsFhaNyHYBn+Ul+qyGZOF3YlhwAdDjCsrd7pqbDD9PrJRQDy3P8sBzCnfa7AsEUmC0gj7kmtcH8u+nPyX7O0hJs6ZxDT6C56C5JLYtyu6ZLXMr4RPU8DnF8fUE6L0RlDRETUZmggtlG06qcJI+79AQeegQA0qQun/KW8vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DbZw1QNf; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DbZw1QNf"
Received: by smtp.kernel.org (Postfix)
	id 162EE1F00898; Sun,  4 Oct 2026 20:27:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791145663;
	b=Lz7r4jZHNKhXPhRBObSrhYtMOTqd4XvZrw6l4wAlR7SKIXKZ86dlepLzcp9+lWeCAhT7
	 HGIogg/8xuT0sNoi2jtMquf3cak+NqoGBfNrATYfU+tERtV6cVG3MIFD9Dchd/zr8j31O
	 e1hOZQ3oMPl+J0qO7h2E/KwfCReSR+PkRHISf4hqLtGsQk5AkNFi/pjPW3NmNWd2WQwg+
	 BzG9a8LcO80jNPp0CWpb3OLci10+BfUn7s+g3yMWy+c6s/6tRHSHwJIhPRcfkPh5oQVST
	 6oHztXy2JrwYz1jP6pdRaELr+NjkKypJmjE5y/Qz7w9ClU4h6TffxbqK1xtw9jXlKTw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145663;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=GAgL45iiZDO9SPuPJegj4hc8HxNDWOPMhsXWYMRsHPc=;
	b=GJB1u9f8aItxed3IeSHWEoLOtAYOImWn1CDLnSMrNjP5EedDOLLq5GKQaC+Mx+hEslq5
	 x85Q/2xYhH3xgx+v/wrTxbEBfpkxEeGU6AswHwm7juWTOR6JMwEAJNhZt1Giz5U5ahd8S
	 bnRd2TBxR8/paUbg2Ryi2BV9h79/kYOXSM6Q0wYzyucSOMTkzsGcVVwhvKxbqOLg63H4D
	 yMLQLqG9+eGyZ4wDhvEDPJJK/r2eCCiDh6ubbYUgreUbben3jO7wTWVX6dubsRo/NDtIm
	 8j5fuQLaAsPdAponpZPZiPbI8c3bO78u5CZNle0gcL9AP4EG6Lp9brYmHUYg5mXvtew==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DbZw1QNf;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 622C11F000FF;
	Sun,  4 Oct 2026 20:27:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DbZw1QNf
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 622C11F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 28B854E41156;
	Sun,  4 Oct 2026 20:27:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D4781604FE;
	Sun,  4 Oct 2026 20:27:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 976B71032820F;
	Sun,  4 Oct 2026 22:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791145660; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GAgL45iiZDO9SPuPJegj4hc8HxNDWOPMhsXWYMRsHPc=;
	b=DbZw1QNfz9B2KbqJcW26t6vB875sA9h2CbHUR6c2xAkgOA14jdZaFo88FnlMmRkYKNNRsF
	u39t86bdTtzWaEonDjE6ALT+bxRaYFI/2sbnKPX03xZLEICU/AmNUw4HH+l/aaMtphqHKL
	YkcAavenQObAfprb2OjC8Q5mVf5G3OsAKY4M+lygVzN/tINS6EuuPgTP17uA2oXODGc0Wa
	whHfqke04eBmneAVo0kSDkZXJeuuvjwaP/AcG6aiyGuz+zyWDebWSDSFeRDYu9ydRddSfO
	Vl34nvw/bhl/u0d5kJViIMa2cGwuaWXD/REuWGNLsVulm1s4IqlmOkqeHGIK3w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v7.4 (#1)
Date: Sun, 04 Oct 2026 22:27:38 +0200
Message-ID: <87qzi56wjp.fsf@BLaptop.bootlin.com>
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

Here is the first pull request for dt64 for mvebu for v7.4.

Note: the syscon "compatible is too short" dtcheck warning is a false
positive (pre-existing nodes from the shared armada-ap80x/cp11x dtsi),
so this should be ok to be merged.

Gregory

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-7.4-1

for you to fetch changes up to 0f72e965efec4cda7c3b1ac76edfab53f27ed9a7:

  arm64: dts: marvell: Add Sophos XGS 107w NPU board (2026-09-30 21:52:13 +=
0200)

----------------------------------------------------------------
mvebu dt64 for 7.4 (part 1)

Add Sophos XGS 107w NPU board (CN9130 based)

----------------------------------------------------------------
Nicolo Giuliani (3):
      dt-bindings: vendor-prefixes: Add Sophos
      dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
      arm64: dts: marvell: Add Sophos XGS 107w NPU board

 .../bindings/arm/marvell/armada-7k-8k.yaml         |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     | 188 +++++++++++++++++=
++++
 4 files changed, 198 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dts
--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
