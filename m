Return-Path: <SRS0=OhkM=G6=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B96C433DB
	for <soc@archiver.kernel.org>; Wed, 27 Jan 2021 18:04:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 212A564DA0; Wed, 27 Jan 2021 18:04:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CACB64DAB
	for <soc@kernel.org>; Wed, 27 Jan 2021 18:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CACB64DAB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id m13so2851001wro.12
        for <soc@kernel.org>; Wed, 27 Jan 2021 10:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=KWqNh8H9jxNujMamWE5tQ90c+C/64uDI1+7zlC8RlOU=;
        b=FvHguWbJZsfCtr97HAU4oObBcCxwx8i+tTMOp3CL+atazyIAjaiOB1RrudyWlAdY0P
         6YcbcYvX1RLD9UI35zd4tMLXT+pS0dpmnYQF2Hk5nFWYu5bcD9sfdPuAjmBaeR1ccC2w
         yxMQjX4QGcULH4wzCX8ODJTC29fQYxXULmPQs9YbTcwK9tUx0pv0gMAHtffGavGsdraq
         +cLjMwr0xEorOHm/zarnjJkmMlPtSnfBHNbTxD0h5gmBEO4iwNAJw0+Qqi2+yw+JbnHw
         AS/qBAwDjenxh7UDo+vv4+NlmEtO/eAtK5UH2s6/v8ovnUEz9OQ5mi38/4NPI9Xj5cGT
         4HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=KWqNh8H9jxNujMamWE5tQ90c+C/64uDI1+7zlC8RlOU=;
        b=XR0I+X2Z17HlyydGPDIAXm5FxyqHC3KArQevCEBVa/YXSq/rLNqS/z3x4FmooPQd+I
         o9LbKJgJlp8v/Qw4bTD9ywuZnkl6MwWK4glpjKrqRbBPfqsybg2OHAzYVwXeI6bfN9mT
         RF4lY/Tdz4j8NNp5zghaCtGAuXnNp3X1ldMJyQ6ni/SiHx0lnBYbDy3rXHgrDfjaz5Z4
         AiEf2pw8C3Tsn541zTss+l8EZLHHW0vzigCAViBRBuCR31/VW2YFgOiXj2vOdMnzs6u4
         OVmL/xug/Q3jjAZP+9t1c8TqPi9N7fgcZcw0+1ibJgDTrjLbO5Tdlm1mfPNslp8r+32m
         2rFw==
X-Gm-Message-State: AOAM532BWhXrm6kRCs8p8VGRh7ddQGNewMldnCRe4zQWlBaI3m93YxM2
	5B3e/MUykMll29cvDNglcW7shuMs0OXvmYq4/9U=
X-Google-Smtp-Source: ABdhPJzoVQF8wAyVtyXUunZs+vFdUnlobMjssvzSGi9p305OKTw5SJ11zXiYlUrdWtE/784foYAKWA==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr12423872wrm.143.1611770644971;
        Wed, 27 Jan 2021 10:04:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id r13sm3457725wmh.9.2021.01.27.10.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 10:04:04 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc (round 2)
Date: Wed, 27 Jan 2021 10:04:01 -0800
Message-ID: <7ho8hai7e6.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

Arnd, Olof,

We found one more regression in networking on amlogic SoCs needing a
fix.  Please pull for v5.11.

Thanks,

Kevin


The following changes since commit 7386a559caa6414e74578172c2bc4e636d6bd0a0:

  arm64: dts: amlogic: meson-g12: Set FL-adj property value (2021-01-04 08:03:49 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes-2

for you to fetch changes up to 19f6fe976a61f9afc289b062b7ef67f99b72e7b9:

  Revert "arm64: dts: amlogic: add missing ethernet reset ID" (2021-01-26 08:02:35 -0800)

----------------------------------------------------------------
arm64: dts: amlogic fixes for v5.11-rc (round 2)
- fix ethernet resets

----------------------------------------------------------------
Neil Armstrong (1):
      Revert "arm64: dts: amlogic: add missing ethernet reset ID"

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 --
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 --
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 ---
 3 files changed, 7 deletions(-)
