Return-Path: <SRS0=312b=AW=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1008AC77B73
	for <soc@archiver.kernel.org>; Mon,  1 May 2023 19:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1F5EC433D2; Mon,  1 May 2023 19:55:43 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1043C433EF;
	Mon,  1 May 2023 19:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1043C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-94f32588c13so498038166b.2;
        Mon, 01 May 2023 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682970941; x=1685562941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLv8sGaRe8aHSb+AdoBzh5LujY+igvlve60gkCrF8RQ=;
        b=C8DMc4JaKQvEjKgY9hBY4KRgwbrWrCzs43/QY8dxNhRP0YphFClq3AdINz2tDHQkWu
         gMokCSa26p16KAHxdYKlTeHd8qy9WYhXvLhSv6Ad0MKTdfbEmIRFhSiA3ULMZpLJABCd
         ddHvieNBYQB3yNcab8VPPrwNEV6uAC8QyRWJe4jEpizd6st7gKM75djw6xqgQbAIiQr7
         ayrUHj0YgVH9d4aUDDjemsNQ2HrGhXZyNncB2TnMCrt7RlPB2dRhZ/9jhNRT3Nc0VBZD
         mvMfk4u/Vse7gKlpRyBtVsGhn8idQNWAgsUwmZkcM4NZ0rDr8NmOSS5vWkUdXRZLbkmK
         psnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682970941; x=1685562941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLv8sGaRe8aHSb+AdoBzh5LujY+igvlve60gkCrF8RQ=;
        b=V8nLEjYJjzlf9nm99Rh6dbAnIH8FEv679qNqVABJ8IXJp3jNAKPO1oUqiBTKWQFauo
         3TgRwM5O+tTNvqsFtm+pRe8La79zEKZovVVZKt1d2Ta/xoo2ixUJ6NM3YNc6EKD1CrlC
         BOA6ca+DqSJ8VmUQe2m9wzkKBNAT7aUdO+CHU03sJLpqSbh5noozkPnxs8O28Yvp7vEB
         BqMoO7DqjSDDo+pQGOWUcaiVeM2r7Rf26JOVacrd6B79KkDDxkkbWwqGKDAbAnDhQaH5
         uo8voWzZesWn5wq/n4oncRSuXj9/ZCaheK6TBg8uyk2fZW5LUBbyhFHa0qaZ0GpCUpdP
         18zQ==
X-Gm-Message-State: AC+VfDwC8pr2HqiG7dmqS49V0bg40ZVMmx5DocTZlM1PHrNrnDkJvJ2o
	sJKn0nbWZlvcHbwOYVVklec=
X-Google-Smtp-Source: ACHHUZ7ocgZuC4FvvCMO40aJHJVgOYPYQUBdNycXgNijS5wGRU3ojlIhqdgXy5nJafD8RS/+RbwixA==
X-Received: by 2002:a17:907:1c1a:b0:94f:4102:25c8 with SMTP id nc26-20020a1709071c1a00b0094f410225c8mr14074942ejc.61.1682970941016;
        Mon, 01 May 2023 12:55:41 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl. [83.8.115.30])
        by smtp.gmail.com with ESMTPSA id og36-20020a1709071de400b009600ce4fb53sm6333650ejc.37.2023.05.01.12.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:55:40 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
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
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v3 05/13] clk: samsung: Add Exynos4212 compatible to CLKOUT driver
Date: Mon,  1 May 2023 21:55:17 +0200
Message-Id: <20230501195525.6268-6-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501195525.6268-1-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for the Exynos4212 SoC was originally dropped as there were
no boards using it. We will be adding a device that uses it, so add
it back.

This reverts commit d5cd103b06f9d766295d18798de484528eb120ea.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index e6d6cbf8c4e6..326d5fc58727 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -55,6 +55,9 @@ static const struct of_device_id exynos_clkout_ids[] = {
 	}, {
 		.compatible = "samsung,exynos4210-pmu",
 		.data = &exynos_clkout_exynos4,
+	}, {
+		.compatible = "samsung,exynos4212-pmu",
+		.data = &exynos_clkout_exynos4,
 	}, {
 		.compatible = "samsung,exynos4412-pmu",
 		.data = &exynos_clkout_exynos4,
-- 
2.40.1

