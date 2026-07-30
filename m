Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C95132BF24
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400377; cv=pass; b=raxM5xRa7OsdwlW4jLQQZAnBs9ZWq7ToUqAlxceqPoQ2MTxbdvSqhZnrwi+7Q1tf8DzY9kzBlfYLzk8q9w0GST4mTfaNNoiT/cH9qPS8Xi+FzuwDghUMLNml9CAXGH8TXC2Om0kYl0M7St/UhRfO1RVrlqk1o7tT4ExAy3TJXh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400377; c=relaxed/simple;
	bh=ZIo8rE82+wDxPG4WdNoiRqJk8tGJQ7oEYtlWqZp0m8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEeppkxabbVw8exLs/G8J3ddLj0yYECVFLCyoa3bt3C53VB0m/8KX72YQFEAeLwWTl7cqFlhoYRBKua1P3zdxEdgIzfa6h19VcZFX8OJz/O9WlsqzpBnTlBgfTUHkZ+2KWXn3Gl9Z71ZQDVeeXL3r4/dYoMiSkQPOIXhjQwa2zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WPViPcVz; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WPViPcVz"
Received: by smtp.kernel.org (Postfix)
	id E28D41F00A3F; Thu, 30 Jul 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785400375;
	b=YSh1FfT/ZB5ZPt+zvv9yHcP9wpOxq9BmwI1Ntf0kI39gk7UfJZIVIMsI5qaXyPy/7SoC
	 kDQUCQTQlf8MZhXSR/K9NMneInx+2hAT+Houba/Ew+XyTTWXDxHem/rX0XxHsC9rr0Cz7
	 zmd0Dn8B4qcV/67SgR5zQliIfOptusCsowFb064Mw5BH1C94+G7JXDtz/HqHHLzNg4m28
	 j77f8GwVmo0LGEz4hSL/yu7MV+1BcWB1eAaShqklIXt/BWa8qXdJso2mAt1zbwozxfWms
	 XjdgIlDKcMXrPH9N6jrKeesLzdveIcMpiPx8yuNHAoRhHZefqctd9H9zJOl8d2l2KtA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785400375;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T0KgRuPwYqTqOkfED0vrX1sYWNPgQ0FBaLi1ye8oN3E=;
	b=0jyZA3krU45iSxPoMCvQIyKnEHUq0Tefgl19I+9tWdBLT4mbvpFFwVVwtv0Hyg3DsUxb
	 jUjp1OUAI/cCDadqe3BIYFk3roDxAprOckxHAHEEK1Ztk1CcwLIHEyRiaEuO0NFr6bpox
	 t/pmlZh7S1W27j7HNWHW3KqyIX6SY+pRGe5oJOH56FGhhfbPfTjCWXqnHQaUVolJj98CB
	 tp/DaxoxYOdOU7N0NEzcIxtZtzIfBPtNzoF6giNdV7dchZVlu2P0/uhqZojtvO15HfFeL
	 3g9z/Lp39dqGksvxjy68VUtCvx3e7cGTkiDDKLo38T/8WPvvquH9HgWiTsFz44yDVgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WPViPcVz;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 254241F000E9;
	Thu, 30 Jul 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WPViPcVz
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 254241F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785400373;
	bh=ZIo8rE82+wDxPG4WdNoiRqJk8tGJQ7oEYtlWqZp0m8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WPViPcVza8171Of+ouDEGA3nRUcpyo+3f605gwtkY3mNqkKTZoreH9xLvzwkdkZcm
	 GLGwfsgzYonOdzhJY90dRCKa3gK19DdASLryBjIVyj2mT1CM3WZ0kcfzFjlcgrqBxC
	 NN59bcQ9jI1vpgQB6Fskvc7SQjc4zSOh+qrIEL2Xa8KEfC0dxwKgljTNodULqOZtD3
	 YpGjCMo7AP0ti8uHmhbXS4gxF1b8JJrcswrMMNA0wSWNj2iFMqgJnGb093DLz3gBkP
	 POOXA79xd/vJVkHy3r+A9TxhhioPDw7oGqsBUOwOmgxp3SM5cVZH14Ses8BCH6yrI/
	 YfjnraLhheLow==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6285A17E0682;
	Thu, 30 Jul 2026 10:32:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,3/3] MediaTek SoC driver updates for v7.3
Date: Thu, 30 Jul 2026 10:32:46 +0200
Message-ID: <20260730083249.13867-3-angelogioacchino.delregno@collabora.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v7.3

for you to fetch changes up to ec762057868d70d474a9816e9c293c2ef801c3c9:

  soc: mediatek: add missing MODULE_DEVICE_TABLE() (2026-07-30 09:41:54 +0200)

----------------------------------------------------------------
MediaTek SoC driver updates

This adds a fix for a missing error check in mtk-socinfo, and
also a missing MODULE_DEVICE_TABLE() in the mtk-dvfsrc driver.

Besides from that, this also reworks how the MMSYS tables are
specified with the macro, separating the component's hardware
instance from the actual type, resolving a prerequirement for
the restructuring of mediatek-drm.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      soc: mediatek: mtk-mmsys: Rework routes to specify component ID
      soc: mediatek: mtk-mmsys: Use MMSYS_ROUTE() in default routing table

Griffin Kroah-Hartman (1):
      soc: mediatek: mtk-socinfo Add error handling in devm_kasprintf()

Pengpeng Hou (1):
      soc: mediatek: add missing MODULE_DEVICE_TABLE()

 drivers/soc/mediatek/mt8167-mmsys.h |  10 ++--
 drivers/soc/mediatek/mt8173-mmsys.h |  28 +++++-----
 drivers/soc/mediatek/mt8183-mmsys.h |  14 ++---
 drivers/soc/mediatek/mt8186-mmsys.h |  22 ++++----
 drivers/soc/mediatek/mt8188-mmsys.h |  78 +++++++++++++-------------
 drivers/soc/mediatek/mt8192-mmsys.h |  20 +++----
 drivers/soc/mediatek/mt8195-mmsys.h | 181 +++++++++++++++++++++++++++++------------------------------
 drivers/soc/mediatek/mt8365-mmsys.h |  20 +++----
 drivers/soc/mediatek/mtk-dvfsrc.c   |   1 +
 drivers/soc/mediatek/mtk-mmsys.h    | 300 ++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------------
 drivers/soc/mediatek/mtk-socinfo.c  |   7 ++-
 11 files changed, 321 insertions(+), 360 deletions(-)

