Return-Path: <SRS0=4j1D=AF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F2EC77B72
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 14:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F177C433A1; Fri, 14 Apr 2023 14:06:25 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BE8DC433EF
	for <soc@kernel.org>; Fri, 14 Apr 2023 14:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3BE8DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id bi41so5415509lfb.7
        for <soc@kernel.org>; Fri, 14 Apr 2023 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681481182; x=1684073182;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw4R9yF5pQV1g0wZt/lit2ez2JDvjqS5l1RKTEe/yxA=;
        b=S/CAvV5qAVCU/68x1axECLEAe/g7GF0gwATiwlXa/MXUYeHCZe6NLyB2CvuL7D7TeD
         vAB2nrq0EfVCHofdXLe6V5V2vSBcZL3sgML7Kdk6d+wjIqBS97Y2ybS2M+I0w36P0AHT
         tUgAwsHOM6wm05erIWgSb1oQD4AkKWot8mhpRjRY5voxnvWZgd1VP93stZH8FPCjB1KC
         hp3M8Q6/HOkefIK0xXasqkEAcK9mEYtnmwyM4PPGB3SBWXUs9PIX8bE1WAzICenwIF9w
         NDQsSHv2kwWk8HYEsuwKxdLVz/OxiJhe/IgUHS+GFSZE+rzMH0NnqMpoH9WJdkO0pB2P
         Lq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681481182; x=1684073182;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw4R9yF5pQV1g0wZt/lit2ez2JDvjqS5l1RKTEe/yxA=;
        b=MPx13kNE8jzj1/wi6Z6tjBqb+O5uzNfqbH91RD8HTeXVNAe+Q9ukmNQyoVzy4HJhq7
         olM2e4C3NXgT7TPz4333LFrUu9xGdUooVj9sW5Z0sIWMJPvyXtcjhrYHFoemSlRrHGDk
         LqhjDgCB9XmStxhvHVmz3/mLVuhBww/FN5p0Wt1fWutWvfs1iTev7Wb+krMtZWZvz1k/
         sLTrp36oWib7N8RyF44v+Fm3KastovkzTlJ50dzAPtEb37cxHXOqZnGHuQLFttPD+4h7
         Y6TTAGR1CCMAqlHPWJz4KDhIV1LWfv81NvwIq6DVhaJldX51hva3lxE8b5OqcV8WOiTZ
         Lv3g==
X-Gm-Message-State: AAQBX9eoDdGM7Q+KWtc2iN57jpjHzEogosjCOiDbL8vQ4wqOgFvxtJZq
	EcgATAApoowZI6pMDAuVSVok0w==
X-Google-Smtp-Source: AKy350YI2myKORD+1bBf9V0MVzMF6Dl8kIb0e8hd0klWyNZrgM7mWlvudofzXiQ82QcQd3mDvU9acA==
X-Received: by 2002:ac2:5488:0:b0:4ec:7973:1ac with SMTP id t8-20020ac25488000000b004ec797301acmr1600070lfk.22.1681481182231;
        Fri, 14 Apr 2023 07:06:22 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b10-20020ac25e8a000000b004d856fe5121sm808794lfq.194.2023.04.14.07.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:06:21 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/6] pinctrl immutable irqchips
Date: Fri, 14 Apr 2023 16:06:16 +0200
Message-Id: <20230414-immutable-irqchips-2-v1-0-6b59a5186b00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhdOWQC/x2NQQqDMBBFryKzbmASI5ZepXSRxLEZ0NTOtFIQ7
 97o8r3P42+gJEwKt2YDoZWVX6WCvTSQcihPMjxUBoeuRW+94Xn+fkKc6iDvlHlR40yHbcSxv2L
 vLdQ0BiUTJZSUj3iglabDL0Ij/867+2Pf/zipgBZ+AAAA
List-Id: <soc.lore.kernel.org>
To: Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1

This is the final set of immutable GPIO irqchips conversions
for pinctrl. All done by trivial thinking.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (6):
      pinctrl: pic32: Convert to immutable irq_chip
      pinctrl: pistachio: Convert to immutable irq_chip
      pinctrl: plgpio: Convert to immutable irq_chip
      pinctrl: qcom spmi-mpp: Convert to immutable irq_chip
      pinctrl: qcom ssbi-mpp: Convert to immutable irq_chip
      pinctrl: qcom ssbi-gpio: Convert to immutable irq_chip

 drivers/pinctrl/pinctrl-pic32.c          | 36 +++++++++++++++++++++---------
 drivers/pinctrl/pinctrl-pistachio.c      | 35 ++++++++++++++++++++---------
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c  | 38 +++++++++++++++++++++++---------
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 24 +++++++++++++++++---
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c  | 35 ++++++++++++++++++++++-------
 drivers/pinctrl/spear/pinctrl-plgpio.c   |  8 +++++--
 6 files changed, 132 insertions(+), 44 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230414-immutable-irqchips-2-503b0f780741

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

