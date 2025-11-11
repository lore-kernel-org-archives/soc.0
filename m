Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0122FB62E
	for <soc@lists.linux.dev>; Tue, 11 Nov 2025 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854954; cv=none; b=tuZPeveZ3vMuSOQg9YxbeAq6Bo00vWwZr4n2ftMJIPM8fEqkXE1bwoURa9dM+cs9vTCkJLjxsZfuqV0Ztdx9xwHZkw1q8siwfak6VR5pbpGv6ynQHLegmFprPu+fOYbI+bF9fObbx66i8ZtvBw134C8l79reyQG1D+di9gb8sU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854954; c=relaxed/simple;
	bh=cNvYZKW6YhJW2L+1gEw0wViDTebbKD9GOujXv4uoegE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P3DjTyn7NDrKUzRNsJS0Q04C6zVfXbCO9E77QnHrW/cYcxjnNgnqCwiJInumiiRwNYXS77uE7eaVM1Ze0CkLta53Spc4J7RMkLnS8x9ghzNfF6jM6h5XYzwcYXT3MxJKfBWO0VV5Vz/UkqZM8ymQ0GRxaQa8kugngFvIEd1lJKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mL7f1nps; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mL7f1nps"
Received: by smtp.kernel.org (Postfix)
	id E4E12C2BC87; Tue, 11 Nov 2025 09:55:53 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CD36C19425;
	Tue, 11 Nov 2025 09:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CD36C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762854950;
	bh=cNvYZKW6YhJW2L+1gEw0wViDTebbKD9GOujXv4uoegE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mL7f1npslPZL/j0dab3kbRT6ydLvM9o8W3qMV96Ar0bw9k1SSm8iDW+omfSKh0P5x
	 YXR+xDlwW8WIns3GkxNKeaDSE+7MDapmfeT4B2V0OUxJjdAYka9dSaShH1v9j3mdYG
	 STZnnlNy6uTVkUjjX19c1/Ie+xPtRFEaM8Z59jZVWohoPLOSuKyxyaVR86LAs724Y1
	 23o/RaLyGdettwF0O08Y5skLw0YUiFUXl7YDkDsmjtVw/kXEwM2vw3PK1UzOsMkyMu
	 07xUQqFBaREi/2eGfAyC8+5VsT8QxX2NSg+szXdGszl2DwW8RK5V4aL8PcWHSNMeqB
	 RhsKilbLfJSxw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 541BA17E13B9;
	Tue, 11 Nov 2025 10:55:50 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,4/5] MediaTek driver updates for v6.19
Date: Tue, 11 Nov 2025 10:55:39 +0100
Message-ID: <20251111095542.13958-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
References: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.19

for you to fetch changes up to 4459d667a3d7001d1c1703dc79c87db1808cdde2:

  dt-bindings: soc: mediatek: pwrap: Add compatible for MT8189 SoC (2025-10-30 10:25:05 +0100)

----------------------------------------------------------------
MediaTek soc driver updates

This adds socinfo entries for MT8189 Kompanio 540, an extra entry
for a variant of MT8391 (AV/AZA) Genio 720 SoC, and support for
the PMIC Wrapper (by adding a compatible string) in MT8189.

----------------------------------------------------------------
Louis-Alexis Eyraud (2):
      soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA Genio 720
      dt-bindings: soc: mediatek: pwrap: Add compatible for MT8189 SoC

Sirius Wang (1):
      soc: mediatek: mtk-socinfo: Add extra entry for MT8189

 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 drivers/soc/mediatek/mtk-socinfo.c                                 | 3 +++
 2 files changed, 4 insertions(+)

