Return-Path: <SRS0=vJQq=74=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507E5C77B62
	for <soc@archiver.kernel.org>; Wed,  5 Apr 2023 08:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 381F1C433A0; Wed,  5 Apr 2023 08:04:45 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D9BEC433D2
	for <soc@kernel.org>; Wed,  5 Apr 2023 08:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D9BEC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5002e950e23so203760a12.1
        for <soc@kernel.org>; Wed, 05 Apr 2023 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680681882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knNBWU1tEPnpVgHr0NHSaq41CVWca8alYZPbI02km30=;
        b=UVfLyJ4U1LTTsw9/l2Ezvobf38cBIinJ6k1Wn4FHs5A3VFvzepgpOTTipJ0mhKt9hy
         04xhVwg5jn/MCno6zaKR2LEZR2MPT7jh77ipxI9CTKy8vyzax6saAN0iASPnRcHvz0/5
         VO+QDjmssHzCOHccG3SHDVEgcNrTHc3CPRJ6PyV7XAd31otafioMGfdCn/nhZp26xGWS
         4tCpHmaFlK2XwywMhmtoMQvP8cUPNoA54gCjNZel/0bCPAoMB8rpB2hStnNFZCScSHvj
         7/sQLhYpujqe4RydsR2eIB7JxXDh0H7gnhFMXBsXwpAfSWMOBmkJGh7Naivou/PW+6hS
         nDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680681882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knNBWU1tEPnpVgHr0NHSaq41CVWca8alYZPbI02km30=;
        b=GcTbj5hgUpet3wfCit2EnhLKtQcRrf+V/UcBmJSxodbKvkrOOSLWLkkFtFCHVB0d6G
         lTidfQVANdjH06+5tx460Wonz434F8fNFDV6JL4cHnEcc663ejz3Gkn6HsrWtQwOc1nH
         BGZ3SHdHVWrhrBPtJKa/LxgtuSJwVckE3spSKbvq9odVwGR8LTWzEp+WXWkFcaOkJujF
         MQ9FLlI5jxDHaCjoasuoTmEFuK1F//eJbFF/Ly2zSyj9q50MS3bxqghctoSgFf4GsL7Z
         K8eYUA7gkDKnMv+eO13Rr5NOSmczZmIjoGfkgsxnVCxI7VfaIGNJJi41bgzMGQUqi1+l
         yY1g==
X-Gm-Message-State: AAQBX9eaUGPaotdsH2o00yvGZK8KOHk0orCbaagtf1+0uI9hNuBxjZ83
	0A35O04W3q6raTZcWmFEr7uRVw==
X-Google-Smtp-Source: AKy350bgJJjBqVOKkAvuIHFoVn9ZmTBnPLaEXXwVS1XU/9ZvvW5IptbzaN4hC9/iTQUPBMsKyVCmDQ==
X-Received: by 2002:a05:6402:202a:b0:4c6:10a7:c422 with SMTP id ay10-20020a056402202a00b004c610a7c422mr1122764edb.18.1680681882390;
        Wed, 05 Apr 2023 01:04:42 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id z21-20020a056402275500b00501d73cfc86sm6845839edd.9.2023.04.05.01.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:04:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: samsung: soc for v6.4
Date: Wed,  5 Apr 2023 10:04:38 +0200
Message-Id: <20230405080438.156805-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405080438.156805-1-krzysztof.kozlowski@linaro.org>
References: <20230405080438.156805-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.4

for you to fetch changes up to cb56f508e541036ad41cb9a5afb46339b2f83b9f:

  ARM: EXYNOS: Use of_address_to_resource() (2023-03-22 18:47:01 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v6.4

Cleanup of OF-related functions: use of_property_read_bool() for reading
bool and of_address_to_resource() for mapping MMIO.

----------------------------------------------------------------
Rob Herring (2):
      ARM: exynos: Use of_property_read_bool() for boolean properties
      ARM: EXYNOS: Use of_address_to_resource()

 arch/arm/mach-exynos/exynos.c  | 8 +++++---
 arch/arm/mach-exynos/suspend.c | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
