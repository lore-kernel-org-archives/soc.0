Return-Path: <SRS0=vNIe=RF=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC161C433FE
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 11:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EFD4C36AEB; Mon, 20 Dec 2021 11:54:24 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C25DAC36AE9
	for <soc@kernel.org>; Mon, 20 Dec 2021 11:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C25DAC36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F16ED3FDC3
	for <soc@kernel.org>; Mon, 20 Dec 2021 11:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640001255;
	bh=5eM8zfWkW/pWK8AnysGnJolct8dbP/FVpa+LnPDHIiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=hpqZXvQpsNkUr5FeeYuCdTeM7uCRqBbMGqvIflj5IrcDemIRNHBi8SvMpwa54n59E
	 jOvWHeyGEaSw8rFRdaFKYXyl9AgeODJw20YvEIyLGifMMFdpLuN1XdgimJF9OqTdQ4
	 UrgSbW0m5Sd8RE4u05uqSha2haO3qvRqyRQePvnm6et3mYWAPY5bFCUGpVVpVnPzle
	 l3aaM0qdDRZa5awrW+KIS7NItTKwWjCF6KHMABeN48DmbUHUMKAG3K7jh+Jb9rzC/t
	 /Iv1wr5ISTbu1egOm69g9n9m7iExPWrSTctRk8H7giA6qso5txYeVrSx5dG+ja2mYU
	 2hlB2pGIGI/8g==
Received: by mail-lf1-f71.google.com with SMTP id g18-20020a05651222d200b0042612bda352so123820lfu.11
        for <soc@kernel.org>; Mon, 20 Dec 2021 03:54:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5eM8zfWkW/pWK8AnysGnJolct8dbP/FVpa+LnPDHIiQ=;
        b=1CGvx6wKBAm4uAbZI1h2kfd7myO8GoWTC5+iRu5ZKdLqDRWmAlmUyls+Bgd2LJPDOh
         8Z7Y2tGXfmd0Vfg2CgLpGkW+qGVg6THaI4zUNP8Cuem5Wa03T5ZJ19vMCsvwl4hhGXw5
         QfWu9ZsFxerJjC85FiQBZOOCHNBsv1tSctIE+6sEbF1l4V6UpE9L9BsY7+AhcQAXlkik
         b+yIWg7s36q2cbmSsxdCIud0pl8qmpLCEWFP8cwVOQCPQVChzvmR7jFjKCiVLO6L8Fj6
         EJnubt+sD/FwqIIZiptiivV9Q4JO59uiSqOsn4OCtpZx/iXbYesWCTbuicxDVp1zScqh
         H3hg==
X-Gm-Message-State: AOAM5310AoopZiMcAS32syfyVEmJhmI9BRExjloI1TmhNmcDjFqkIREX
	vJQtbwBi/bMzLj+9MM1UkPqdIr6aF25U4ZWpCs5dHbNJ+1GzNSZeYYFHAhXuYOMgfTT7/IhVQmg
	TW0mS2YI3xgcq6f419K2p+l0=
X-Received: by 2002:a2e:8848:: with SMTP id z8mr14290846ljj.429.1640001254382;
        Mon, 20 Dec 2021 03:54:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyncoh05JrY8CfHDFYfJ23eACvQDvVEoyPx5BQRDX8S1cvSRccYHmnJfLGek7iKuSmCNJeorw==
X-Received: by 2002:a2e:8848:: with SMTP id z8mr14290820ljj.429.1640001253937;
        Mon, 20 Dec 2021 03:54:13 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a4sm2339486lfo.96.2021.12.20.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:54:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Chanho Park <chanho61.park@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 0/6] Samsung for v5.17
Date: Mon, 20 Dec 2021 12:53:59 +0100
Message-Id: <20211220115405.30434-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd, Olof,

Four pull requests and two separate, trailing patches (arm64 and defconfig).

Please see the "[GIT PULL 1/6] samsung: soc: drivers: for v5.17" for future ABI
break explanation.

Best regards,
Krzysztof
