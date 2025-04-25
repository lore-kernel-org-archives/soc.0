Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B40248896
	for <soc@lists.linux.dev>; Fri, 25 Apr 2025 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584523; cv=none; b=GLk2y50FR9TYP78kYqJEW+haDNiOw129x8m7fdNv1+h3W/g6cvPV8QZvkVM7PZ+bMvOFvMj9yj1uKAnm6Mu51BmZVt6Ds22wiMEnAVqF2Qn9x+v2HVBsC15hhnLkI61ZVEbOn/KP2xmvBAheLI3z/KmEK+3Sp8krv4TCcnobVSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584523; c=relaxed/simple;
	bh=s18HugNEZxIvYEkNxXfXxoiEi0mv19F9mUAB6gheJbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IAXhphPB2Q5qqRubkC1o9Z2eg1D0/1W6dW1+joHF6mYufHIkm5Mp3UvjthQjGPF7NUibqXHyQh+uglcflkAIh6Fa557UrPoo4+cmxGZkQTmXK6cLLQsvaJyjQ5+PMTEIO5uUN/KrsOGHnusK/euPJWmnx2R8qDEfydu/+toXYD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D1B44C4CEEC; Fri, 25 Apr 2025 12:35:22 +0000 (UTC)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15295C4CEE8
	for <soc@kernel.org>; Fri, 25 Apr 2025 12:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15295C4CEE8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZkXNv2bNsz4xr37
	for <soc@kernel.org>; Fri, 25 Apr 2025 14:35:11 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by baptiste.telenet-ops.be with cmsmtp
	id hQb22E00l16PE0201Qb2k0; Fri, 25 Apr 2025 14:35:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGb-00000001gJW-1em3;
	Fri, 25 Apr 2025 14:35:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGk-0000000CKiv-2agP;
	Fri, 25 Apr 2025 14:35:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.16
Date: Fri, 25 Apr 2025 14:34:55 +0200
Message-ID: <cover.1745582587.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.16.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.16

    - Enable all Renesas SoCs by default when ARCH_RENESAS is set, and
      remove individual SoC entries from the various defconfigs.

  [GIT PULL 2/4] Renesas driver updates for v6.16

    - Enable all Renesas SoCs by default when ARCH_RENESAS is set, which
      will allow up to remove all individual Renesas SoC entries from the
      various defconfigs,
    - Initial support for the Renesas RZ/V2N (R9A09G056) SoC.

  [GIT PULL 3/4] Renesas DT binding updates for v6.16

    - Document support for the Renesas RZ/T2H (R9A09G077) SoC and the
      RZT2H-EVK evaluation board,
    - Document support for the Retronix Sparrow Hawk board, which is based
      on R-Car V4H ES3.0.

  [GIT PULL 4/4] Renesas DTS updates for v6.16

    - Add SDHI, ICU, I2C, PMIC, and GPU support on the RZ/G3E SoC and the
      RZ/G3E SoM and SMARC Carrier-II EVK development board,
    - Add internal SDHI regulator support on the RZ/V2H(P) SoC,
    - Add UFS tuning parameters in E-FUSE on the R-Car S4-8 ES1.2 SoC,
    - Add support for Ethernet ports C and D, I2C, keys, and SDHI on the
      RZ/N1D SoC and the RZN1D-DB and RZN1D-EB development and expansion
      boards,
    - Add initial support for the RZ/V2N (R9A09G056) and the RZ/V2N EVK
      board,
    - Add support for the Retronix Sparrow Hawk board, which is based on
      R-Car V4H ES3.0,
    - Add ISP core support on R-Car V3U, V4H, and V4M,
    - Miscellaneous fixes and improvements.

Notes:
  - The commit "soc: renesas: Kconfig: Enable SoCs by default when
    ARCH_RENESAS is set" is shared by PRs 1/4 and 2/4, as the defconfig
    updates depend on it,
  - PR 4/4 includes DT bindings and bindings definitions for the RZ/V2N
    SoC, which are shared by DT source files and device drivers.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
