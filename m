Return-Path: <SRS0=K4vu=A6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BF7C7EE23
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 18:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CEE9EC4339C; Tue,  9 May 2023 18:09:58 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38197C433A8
	for <soc@kernel.org>; Tue,  9 May 2023 18:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38197C433A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-94a342f7c4cso1093140666b.0
        for <soc@kernel.org>; Tue, 09 May 2023 11:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655794; x=1686247794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXjeMbNlFty4Wu6Nx3i/5bDj9AhccjiXqRqHloLRrYU=;
        b=SsmMkRv8ExF0vFpzyDRKwiijGpPNDMPfk41gBcpL3Rf1xjVS3BpyDv61/26D/hNLD4
         4zlBticY2nXaXYb6U710X2Wsl/PO4tMxeJK92PDcUgPoz894sPpE84X9qNstsA4HehUX
         o6Mys+v3xgS752qrf7EtBobou0K94694d7jdg8gKUTEcugptTz51OqGV1My3G/6UnDSw
         Bl1uyb3xpQKT0FD74IwyZcHmsMCo/qiyPJKcostax3ZBzOjxEkbuqaH6wnEd44EjjkFh
         iStUahPL1DL4l8dLo7/SNuhsKeB7Md4CAg2LKB7NRbQUqAcaVqPahLlqdPGE6jT+fc2p
         1u+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655794; x=1686247794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXjeMbNlFty4Wu6Nx3i/5bDj9AhccjiXqRqHloLRrYU=;
        b=VC0O61w8bzu+E82nI0JP5HvSBXI0ywSi5U6BLezPHRC5Mz1H/rc8hjrgNwKk/XJCJ1
         WDJCuWE7b+4M541slbN9OQkq8MmhjMz0VlTPIPbVq4Ueh5cW6zRZlF6S1HR6TOY8Egld
         47smfLTuOX5LJ4aFXbwDLyd01FZqPeqMTLpEYPfjOfINyiChOsANinF51Ve/wF3DLsG+
         ZgSQ9mT+IUvAixicRTQPIGZ5d0TWdnl9hQqr81u/3E3ObcFUc1SgrnJjDZfqS+adfwk0
         LhYnKWAnAVCyZS5IRA75LRxUok3Q0ZwqyU8EJQWnpHoD2w70TagQEn/x4DTnl860q/Xu
         AFhw==
X-Gm-Message-State: AC+VfDz7m5mD1Cwy6was1qtRE4G80Q3Al919G5Pf1t9hIyTz/nF2zuIA
	Od40TgHJL7wrDHIkfkUJdXbQOy0sz8ioFyulkiw=
X-Google-Smtp-Source: ACHHUZ5XtO9xWsXdQK462FkDITWtLOlPWTWZE59msHLywpQRrhFOUzpovI44XB2HfWnDrQ4ydwWIbg==
X-Received: by 2002:a17:907:944d:b0:94e:fa56:a74f with SMTP id dl13-20020a170907944d00b0094efa56a74fmr12775313ejc.14.1683655794357;
        Tue, 09 May 2023 11:09:54 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kukjin Kim <kgene@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v3 12/13] dt-bindings: arm: samsung: Add Samsung Galaxy Tab3 family boards
Date: Tue,  9 May 2023 20:09:36 +0200
Message-Id: <168365575566.242810.11963330724766854967.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-13-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-13-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 May 2023 21:55:24 +0200, Artur Weber wrote:
> Add the compatible strings for the Samsung Galaxy Tab 3 8.0 series
> of tablets.
> 
> 

Applied, thanks!

[12/13] dt-bindings: arm: samsung: Add Samsung Galaxy Tab3 family boards
        https://git.kernel.org/krzk/linux/c/fd811cce9b92635799ba5c6de657e4a53c68adf6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
