Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A943DDDBE
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722840; cv=none; b=AV7dOYknUqe/0PiypOh0ayk38YDZ2T1NZKsIUOn7UP59NTwJYyn0Ovyf7T18VrSS7Gh98waT99CUF8Se0VTuX4rWnxGPauY/QQeIVw3RYyW32n7Whm12+dXE806WBtYAYFJR+Dla3j5MNlvNM1Q/Q621zEv5rpQXUEGPph5aQQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722840; c=relaxed/simple;
	bh=2lRJQCSIl2HaQ4DXKrk8rEe0SLjzJDia0AC0r8PGRPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s9S1m+V47GxrKQxZCRdi9zWMBlIBGs6oKRIASOb3Kv54GW/mrIcxkkyAuP3LiAy5jKNINUl/htnor9jRLcHCR7v6Jeo0HJHFrTfTM8FlXyq+T7vB0is2dIUOjYNpYBlW0an3+9wLKwnqn/46yOQwzBec3COrUoTveP6V+3yXgeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 78FCC1F00893; Fri, 18 Sep 2026 09:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB951F000FF;
	Fri, 18 Sep 2026 09:13:55 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas SoC fixes for v7.3 (take two)
Date: Fri, 18 Sep 2026 11:13:52 +0200
Message-ID: <cover.1789722755.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

	Hi SoC folks,

The following changes since commit 2ac7bad110be6ebe478d6bd57821f7f5259a1f54:

  arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to WRR (2026-09-02 14:32:37 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.3-tag2

for you to fetch changes up to 8dc2615d5702059b2b71fca6f93c0d7d10ae54cb:

  arm64: dts: renesas: r8a779f0: Set UFS lane count (2026-09-14 10:07:09 +0200)

----------------------------------------------------------------
Renesas fixes for v7.3 (take two)

  - Fix UFS regression on R-Car S4.

Thanks for pulling!

----------------------------------------------------------------
Koichiro Den (1):
      arm64: dts: renesas: r8a779f0: Set UFS lane count

 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 1 +
 1 file changed, 1 insertion(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
