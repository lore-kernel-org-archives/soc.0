Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82EFDF71
	for <soc@lists.linux.dev>; Fri,  7 Mar 2025 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362462; cv=none; b=rZj9Lmas5wkBDafK0Q/L16TJkvIB56bsM2Y9vMJsdD13868wSyLoNN72gd1q8JyBEphl7kx0EjSiteVr59uPXO2lu0nVJ38Mb6x36o1SjNqUDZ1tBfBOkSVaqRCQ/BIqQRGIwoZcfor6+rpEHjXsHO+DEjn5+1Zb58kVWywD7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362462; c=relaxed/simple;
	bh=O24OFtz8Xk9bsSxjTa6/ddRLJ80e8oz6n9UKypPCytk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LD/Ps2+QHjWttRVask3pemttAGWETslg4vcBI67UqxDKZJy2REPCFYMGvFuTJ51Es3Q5vXLLO1TRfnPXvmDSlffuNSybn1xi53BWW3e93cVK6Pub9Q2fmHGWx1Mxw8pFMvvTrx73qhAxd2OXc/ijOiD/lN68P+fIlAU94EDSxUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d269:b36f:7a12:a76f])
	by albert.telenet-ops.be with cmsmtp
	id MrnY2E00K2m8Uyj06rnYRc; Fri, 07 Mar 2025 16:47:32 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZuk-0000000DBkj-1ep7;
	Fri, 07 Mar 2025 16:47:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZv5-00000009sr7-1t7L;
	Fri, 07 Mar 2025 16:47:27 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.15 (take two)
Date: Fri,  7 Mar 2025 16:47:25 +0100
Message-ID: <cover.1741362039.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.15.

The following changes since commit 5f7ebb81112c3f50ffbb8e576e4d35cedd8aabb1:

  ARM: dts: renesas: r9a06g032: Fix UART dma channel order (2025-02-21 16:23:01 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.15-tag2

for you to fetch changes up to 8bf8ad268e46403c7140ea5aaa85e9c659117dbc:

  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31 (2025-03-06 16:36:08 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.15 (take two)

  - Add GPU support for the RZ/V2H(P) SoC and the RZ/V2H EVK board.

Thanks for pulling!

----------------------------------------------------------------
Lad Prabhakar (2):
      arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 51 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 15 +++++++
 2 files changed, 66 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
