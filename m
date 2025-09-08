Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFE1A3167
	for <soc@lists.linux.dev>; Mon,  8 Sep 2025 04:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757304441; cv=none; b=jvacFLeG3xN6T7hZd6CxDeYk1jhE00nJJFZJt2iDE53dH/qPWGiXA/YNcDO9o9qYVQ++xi6lMm7C1gjIvttMWRbj7WWRDazmSNG8XI/Xt3fQXi/m+aa3V5BQR0gONqrPcN3LQO4GASpyXVrCNVX7r/BdQb1O1c351YV5+n5YlL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757304441; c=relaxed/simple;
	bh=wDex0QqoddNRas0GYZ6VwjGjJz/eOq/MoV1W40db1xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XF4x5o6mPrLOQ8WhiKs+x6yx2nsLSNwxIwHCz6HL+wQqm/2LFZwJ9bbGiip/Nh9XUT+XzTub4dml1U0JsbSA5haXpppFyd9vAQga0yXxSsKZuaboYMiJ1kezZNQui02XC2iIvGcEF1whi7zHwheCMus1l3JUFVLLX837sdbVoWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYeYebds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYeYebds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3BAC4CEF5;
	Mon,  8 Sep 2025 04:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757304440;
	bh=wDex0QqoddNRas0GYZ6VwjGjJz/eOq/MoV1W40db1xc=;
	h=From:To:Cc:Subject:Date:From;
	b=tYeYebdsvRRhrKJNJFOM++6NRUSpMfw/H81BJGiZCC05+M9rb0ua/Rt+ZSxZ28xhU
	 +rDU4grYbsWchWAI51eCH+TZMipyAXfjZC8+9hfWPLSLl8IOE2gBDgRqBrykcb2SC+
	 V5MBrvecv3irmbFLqkzKO5nsnRN1IglsK5zkNOsEKWHjzdyX86/qZ2AUKzcB3U6C1V
	 +5uUC5cPhZfyyCVReQxjB/4xOxfbuchojVDeKQWjGVdfklF3PKXSJVvOsB3a7ZH7mZ
	 mHQcFj5Y6j7nJ436puahpjhPisGuoQ3e9nS0Pn/SKDxi5FRHbhEm6NahqsuKxEExeN
	 Ssnf325jRkh7g==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: agilex5: updates for v6.18
Date: Sun,  7 Sep 2025 23:07:18 -0500
Message-ID: <20250908040718.187857-1-dinguyen@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.18

for you to fetch changes up to 9cb76813425956f82cf598c357da0c9f36a1d9a8:

  arm64: dts: socfpga: agilex5: enable gmac2 on the Agilex5 dev kit (2025-08-30 20:27:06 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.18
- Add and enable gmac for Agilex5

----------------------------------------------------------------
Matthew Gerlach (1):
      arm64: dts: socfpga: agilex5: enable gmac2 on the Agilex5 dev kit

Mun Yew Tham (1):
      arm64: dts: Agilex5 Add gmac nodes to DTSI for Agilex5

 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 336 +++++++++++++++++++++
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |  20 ++
 2 files changed, 356 insertions(+)
