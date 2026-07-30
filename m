Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609FF3BED63
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400377; cv=pass; b=gqSj+fpeMhDwhRJMF4LrU16ip/y34Ova4aYg+6XJK9vb7PwzJfIDj2kVSuo+tUt/KTis3WzNgJGweWzw0OH59LGHDGEXgqVDtS8R5aq0FMvsEvqNdLgIXVDHVA7N8BGgy0rTe1uTRIbUBCY6CDRIJ6viMT08vkKRIKkM0bYxCeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400377; c=relaxed/simple;
	bh=VL0n7nQUDCiDkQdds0YBEGiAKC+RIRLDCXpvqYPJpNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mtl0eU/asBszwK1axA4JCpGlqKytz8HmnXKXB1/iU+yLdsxNbky8V50Dgy0A7lDVopF27sk3squP6+8UYn1lJrH221oh+KGKWT1zte9vUuVyMoyPmTePg9CufUSwHRhqDLr2c3FppyuLG/wCp4V5yKsDMjWipJvjAUyIqUdBtZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EUQ+iJdS; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EUQ+iJdS"
Received: by smtp.kernel.org (Postfix)
	id 552CA1F00A3A; Thu, 30 Jul 2026 08:32:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785400376;
	b=azzDt3g8HqzktzgTF3KIuSAAEtCpXMcdXdUn5nAoV375V9Lz2zyuepSLCmR6EVJOW419
	 fuiNLpMmV+d/zpeEI4d1i3hWJzZX2GKeUGeDtmMBFqYMM+KvjcU28OBSTux2bxNeuwxCi
	 0Ifl3kqiGCt8wsye5VQGHVfE5S4LflMyjuCs6nTUnW7c4Mhq/40152YhmI9GWQg8FJRXv
	 dNNofNBTWV5g4vGkmhlZJRlxMG6WYs9u+M55/a3rIhSSO2XkBp/6SJNwD029QELw3EP9z
	 W14hEB6x4AG8D8ga8/PXCsYfp1nTZUCuoMsxa/OeTgYHhkncpF8rKfvWtRKu1f+73gg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785400376;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+RPbD/JeYF3yIl4iKPtSEaMHSyvunbW8sXw1CEjpKfk=;
	b=Gj9rtJUZ5E740XfaiWHlxMH45KkC+uTQMmaL2X4hGxj+XuWuT3/7h8B39TNNg74DnM/9
	 tOljUPQIrzjuxy4DVRoyn3US9VGmuRDvo023RBDGbVnWl0VYqQNzVQopSsGGZyUWLubFP
	 xxh4B7mAO7/sDfCT4ocG6JuxuaQpGb0tIUqEAtxe6+beWcBlUVkflPr9dqyUPNOHyO9gq
	 y5fq5c8F01lR9S9r2YkyFY1ojz6sgmC3UAKZPFe0bPbKoXcBmjKhe7OAHtfslgUSuXvPW
	 0n4m1+wOasvmpLRShsC3ms00l/jLPnVQWipW2JY/afETpYFn67OF0Sum33U7qhTmJ1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EUQ+iJdS;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B11E1F00A3D;
	Thu, 30 Jul 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EUQ+iJdS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4B11E1F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785400373;
	bh=VL0n7nQUDCiDkQdds0YBEGiAKC+RIRLDCXpvqYPJpNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EUQ+iJdSJgtcwIfTdL2vHfhy4wuK1MhtaxrGZVwolMhKOPhYYk288Sp7Use/D6Qge
	 QP+9QgWRjExn47K3VWpntcXuvtAdCgq8EhqZDYtt6iXGYZ15nsxGWNttjt6SiRBtWx
	 hj9RGymv6rCF7ZwpO+6T7Mca4Enkbd2d7qZVf+ZHshAcoCYthuA1+RMz05DhQ02H5t
	 Ur9+uOoNFz9qwDnvGyd9SYnIGfSyhZoNCzmypUqrwJ0J8982W5oclKY0TYv46kEvdB
	 hbg8gZlXKgP041QyDkalIPsegVE/oCvh1uSkFZZsYJsWREegzqmXryhnjirNlCvuon
	 pEp+IWRV5iW1A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3F6817E0667;
	Thu, 30 Jul 2026 10:32:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.3
Date: Thu, 30 Jul 2026 10:32:45 +0200
Message-ID: <20260730083249.13867-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
References: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v7.3

for you to fetch changes up to 6326a6811b1af6674e3eef128df6a3825de26872:

  ARM: dts: mediatek: mt6323: add AUXADC support (2026-07-28 10:56:55 +0200)

----------------------------------------------------------------
MediaTek ARM32 DeviceTree updates

This fixes a minor indentation issue in the MT8127 devicetree
and adds support for the Auxiliary ADC found in the MT6323 PMIC.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: mediatek: mt8127: Correct indentation

Roman Vivchar (1):
      ARM: dts: mediatek: mt6323: add AUXADC support

 arch/arm/boot/dts/mediatek/mt6323.dtsi | 5 +++++
 arch/arm/boot/dts/mediatek/mt8127.dtsi | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

