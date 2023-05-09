Return-Path: <SRS0=K4vu=A6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1A3C7EE2E
	for <soc@archiver.kernel.org>; Tue,  9 May 2023 18:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79913C433D2; Tue,  9 May 2023 18:09:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA590C433AE
	for <soc@kernel.org>; Tue,  9 May 2023 18:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA590C433AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-50b8d2eed3dso9644063a12.0
        for <soc@kernel.org>; Tue, 09 May 2023 11:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655784; x=1686247784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs9IksAZdPUWZueIWev0YHwP3SfwTJngjTY4HAluqu0=;
        b=k3tXANjes4g05zH+EiJsegWVxlkJzp41oNY3t1dshZB/kkJLq7LyekAftEzAadwf3U
         10Xc91NiUZEeq+UdneApZrEHyTkl18baPlYBxM/jJeEzJTpktNxhLwWB8UP1qMZEHRPP
         HxZ9j5syMXIa5W2CbsnzlM1ZWiauPeJOXuaDRRlY/2ZAjQZtsUVKpNWe9Lt9owhhEF5c
         dpwlWcc7SNI1TSBZMLrOf6Z0ZsQIdhhkXzypjItx/lsFs4Sn5+HRI7IQkvdtCLTBPZnq
         aq18PWOcv/9gofTZDflgIF2QuHx4juSZoxnRcJYpN0IqRzVl9KB/HAParfVePmCfOVAt
         DiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655784; x=1686247784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs9IksAZdPUWZueIWev0YHwP3SfwTJngjTY4HAluqu0=;
        b=PS3FyBszERNh1WFtPFB6JeDsZPR3f1RXDRfJZkT30H4wEHiB1iA15RyvA7AzUNyGjz
         f/Jnhps6wlnf7nnlUdLY1Ewns1RIYNnrLRLiM6OlGq7xOjMPIyQuZH0tJoklCA0d/wrB
         5lnigT2Rf9Y1z+M2ZSjPfy33QcIKDWoeYz99bCWf/dueoToHR4OOCvbVXxVRondNuHRp
         xyEktdm2lShMchb1+UwKCJ76bn/GQOtg2J4mQun7jZ/YKEYhuZgb0Q0MhkWRRM4L3AAm
         duBoVwL8Qmcb2tkAMvO7hi2Q5EmlJA37Ino7bD/uo2/gvpuKcwM9pqnnqjDgUC41S/Dz
         D5cg==
X-Gm-Message-State: AC+VfDweEhQB87IxUvxQe2zTtmwrcP9ftbfBMk9Ef3Y/3e4Xw0tI5+D5
	W0o5Mw58y7T6zqxzo32wZlkhJA==
X-Google-Smtp-Source: ACHHUZ5e5xBUZoC73JkHOAuYZol8+WzHPQzUCswmjDbXMuKS2byDzPvO1tY0/0dKFOjnVbNh6oDCWg==
X-Received: by 2002:aa7:ccce:0:b0:50b:c085:1991 with SMTP id y14-20020aa7ccce000000b0050bc0851991mr11920150edt.19.1683655783875;
        Tue, 09 May 2023 11:09:43 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:43 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v3 03/13] ARM: exynos: Re-introduce Exynos4212 support
Date: Tue,  9 May 2023 20:09:30 +0200
Message-Id: <168365575564.242810.13469552889679829335.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-4-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-4-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 May 2023 21:55:15 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> back the relevant code.
> 
> This reverts commit 9e43eca3c87476f75680f472ff3ebcd85f357b86.
> 
> 
> [...]

Applied, thanks!

[03/13] ARM: exynos: Re-introduce Exynos4212 support
        https://git.kernel.org/krzk/linux/c/4e486a650162a20e5c3c7987715f8297c84c85f4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
