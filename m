Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCDD375AA1
	for <soc@lists.linux.dev>; Fri, 20 Mar 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997007; cv=none; b=qYe5Zw5ItMCXS9AAOdWKtaTtTIbTk4f85259UKOzZZwsXa/XrE46i8iRj+vwG5eIXkCUlRsaglgZuZTVPzZ1I4d6yr98jNHwi8slZ8LZuE7N2bBd7jbh2fB52XOLOdrGDIn/xtzRYC4sRYnk3bKW+j0/+C7atb+jF7P7dPPpvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997007; c=relaxed/simple;
	bh=2xo0ML235ABXW/CQP4Ky6ewJNiBSyEYkOwlyRrA3YTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQJPI/iHhgkrc9D3H58UrqKNhAQDW3SZCHQ8lfcUPDRfJKAzjr5tgFmiyjJd7CD1fdWBKfeIgUCshQnU6jr7l1piBHGdG+noxDE793X4C4Lmi+Gnm/iBTEZsEcKcl/gFyLT5U0TdG8yrH5vupDivV5Hxc0WRK4WzsZ8Ut+1bsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Hsr/1rBo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Hsr/1rBo"
Received: by smtp.kernel.org (Postfix)
	id CDFB7C2BCB0; Fri, 20 Mar 2026 08:56:46 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7140DC4CEF7;
	Fri, 20 Mar 2026 08:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7140DC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773997003;
	bh=2xo0ML235ABXW/CQP4Ky6ewJNiBSyEYkOwlyRrA3YTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hsr/1rBoPuEuoE4lyU2jnsbbtkfrALPLDbjpwVSV8r6wMvf8jZZ8xiwp9gVFrnb3y
	 rA9V9yG2oBq2ysJ37mC6UQzfoVvkdKxmV9JMUh6+O8CBszWEdnBc51YF3s+K9iW0Gs
	 oU1E4nQ3CqYX7reSoKvYbqsxbP5MfVLLxpXf65f4XHenCtziqYFXqeRywIwf3DXikn
	 Df0iBBU/Q6un1+Co59Sa+2M7eWYrpqLLOcfJM8D0zVakrNupP8ctkuxUW6rxWgwmKX
	 SDiZVXximvEKryF5HHQvOnWeaaPpCKaiFPqHaWdvIlnZ8OFNfN+/TVl523/jyx3eEu
	 udOJ+IxXzmiiw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70E1717E10F4;
	Fri, 20 Mar 2026 09:56:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/2] MediaTek ARM32 Device Tree updates for v7.1
Date: Fri, 20 Mar 2026 09:56:39 +0100
Message-ID: <20260320085641.15843-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
References: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v7.1

for you to fetch changes up to 5978ff33cc6f0988388a2830dc5cd2ea4e81f36a:

  ARM: dts: mediatek: mt7623: fix efuse fallback compatible (2026-02-24 10:34:47 +0100)

----------------------------------------------------------------
MediaTek ARM32 Device Tree Updates

This adds a single commit fixing a dtbs_check validation error
by changing the fallback compatible of the efuse node to the
correct one in MT7623.

----------------------------------------------------------------
Rafał Miłecki (1):
      ARM: dts: mediatek: mt7623: fix efuse fallback compatible

 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

