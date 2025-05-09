Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419D02139B5
	for <soc@lists.linux.dev>; Fri,  9 May 2025 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800581; cv=none; b=G+oGKJhkqdjafv0oc0zBBnUSVhZJcvnK2CrDqr+Ux958YL78geGFhD1NB6a/L+FO7bWc1qDf4/+iYlBLvH1CGWSa9TWoOpX4tsV8QEpJTHlASLJfYdxxdN8w3q1zuGtEjocBII+OReUDdf0I5kV9pJ/fkW8RvUxb72ZNPK9HyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800581; c=relaxed/simple;
	bh=Tzr+mxhCPLQlfc5bZ9OHSuZWUcZpmHALL5eDMJlLI4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfsnwhtXh8/TI2spPjqjw9dLrjLynqBqNJiGOwa7FGx49M7XQAcrgZuS03eaU68sEOPSslDc+s5SFjtGO+s/hfSxHE6LR1WrxOUXz4kt2Q0GpkYvqA02ZlyBqbWwoyFncebW57vUNWbR5ePH+1u1TtQlaFm9Yg1Ouh+MwRdf17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by baptiste.telenet-ops.be with cmsmtp
	id n2No2E00K3X0DE5012NoC1; Fri, 09 May 2025 16:22:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOca-000000012Nm-3RLh;
	Fri, 09 May 2025 16:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOci-00000003ADJ-1vzK;
	Fri, 09 May 2025 16:22:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:29 +0200
Message-ID: <cover.1746798752.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746798748.git.geert+renesas@glider.be>
References: <cover.1746798748.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 31d358e611b7cc21349da58dd2c9118c84b0859f:

  soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC (2025-04-14 10:53:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.16-tag2

for you to fetch changes up to 3903b4701bc03d7d805c3df378a7fc2ff72cbef5:

  soc: renesas: rz-sysc: Add SoC identification for RZ/V2N SoC (2025-05-05 10:54:02 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.16 (take two)

  - Cover all R-Car drivers in the ARM/RISC-V/RENESAS ARCHITECTURE
    maintainer entry,
  - Identify the Renesas RZ/V2N (R9A09G056) SoC.

----------------------------------------------------------------
Lad Prabhakar (1):
      soc: renesas: rz-sysc: Add SoC identification for RZ/V2N SoC

Uwe Kleine-König (1):
      MAINTAINERS: Generalize ARM/RISC-V/RENESAS ARCHITECTURE

 MAINTAINERS                         |  2 +-
 drivers/soc/renesas/Kconfig         |  5 +++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r9a09g056-sys.c | 75 +++++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c       |  3 ++
 drivers/soc/renesas/rz-sysc.h       |  1 +
 6 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/renesas/r9a09g056-sys.c
