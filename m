Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AB47F2DD
	for <soc@lists.linux.dev>; Wed, 23 Sep 2026 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159561; cv=pass; b=GhS3qHsX93zShYtcw8N6mYj837LtWEWbk7jf+0niPBTwXf/1GM3KA6ocL+K/cEcXa6LDKT2aYgQBH6F0Yjsj/IUjjYysSBoWCR8INZv+7OiB31IF8YyKxNl1a+MSnnxRobtHRf+/K4yHyF6U/wcyVVHW0YGdnBh5qj+f//IsVjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159561; c=relaxed/simple;
	bh=988dhDBtd7g+tpgVz0uwEhaGJxjatXUHLGg6/ZegZJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtkNCOSbbf/9FF1ivAelJ1JfAEEMlWr02TYOx1ndoVGHLVBwSPoR4gIDEPGvuyqpjAb5aHr5Tv9LuXPjAXFpxj8uHCVGkGoXmHrIenmv+X6+Tdj8AUFFMICSjB2iQCGcez1t2o9wqHs/Imauoac3F9i486oQU4ijl9vz4B9C/T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KLTpos7r; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KLTpos7r"
Received: by smtp.kernel.org (Postfix)
	id C24681F00893; Wed, 23 Sep 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790159548;
	b=WnpngNrGnhyKtBDs87N6YhPVwClw0HipBQJJjASV2YhF3pxtpYmljn7zSU93GguqO75l
	 ujSlDiTbObnVMx6pJMBPnm8vawXObWzsNHTXFey1SwQOCFmNSuCikSh44QTXQRYmMVKCF
	 a/rhHrbYRGR+blFc54JxqzgVhAvqJYZmY0djp5oFd+IpZ737yK5gSMOA5htbDHLot7VZ9
	 3+GGWzqng6z8psDe03ighBLeexhq4poO0baeMknSJ22k+MsjzRJraAehs1cxKCH+jOZwf
	 ZNCf7q7BJUirISJhPBZM/VviAT67zjbePeQBMFZTD7Zkvo5yhvHrwci/BMmfCf2x0Rg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790159548;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AoaZpaOhxJ3jsXpsRX7MsSfy3c9E4uGe0ETxzBg6RFg=;
	b=ooXT1GzUXw5zHeSGU5qT8YO5Zg7Q1hAkfA5mbkALLdTW89lllkMiO6KDAKQy8RCnAt04
	 zl5h37Mg4YHpfWwqGnHeJ5J0JL0SdMZWMff3al8Qh9/0oJX8PPeBYSu7WJ74L4zkxymtb
	 4sL2Z0bZNvxcUXyLXHzXeg/ba5UfCKqQbZbZmd+l6kO73IEItSyE78io88OXES8TEv2GM
	 ps7sWICHBqLanjMZwLWXe+HrqJhadj/QLuM39les/x0bXHq9qvbR+qAUntgGSD2TPPeJA
	 ee9uM6vBlaGVrW6Sc9BAxI+Dnl8L1o8hKoB+jKwKcoHWwfV/FQIyzIAv9XxxnaWtxww==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KLTpos7r;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 012151F00898;
	Wed, 23 Sep 2026 10:32:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KLTpos7r
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 012151F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790159546;
	bh=988dhDBtd7g+tpgVz0uwEhaGJxjatXUHLGg6/ZegZJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLTpos7rUO64wlQRUWMGS63EqfFNAxOjxjY+SPUd2fHlX3gSgVmrvD6wpOuHm9e/Z
	 J3O4oOVupFjMyzzXuUPv7dS7mRfEaZpgz3LWZQ1/zWoy+bguQ9QHaljA4As9bl4TtQ
	 NronXdNzZMKfXhfh1laq5VN6SmGBE7JCmQ5F8Mt1tMghwWm57iXba7q6XZVTzHKH9f
	 Qy3nfK8bzoVB1JHXWzUbdw7hFrRmNc6ym/B5jVJjYaYqBTfJPwToOm8LGql720N81v
	 TGqP6bmWqVRBZE8IWyu9pds7gOUkoW0tdBczdOwhzq3fa65zoKisSADme2T5ShAOrZ
	 BV6UkDnRIbotA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 504E317E020C;
	Wed, 23 Sep 2026 12:32:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,3/3] MediaTek SoC driver updates for v7.4
Date: Wed, 23 Sep 2026 12:32:07 +0200
Message-ID: <20260923103222.25504-3-angelogioacchino.delregno@collabora.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v7.4

for you to fetch changes up to 96c2b43b1fb305e91700f64e9f758fc140c66b83:

  soc: mediatek: mt8167-mmsys: add routes for all display paths (2026-09-21 15:10:28 +0200)

----------------------------------------------------------------
MediaTek SoC driver updates

This adds support for GPU<->SRAM regulator coupling for the
MediaTek MT8189 SoC, and introduces more MMSYS routes for
display controller pahs of the MediaTek MT8167 SoC.

----------------------------------------------------------------
Justin Yeh (1):
      soc: mediatek: mtk-regulator-coupler: Add support for MT8189

Luca Leonardo Scorcia (1):
      soc: mediatek: mt8167-mmsys: add routes for all display paths

 drivers/soc/mediatek/mt8167-mmsys.h          | 183 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 drivers/soc/mediatek/mtk-regulator-coupler.c |   1 +
 2 files changed, 175 insertions(+), 9 deletions(-)

