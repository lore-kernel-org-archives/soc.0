Return-Path: <SRS0=MT2l=Z5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFA4C32771
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 10:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88546C4347C; Mon, 26 Sep 2022 10:44:05 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4F50C433C1
	for <soc@kernel.org>; Mon, 26 Sep 2022 10:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4F50C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id a8so10114099lff.13
        for <soc@kernel.org>; Mon, 26 Sep 2022 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=bAkC/5EhMydvusKw4x8gqMb/4C/GgXVqhEpf5Mgd+O0=;
        b=pMVX6OCEV5xca7iP7H1U/l/XUIjwsbwYpOZhD0Vk8zPIBv3dBXTlE/ZZXvtoRKF4qI
         nWKbN8YJFSlkfyLxqSrVfC6Ddyge84q7KkCHq+Z3YkYtUFJ5jSB8uIkpwLaMcPtOvl3d
         TY3tV8hfG/fbCEkohLvS9Or3bg7qkqhsusZE7s0QCD8daD4H2i313uA8ZlenbOSHlEuh
         bn0z4jRcJD/c7ccW8qKl65ebzxu2cLBmSiA6rmwIb1cpdhgVb2thJyM1Y1RjiwQrD0jr
         UPwvU8oAqfJbcfgPymnrovUEvqp9CrSeanTfligziE+1AdONA3CQltNo1bcI+VkdjDo4
         81aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=bAkC/5EhMydvusKw4x8gqMb/4C/GgXVqhEpf5Mgd+O0=;
        b=vi8EQgZWe+NlmRQq7yLcCD8ThoBQ2GApDdX3GXsvaXmFOb41bCW1TueTc60is+AXrH
         Nn8mV/+h8TkliJ5+d+QVyDLaSAOarvh7qRMs40M3P93xBr3N6ejjNiBN4YTw5aPoII8s
         n2yOi/Ts6GSUvBJ/Cgf3li+g9sfmTljf+TFuwVl0Zmu6eo4PJ/udqzh266BXp2jUEjfR
         PubBbBZkFwqlES0eGE2CDrzBrfLGcizW3Kudmj/rKRTNxiWtEJ46k94wCu2xICVFzBqX
         VI9UeHtRivH9QWMw2eU3FA5dgz7Bmdyt4k6XorPdn2RvNU6WLkFNwPlxL7RKwbcuG7GR
         4pRQ==
X-Gm-Message-State: ACrzQf31csfWG4Znij5BA6bQkzLyYghOWCsaJmYL0G+msxLg4sr2Dp6v
	QaupUrjF9LPcIYHpiRwChyYWBA==
X-Google-Smtp-Source: AMsMyM4Nfn6b4ILBSLFgD2196HLA3V4ld76UntR6VJ9hoyz4eIomwtEn5Je2Da0hOv9MQdgc/ZlCyw==
X-Received: by 2002:ac2:4e09:0:b0:499:1e3a:54ab with SMTP id e9-20020ac24e09000000b004991e3a54abmr8257161lfr.170.1664189041936;
        Mon, 26 Sep 2022 03:44:01 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y1-20020a05651c020100b0026c423959desm2313408ljn.25.2022.09.26.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:43:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Subject: [PATCH PULL 0/2] Two patches for next cycle, v6.1
Date: Mon, 26 Sep 2022 12:43:52 +0200
Message-Id: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

I got two remaining patches for v6.1 - DTS and ARM/mach code.

Best regards,
Krzysztof
