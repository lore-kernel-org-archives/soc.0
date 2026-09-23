Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47FF486634
	for <soc@lists.linux.dev>; Wed, 23 Sep 2026 10:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159571; cv=pass; b=prGFNpuu0Zxj2bjF0c0XiEI8ZsPDRSzhIBplBN4FYNcm3IgMcITii8jdUlGblEalgvpiAEJnt1JA2eFE8SK7nLlVGTk9VrRPd2P2ndBoWqaqL1dkZ9yKZBeckc81Sx2uH69oIQfLzMYrOykLshLOyQMLv7bL3OO48kamdopBDJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159571; c=relaxed/simple;
	bh=MlU0I3ZU5CQhUEWmtUjU7hoUECBy7HNDtouJfvmnWUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fltu39MyWWD7KOklse8azzZ7UOG798jEmv0IpM5s8w2go5/XcrWBDtoKbTPs81+hjIuBquDpuZIZD1GO4gU7E7Zd1IEhFaCr5Zl1Xn6gOdau7uKNdEvvakNfk9gN13BBl2aK/6J3MJf9xN8dUlHYe46S3b1eDCZwkt4OsZCYJQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G35gyO8T; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G35gyO8T"
Received: by smtp.kernel.org (Postfix)
	id 6815C1F000FF; Wed, 23 Sep 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790159548;
	b=f0fKNY2TJmjasE4vCHx1Mh7O1X4rj3TokUT1eFq7pxoLXyiUnbm2DAi3ZmKfRazSzxFq
	 c79Cp2w6TMmtvrhIjk+9dFk7NY1pedExHIQNL4Q3NTPNFWKKEW1O6mmlM8yuEn4y+TJU3
	 TRhxb+bMPNsiH9OW/UOBQlt7AwnHWvbSSdnmUJgqzHtx4WgzQkPRGhRsck/LYKUwsZxEc
	 TPqOemVYdqTWVGVeP5rXnAynTZW41XfIwvm5jvenAo8nc6yxNhNjRWhNLzbVWrKgE7M9d
	 mHmx8FqB0PY1xStZdAbKkO66dY8ML3zxXTq107FeHydGwiM97XX0Sj3OgPPByfgze9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790159548;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SV1I/v/iKlHr4fJyFgei4IhQeXGMMlj7HID5DV29eSI=;
	b=1TnUEF+oyElmuvQ9HwEi/OtgiWCMnqL977vSrVZ6lhu6w6c1cs3KorRuHSdRhCBHWQpx
	 fXEFECj854bXyPhqJcz/8h2dhhHc/p6ecKlAR4nBv8rZbyJ5V88V8eX6xDaiZUw2Dbe61
	 OfI79FnjpW6Ctcunp1BFNOeCjEe85vFHRm/cf0L3/6gERNX7qXsHt27dJlltHnOlotxF/
	 94SXqadNgo2hefFsKtdCVvoIctQXCtFziaYckU6E6FI/tyJSs/QGibh5Q0YoGpNZbKdmy
	 CKr2g70vvGmuOj53odkLPXwPh5TwpZw10yX/3tvYS9YA7zDb8aA7aLxd7+0XYXbGwTA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=G35gyO8T;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98AE71F00893;
	Wed, 23 Sep 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=G35gyO8T
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 98AE71F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790159546;
	bh=MlU0I3ZU5CQhUEWmtUjU7hoUECBy7HNDtouJfvmnWUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G35gyO8T4XqhIR9m+aMzGaE5wPpF4m5NrBZhNhNlw3PHqY3zE4WuJ6smI+aZu/tzg
	 RGAPuSLy7FonLOg0XxEIVT9KIwoQ/Ds0h9NRx9tc2Osn84prWuQi68fn/bERSUlNst
	 0vLYo46nZyowmK/2Oi9fopr1WgEVpJLB1bBR/BLH1wt0O3LoUiH/HN+YEgWPu67YLL
	 1aghRxhNBEUV4/j0Woqoaft0o4GZd8oVdx6tPIBBCTZCfWW2DCzP6t7PmTk4Os9j6S
	 pkXM4GoQVM6MG8kQ7OP/5ON47WNtvb5McH8uV6kzlimQ281Q1G6VXc8/XyYMr9j2Y4
	 5j5A1jxQXAWSQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E006717E0104;
	Wed, 23 Sep 2026 12:32:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.4
Date: Wed, 23 Sep 2026 12:32:06 +0200
Message-ID: <20260923103222.25504-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts32-for-v7.4

for you to fetch changes up to 2e195497fc9fc0dd89cf95dab80a2d0486dab65b:

  ARM: dts: mediatek: Add basic support for Amazon ford board (2026-09-10 16:41:20 +0200)

----------------------------------------------------------------
MediaTek ARM32 DeviceTree updates

This adds support for the watchdog found in the MediaTek MT8127 SoC
and a new devicetree to enable basic boot on the Amazon Fire 7 2015
tablet using the MT8127 SoC.

----------------------------------------------------------------
Zakariya Hadrami (3):
      dt-bindings: arm: mediatek: Add MT8127 Amazon ford
      ARM: dts: mediatek: mt8127: Add watchdog support
      ARM: dts: mediatek: Add basic support for Amazon ford board

 Documentation/devicetree/bindings/arm/mediatek.yaml |  1 +
 arch/arm/boot/dts/mediatek/Makefile                 |  1 +
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts   | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt8127.dtsi              |  7 +++++++
 4 files changed, 63 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts

