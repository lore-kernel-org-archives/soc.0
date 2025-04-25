Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D7248896
	for <soc@lists.linux.dev>; Fri, 25 Apr 2025 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584523; cv=none; b=ePX+V9u3ufY4s2T2LJXywSCHFAnYirMQ9PCcbMOWkOvibaCnr6COwDVQxrkTlxjb6f2J+2ejCqPgf6dsABAzYam9S/z8oWKHc7bczmLMSuwz2KL7Zk9nsFbdI57hNSLhFfycwmnwNLq0UCpDOhABYYcf9oyoGhkhLE5rU9UFtqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584523; c=relaxed/simple;
	bh=ZAjudanoPshGD3qwQ4+sIF4Hp0MNHS5HqELkFm6Z8S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJtZ6qjk50r+HS3eYU2EP6rucIrNOV/REjHgHSgmBMdAGQkjlKcg68B/29908ApW5ow1zBSZbizYDkz9qRbI+ELxEXz/inQ8XuUv8np3XA6Ib+0JigM2naFQBrFEzRXiIOgzEyL4AMVJQlWnZEDYa/xhYXGccQYw9uahUrGqaZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 14F10C4CEEE; Fri, 25 Apr 2025 12:35:23 +0000 (UTC)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB00EC4CEED
	for <soc@kernel.org>; Fri, 25 Apr 2025 12:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB00EC4CEED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4ZkXNw39Xrz4xW5t
	for <soc@kernel.org>; Fri, 25 Apr 2025 14:35:12 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by albert.telenet-ops.be with cmsmtp
	id hQb42E00616PE0206Qb4sM; Fri, 25 Apr 2025 14:35:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJg-3Bal;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGm-0000000CKj3-00w3;
	Fri, 25 Apr 2025 14:35:04 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v6.16
Date: Fri, 25 Apr 2025 14:34:57 +0200
Message-ID: <cover.1745582592.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.16-tag1

for you to fetch changes up to 31d358e611b7cc21349da58dd2c9118c84b0859f:

  soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC (2025-04-14 10:53:12 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.16

  - Enable all Renesas SoCs by default when ARCH_RENESAS is set, which
    will allow up to remove all individual Renesas SoC entries from the
    various defconfigs,
  - Initial support for the Renesas RZ/V2N (R9A09G056) SoC.

----------------------------------------------------------------
Lad Prabhakar (2):
      soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
      soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC

 drivers/soc/renesas/Kconfig | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
