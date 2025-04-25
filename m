Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE1248891
	for <soc@lists.linux.dev>; Fri, 25 Apr 2025 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584523; cv=none; b=qARzDtZK/CQYAwetsISL6OeYAJpZX0DpBVkPtCvypmKS5ZOAhko6IBcxF3DCMleyEjF3iJLI/b3zMX8H7FEyce3Ta6LUrAyWq/w9YllZw3FEsKKHAiBH6QpF0tk3+MxXGwquYrc2+sER1ZswkWBFHhkqNw4B5raEJmpj0F0Hvh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584523; c=relaxed/simple;
	bh=WtIsa6WhPYa6Ba5DnGp4PGskpMPqybSzyWjBwGKwfHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyzQmdxuvry06jTnGGe/FFLY4186uAPlRusNGyQzQZtrsWfOdSCsKYTm+/KTu8N5WjMtkrCCZU54T5cAZgzYjywjXXHTxUWxOhk1lTQn8xG/Q5FIgGtOgjVPMDqTPfsyg72mOps61RB6qAMNeTCdoAmAEf8Gzs1+wTvYYLgrgj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id C2DE1C4CEE4; Fri, 25 Apr 2025 12:35:22 +0000 (UTC)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB145C4AF09
	for <soc@kernel.org>; Fri, 25 Apr 2025 12:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB145C4AF09
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZkXNw34mbz4xr33
	for <soc@kernel.org>; Fri, 25 Apr 2025 14:35:12 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by albert.telenet-ops.be with cmsmtp
	id hQb42E00C16PE0206Qb4sN; Fri, 25 Apr 2025 14:35:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJj-3IuM;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGm-0000000CKj7-06pD;
	Fri, 25 Apr 2025 14:35:04 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.16
Date: Fri, 25 Apr 2025 14:34:58 +0200
Message-ID: <cover.1745582594.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745582587.git.geert+renesas@glider.be>
References: <cover.1745582587.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.16-tag1

for you to fetch changes up to 9e3b7138c3745a91d91e7e525e4b800ea276a761:

  dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk board support (2025-04-24 11:13:53 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.16

  - Document support for the Renesas RZ/T2H (R9A09G077) SoC and the
    RZT2H-EVK evaluation board,
  - Document support for the Retronix Sparrow Hawk board, which is based
    on R-Car V4H ES3.0.

----------------------------------------------------------------
Marek Vasut (2):
      dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
      dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk board support

Thierry Bultel (1):
      dt-bindings: soc: renesas: Add Renesas RZ/T2H (R9A09G077) SoC

 .../devicetree/bindings/soc/renesas/renesas.yaml        | 17 +++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 19 insertions(+)
