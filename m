Return-Path: <SRS0=kSmn=73=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CED9C6FD1D
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 09:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 369A4C433EF; Tue,  4 Apr 2023 09:19:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3B07C433D2
	for <soc@kernel.org>; Tue,  4 Apr 2023 09:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3B07C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id n19so18578174wms.0
        for <soc@kernel.org>; Tue, 04 Apr 2023 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680599993;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBpuE+KCaF7Z9YSbE9pExS8fataDemvNZ7uivPjNu7o=;
        b=nb4m3+xjm28v9RQ4jjnffLqWrBs50UJPIyypaOH+HrCxQsrWZo8gMOXNu0LfrUDeDC
         vt/3CWbJpUwIJ8cjWukgeR5hxqxS2EsyQ1QVbOyivOTvSFpKGsE0ayibZ0hJWJwFuTYT
         NHPWC5rLe3JrG2bA8V57CxkDFtO/0fuODywYxYNisSro0FxMo2HlMsBTBS5IzUyEytgr
         NhxBs8sJR3rpUoDcTIAgDyhQWj7sjUri+M4cfC7rz/Jp3VxN8GXhixsbpeyunFRkslgu
         Lh7FdAtLjZFlPC2WvE87ftYl+hPgiyuiLad6ngcQm2auxicqM2XCkoYLFJYpJ5r+5TaM
         x9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680599993;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBpuE+KCaF7Z9YSbE9pExS8fataDemvNZ7uivPjNu7o=;
        b=EsdE5Ae0Mc5NRw6BAYupmtURAku2Eo0G042/pe0HgR4+iecQUnMjqK1b/tc2lU3SMZ
         lixbMS3CGCtVuEtjpRL9/Ag/M0xuUtm9TWJm4Yrul4jPlA6xh54YPz2sv1fAD4+d362v
         xGGHjY8fsdypwH22gbUAUuH1m9hLppAYoHMuB0YKHlbNnUkoVsz7P+JVc50I9Gdw4r1i
         fSf6HzrJ87a6cb1vT0AvZb/wCwUmisqj3yVSYzYJ00QunbBSbTZuZ0z9YDtfziHCqeU3
         MnMuzldwtDLIX74WlsiaV+TSn4U7ED4dv3rssXI2x5PkhSxZwIL3OPsjK1LYQw7ADw0P
         gd9g==
X-Gm-Message-State: AAQBX9dZFOQgx4zi2H+3lWYShMw5nSj3xandOCMja4zZcSkEYXeLPz7Q
	TVMveoAGKc+u95Y6wmfJI/jpxLTKteKxJl+6p+AP+g==
X-Google-Smtp-Source: AKy350ZC6xyNgcjP8aMfKxY7ekylrliGQP+/qhOjRmVfJQ33Oker2e9FNqU8ib3ppz8WLH3lFMu9Bw==
X-Received: by 2002:a05:600c:2202:b0:3eb:f59f:6daf with SMTP id z2-20020a05600c220200b003ebf59f6dafmr1583852wml.34.1680599992987;
        Tue, 04 Apr 2023 02:19:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5136:bca8:1616:ba77? ([2a01:e0a:982:cbb0:5136:bca8:1616:ba77])
        by smtp.gmail.com with ESMTPSA id b39-20020a05600c4aa700b003ed29189777sm21469734wmp.47.2023.04.04.02.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 02:19:52 -0700 (PDT)
Message-ID: <eb1f32f8-822d-9cfc-fca6-9e044bf4a5ab@linaro.org>
Date: Tue, 4 Apr 2023 11:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.4
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic ARM DT changeset for v6.4, with some dt fixes in regards
to dt-bindings and changes to enable Bluetooth and WiFi on the mxiii-plus board.

Neil

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.4

for you to fetch changes up to 8446b84c894f7441f8bf4410f9638e38dcb29c49:

   ARM: dts: meson8m2: mxiii-plus: Enable Bluetooth and WiFi support (2023-03-22 11:35:32 +0100)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.4:
- adjust order of some compatibles
- meson8: add the xtal_32k_out pin
- meson8: add the SDXC_A pins
- mxiii-plus: Enable Bluetooth and WiFi support

----------------------------------------------------------------
Heiner Kallweit (1):
       arm: dts: meson: adjust order of some compatibles

Martin Blumenstingl (3):
       ARM: dts: meson8: add the xtal_32k_out pin
       ARM: dts: meson8: add the SDXC_A pins
       ARM: dts: meson8m2: mxiii-plus: Enable Bluetooth and WiFi support

  arch/arm/boot/dts/meson8.dtsi             | 17 +++++++++++
  arch/arm/boot/dts/meson8b.dtsi            |  4 +--
  arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 48 ++++++++++++++++++++++++++++++-
  3 files changed, 66 insertions(+), 3 deletions(-)
