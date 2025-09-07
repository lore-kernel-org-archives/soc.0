Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5DA1F1513
	for <soc@lists.linux.dev>; Sun,  7 Sep 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757248258; cv=none; b=Q7E8298Ze8ydlbLoH1Hvs7xSdk72t5oEdpHJPrcM6MBJ5otUXw4Al+LY8W+NcUCI/84M6v/WRMt283l6F2l1b/nv20RNVYzBvkXIuOslSQQFhgBlQCTt0co6Eu8KRAw++G8YfckXKDzehU3+67KGXZihz8DYOlZ4ot9rrJMjx4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757248258; c=relaxed/simple;
	bh=DBW2Ex5toXKoUcqUfdn/FZVI0/D7yly/ottjIM9jxww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fmMOQwSefSP53XIX6cqbT0ljiuClorWefUI9u6SRXGUXwGQyC2vzxgxNsv/nB44/xNi/L6JFCc2GFWQnDe3jAEgZnhfT8J/hRq3hYMhm+2Fj9upCfEYAsct4OtfdJsJeHO6xeHdaFsixc29Cqc1jMttQzV5CqyYxrOrzQz3ik08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhTMVwlh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhTMVwlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D462BC4CEF0;
	Sun,  7 Sep 2025 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757248258;
	bh=DBW2Ex5toXKoUcqUfdn/FZVI0/D7yly/ottjIM9jxww=;
	h=From:To:Cc:Subject:Date:From;
	b=KhTMVwlhrN8V2mgFhNk0HQaBykD+OKN9jbB4eIOCTE8gxNmQhdAR0rxjUt5nOoGNj
	 2HVrtoBZK5ps1f2RmpndurkAbasNMOsqLM5kxcaRWFcUZwUqa6cWEt/ktfo730J7mX
	 NdzQkdZstuPHWWk+ZNavDSOISlrxIHm5k7rEbclA+X/BTcTrpKfMU6oMo40+epz7cn
	 9u5B6F63CY95mnma00yWitP/TZY6UpRL493iGgUvm4LEXIcMWSdmx2EvwtUnmTidOZ
	 tFxedLXt6b3P7YIBwvEAsrPRyFNjOM5+D5ivOId3iAL4Mhg6NfcgfWtFuw6xpC0bf4
	 if9jXCJn/x+ew==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: fix for v6.17
Date: Sun,  7 Sep 2025 07:30:58 -0500
Message-ID: <20250907123058.175447-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v6.17

for you to fetch changes up to ea9da67e2add7bd5f1e4b38dc2404480e711f4d8:

  ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address (2025-09-07 07:26:29 -0500)

----------------------------------------------------------------
SoCFPGA DTS fix for v6.17
- Fix midio bus probe and PHY address for cylone5 sodia board

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address

 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
