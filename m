Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C47200C96
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425070; cv=none; b=Odt8gQQow10vDqf2xWZ+P6QdkhaZtc+ymyxQV+2NxWYNXVefR1E4osZ2jfroFxdSyRt6ru8NDiHlGI3I+9EHeRKWSU+r1vj/cevu+yue9ovXz9/3otRdiOk3701LliIM0H4wSNF/uHxhPpdHSYHXZxvJIXjD0Kxp5OBMT1oQUzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425070; c=relaxed/simple;
	bh=uQV0n8yCC06ltoSjlnTAEx6volrcn7obATZz9RHAyIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C3EzFXwuUOFrNLzCDKkAO/Bt6783yQrS5V8kG21elDBmJ3UQurUtTdrtfsCm2aiiJQyDwAoKKIbQ8h5ZYHWL1vJsbA1p25R93/JgPIC7bjSGCGZzbAQxqz711xZewY0UEVwRtb57u5nyiI99lfuC2EyyFlrZ1lWwxBkH3tEtW60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 8CCD5C4CED6; Tue, 12 Nov 2024 15:24:30 +0000 (UTC)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 284B9C4CED5
	for <soc@kernel.org>; Tue, 12 Nov 2024 15:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 284B9C4CED5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Xnqvl4Sytz4wy1L
	for <soc@kernel.org>; Tue, 12 Nov 2024 16:24:19 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:78de:3cf6:79c5:d375])
	by albert.telenet-ops.be with cmsmtp
	id brQ92D00l4mJWgD06rQ9ME; Tue, 12 Nov 2024 16:24:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAsk8-006q6m-9e;
	Tue, 12 Nov 2024 16:24:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAskT-001eqb-Pu;
	Tue, 12 Nov 2024 16:24:09 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.12
Date: Tue, 12 Nov 2024 16:24:05 +0100
Message-Id: <cover.1731424916.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.12-tag1

for you to fetch changes up to 124f4f1a18696c4198f9f903fd74034ea8b7d352:

  MAINTAINERS: Re-add cancelled Renesas driver sections (2024-11-11 11:11:17 +0100)

----------------------------------------------------------------
Renesas fixes for v6.12

  - Re-add cancelled Renesas driver sections to the MAINTAINERS file.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      MAINTAINERS: Re-add cancelled Renesas driver sections

 MAINTAINERS | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
