Return-Path: <SRS0=kSmn=73=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BABC761A6
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 09:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7228CC4339C; Tue,  4 Apr 2023 09:18:08 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69920C433D2
	for <soc@kernel.org>; Tue,  4 Apr 2023 09:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69920C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id i9so32040873wrp.3
        for <soc@kernel.org>; Tue, 04 Apr 2023 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680599885;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QpzS8qNdlSXVjQMluisTzbchwdXKzq7DzhdFD6+hyKU=;
        b=eE8UnX0zBUXwyOIeP2DoMjW2EaEeq1OTBsZbgot3ZCn6zybYB+jGsGu2Rf1DyZjc4w
         VBmlFACJRcwo1hPMJdJNSjHtLClzT8RSz58GlDbE8tVenbKsGlWtlrOKIXPD0LmxphSX
         vddbOwAHW/OxD7F6EewtfgOKF7M9qS+DCQyYLIv8Yw4PRrycYTY8duJptDMAwOPhXGYa
         ra/m5hSuK6k4upef6QeS49x3Jt2KXWl/6vj3bgXf01/wNSancBfxgg90YfGSYIXdVrHD
         UDJ+s5Ujj5WpTq+nibn4p4ftM+IlgLHGwMCfBwHyDC5bfD8wDKwjL35njumFlGlwc8um
         Jw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680599885;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpzS8qNdlSXVjQMluisTzbchwdXKzq7DzhdFD6+hyKU=;
        b=i2QJgC7M5+P3ewQtdrsGFY8vGpEIt71l2NtHuM4CBty+CkWHH8NQkZQ130JH5rKuJk
         kS+i70cu7RL8CkCvBtSyLQxVafd40Vxxuuly8kMazc0/eoh3WuzhGtXh+uHtHIVgIudX
         AlLFsETeSf43Xm/Kjt7yuLhT1TVsweWc31UrNUk3IZ5CLqJ+B96FuON2KUoSOS9kxbQd
         R/tckoPDV2uGMkKxbhoRHrDaJMKWNNzehEQqCoH/qVT7/fwFEUeC8z7+OAi+VVOxo62t
         VQh6kOQjiD+pzw7PFpiRgD/KWgaAlEwm/WyEEPZMyIksdwqeNaZNmjwqPWK1o1pTr490
         19cA==
X-Gm-Message-State: AAQBX9fiLw5Cj2g5yywcZSCGoxrPePI/CY/FXwmRV4EDn8jlYFpTizSc
	mX5KUMhJ9wEXYan4gqYQdcCMXNFBnR0hjSxZh3/mYw==
X-Google-Smtp-Source: AKy350Ym5aBKy5Ri/SboTD+Oqk7FT4AdoBGBIAkpe5rmvTJKYcyZuXdngw/swZVuGRbY1i3YVfb19w==
X-Received: by 2002:adf:dc8c:0:b0:2d4:53d7:ea7f with SMTP id r12-20020adfdc8c000000b002d453d7ea7fmr1182804wrj.3.1680599885499;
        Tue, 04 Apr 2023 02:18:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5136:bca8:1616:ba77? ([2a01:e0a:982:cbb0:5136:bca8:1616:ba77])
        by smtp.gmail.com with ESMTPSA id y13-20020adfdf0d000000b002d1801018e2sm11767332wrl.63.2023.04.04.02.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 02:18:05 -0700 (PDT)
Message-ID: <aebef87f-e0a3-17dd-12b7-7231ca6b0923@linaro.org>
Date: Tue, 4 Apr 2023 11:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic Drivers updates for v6.4
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic Drivers changeset for v6.4, with dt-bindings
conversion & fixes, dev_err_probe() migration for pwrc & missed
populate platform devices for meson_sm driver.

Neil

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.4

for you to fetch changes up to 1b61fdfdd656b3940cff24c25c211777389174b0:

   dt-bindings: soc: amlogic: Drop unneeded quotes (2023-03-28 09:48:54 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.4:
- convert clk-measure.txt to dt-schema
- meson-pwrc: Use dev_err_probe()
- meson_sm: populate platform devices from sm device tree data
- dt-bindings: Drop unneeded quotes

----------------------------------------------------------------
Dmitry Rokosov (1):
       firmware: meson_sm: populate platform devices from sm device tree data

Neil Armstrong (1):
       dt-bindings: soc: amlogic: convert clk-measure.txt to dt-schema

Rob Herring (1):
       dt-bindings: soc: amlogic: Drop unneeded quotes

Ye Xingchen (1):
       soc: amlogic: meson-pwrc: Use dev_err_probe()

  .../arm/amlogic/amlogic,meson-gx-ao-secure.yaml    |  4 +--
  .../arm/amlogic/amlogic,meson-mx-secbus2.yaml      |  4 +--
  .../bindings/soc/amlogic/amlogic,canvas.yaml       |  4 +--
  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  | 40 ++++++++++++++++++++++
  .../bindings/soc/amlogic/clk-measure.txt           | 21 ------------
  drivers/firmware/meson/meson_sm.c                  |  5 ++-
  drivers/soc/amlogic/meson-gx-pwrc-vpu.c            |  8 ++---
  7 files changed, 53 insertions(+), 33 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
  delete mode 100644 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
