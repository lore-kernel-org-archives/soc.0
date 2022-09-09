Return-Path: <SRS0=6JUn=ZM=linaro.org=naresh.kamboju@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9E5ECAAA1
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 07:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69AB8C433B5; Fri,  9 Sep 2022 07:35:25 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40437C4347C
	for <soc@kernel.org>; Fri,  9 Sep 2022 07:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40437C4347C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id iw17so1058563plb.0
        for <soc@kernel.org>; Fri, 09 Sep 2022 00:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kxmb/p4ktWi0LaVAY97x3wA4lwaARgi2y6i4pBXVFUs=;
        b=yjdQyDYXCkQEISvA2OJfS5zQAiKFez8uh7EkGE+bB+QXbyoZeRvpAdUhX9ECJYFXLy
         ZVydMLnMLqe+rMd14ACdgcomqshszupE3p2ZRckxL7TK3LPV/W2fjMBr4KmiparZN5d0
         FYsWwHKFUGwe8qaIqbdzkeSNVs4o5qDU3ZQDUAlgOVRUAlpFcGl6kPb0WEZZtyjTmoEO
         aIv7kEMYpim0e1B9RMIyTmvbKBsbdzMs5WtrBCfQ5RN7qeIJeU/hbhFSAUq3Uiu5CJOl
         9ElukId5p4IgxA5722sbVj841jPcpfTDItekZVuZ5yYum8hX010FjA6FEDJhc+tZtFWq
         h8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kxmb/p4ktWi0LaVAY97x3wA4lwaARgi2y6i4pBXVFUs=;
        b=X1fjypk9UGjQIHwdcKWuirJPkU/FTtOsNlW1Cuev4vaQHSDdMbeso2cfnZ7joIvfLr
         NCNYJaoyeU0ywVlMLcMbJRYvsyMCYufp57oJIACrri0ZtLxrBhFwGC3eiTShxoUswsnY
         wlBQzYl/E7+UAq4/rprePvUqhr721Rv7DQr0hnBh9oX+TiNwMnjYznt7/Uzp/+jP1Ym8
         1CVxHW5/MmreO44Oumvx5SLyT01Ftwke+lIc4SVq8ldm+TxdR/2bxqdNuadtDuawLoxC
         i7ZCT4Zoi49HXCBtvO/jkIbMDDjtq06gvq+18FrDBtkTpG0GjMcWs53IPiWE92S+QFAV
         sGJw==
X-Gm-Message-State: ACgBeo1x0XKrGvM7YlBl9pS/xXsOQKsK2j4rAnQFZDDZUV3J9i6NxZU4
	xWwiLjoOwcHMev8iQ87JcmG3MQ==
X-Google-Smtp-Source: AA6agR5/NUEdO/80jCJktybIQDOEEQirkfdWkcIHXIMd96UzV1ogZS/nFo3o+sgb9qn99Yww1m6I9A==
X-Received: by 2002:a17:90b:4b48:b0:1fe:35dd:d92f with SMTP id mi8-20020a17090b4b4800b001fe35ddd92fmr8001528pjb.138.1662708923523;
        Fri, 09 Sep 2022 00:35:23 -0700 (PDT)
Received: from localhost.localdomain ([124.123.189.206])
        by smtp.gmail.com with ESMTPSA id b6-20020a1709027e0600b001780cdade11sm456800plm.51.2022.09.09.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 00:35:22 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: f.fainelli@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: andersson@kernel.org,
	arnd@arndb.de,
	biju.das.jz@bp.renesas.com,
	catalin.marinas@arm.com,
	dmitry.baryshkov@linaro.org,
	geert+renesas@glider.be,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	marcel.ziswiler@toradex.com,
	michael@walle.cc,
	shawnguo@kernel.org,
	soc@kernel.org,
	vkoul@kernel.org,
	will@kernel.org,
	Naresh kamboju <naresh.kamboju@linaro.org>,
	lkft-triage@lists.linaro.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH] arm64: defconfig: enable ARCH_BCM
Date: Fri,  9 Sep 2022 13:05:09 +0530
Message-Id: <20220909073509.301363-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220906033957.4377-1-f.fainelli@gmail.com>
References: <20220906033957.4377-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naresh kamboju <naresh.kamboju@linaro.org>


On 2022-09-05 20:39, Florian Fainelli wrote:
> Commit 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom
> menu") introduced a new symbol ARCH_BCM and made all of the Broadcom
> SoCs Kconfig depend on it, but did not enable it in the defconfig.
> Thus, now the defconfig doesn't include support for any Broadcom
> architectures anymore. Fix it.
> 
> Fixes: 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom menu")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
