Return-Path: <SRS0=dTNu=TL=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B24AC433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 16:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1347CC340F0; Mon, 28 Feb 2022 16:43:54 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B07F6C340F1
	for <soc@kernel.org>; Mon, 28 Feb 2022 16:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B07F6C340F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F272B3FCAF
	for <soc@kernel.org>; Mon, 28 Feb 2022 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646066631;
	bh=z46ftlWp8HVzXGwdCryYKmM/VWtrNM7xN3TT5iDqJdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ureyj2Q+zwI9j11xyAgRf42XkdCdeHShp2UjWyjEZVrGz0xU06ebQzsYhYqFy0usg
	 G0mludPdBKtP4qCRjnzLogq8i11zItgsfKcrv6UGL1vlpLVaGw5+P/t3lk/AtffrdX
	 ussT3oEs8mhn9ZWgziXiu4MaCHBTD7sRcDZEIOx2iU28GVzlh4x8mxgwBg5io2aV4U
	 vIID9JWXZBz9fFgKqU/eJowVqIIbtky1is0NZOV7pABPuEqKWXyFc0o3DgroGBt1/0
	 87INkXV3XNI5MFRIXYCC//UVo/ATi/cy1adH/KYcQ83Mp+tq89M32Zsn/+5+IWCTbW
	 eLS8H+vANsD8A==
Received: by mail-ej1-f72.google.com with SMTP id k21-20020a1709063e1500b006d0777c06d6so5469133eji.1
        for <soc@kernel.org>; Mon, 28 Feb 2022 08:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z46ftlWp8HVzXGwdCryYKmM/VWtrNM7xN3TT5iDqJdM=;
        b=YBqeGQPzGFfmFio9gPK1dC85igSvdZ8y6S6zSF9kcsZGM76OfVZSqbwcZ6cw9+B+SA
         HGlSL7YSzzuEeInL/aD+fBcK7S6fAr24cQixmDC6Xq/HVDhE033W+lXXL94Gk+5tWwl0
         8Q3S/Fw/SyghtzD5LWKs1gC0Z6b1DxL59DsliPQPNXz/P4+GW2+7l+s1cO23yHakF6MK
         Sx0cnQDHbIGGgHdUybxQqx22G/2kUrc4j82annjZOcIc9OKKMkJ4VXix40y4f0j+atCC
         3UUIpdqSZF6pBXfxT9hxM43/tTkajoqOR7zHmM9zReijioXxso0L0iNzh1wU9UMHXzfU
         ppWw==
X-Gm-Message-State: AOAM531FNVMIutzMg4jpvDR9anOxlZAZlO+oPOzRNF95Z2herzlDtS3e
	jilfcPrNauGjzJE78KvlEpjiJfGK6CU9i85aQeAM64jB/31E6arXIfu4DUlSow8AX68Vy0Up9qQ
	+y19rKlRVfjm4xDkSJSl61i0=
X-Received: by 2002:a17:906:b887:b0:6ce:36cb:1e18 with SMTP id hb7-20020a170906b88700b006ce36cb1e18mr16005108ejb.95.1646066630386;
        Mon, 28 Feb 2022 08:43:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyihmYLKs3hjWBogsCiEne50Bxk+AmKd7XUPOOzE57p2CEzj37GAswbJS4yucW9/3uChBQZMQ==
X-Received: by 2002:a17:906:b887:b0:6ce:36cb:1e18 with SMTP id hb7-20020a170906b88700b006ce36cb1e18mr16005100ejb.95.1646066630153;
        Mon, 28 Feb 2022 08:43:50 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id p18-20020a17090635d200b006cdeef01456sm4498443ejb.163.2022.02.28.08.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 08:43:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] memory: mediatek drivers for v5.18
Date: Mon, 28 Feb 2022 17:43:12 +0100
Message-Id: <20220228164313.52931-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220228164313.52931-1-krzysztof.kozlowski@canonical.com>
References: <20220228164313.52931-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Mediatek specific branch.

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-mediatek-5.18

for you to fetch changes up to 12fbfd665fc473800d25d0f3ca4617c82cff42dd:

  memory: mtk-smi: Enable sleep ctrl safety function for MT8195 (2022-02-08 09:29:25 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.18 - Mediatek SoC

1. Several updates in the MTK SMI bindings.
2. Add support for MT8186 MTK SMI and improvements in support for MT8195.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      memory: mtk-smi: Enable sleep ctrl safety function for MT8195

Yong Wu (7):
      dt-bindings: memory: mtk-smi: Rename clock to clocks
      dt-bindings: memory: mtk-smi: No need mediatek,larb-id for mt8167
      dt-bindings: memory: mtk-smi: Correct minItems to 2 for the gals clocks
      dt-bindings: memory: mediatek: Add mt8186 support
      memory: mtk-smi: handle positive return value for clk_bulk_prepare_enable
      memory: mtk-smi: Add sleep ctrl function
      memory: mtk-smi: mt8186: Add smi support

 .../memory-controllers/mediatek,smi-common.yaml    | 32 ++++++-------
 .../memory-controllers/mediatek,smi-larb.yaml      | 19 ++++----
 drivers/memory/mtk-smi.c                           | 54 +++++++++++++++++++++-
 3 files changed, 77 insertions(+), 28 deletions(-)
