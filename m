Return-Path: <SRS0=Mtmc=3W=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF76C4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 15:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 335A9C433B5; Tue, 22 Nov 2022 15:25:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 113B6C433D7
	for <soc@kernel.org>; Tue, 22 Nov 2022 15:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 113B6C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so1182694wmi.1
        for <soc@kernel.org>; Tue, 22 Nov 2022 07:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIshvcW+dmN6wr7Y/QgpYruJjGhmzM7qSnM+mWsPGXY=;
        b=EUzX1hweNmJjDIs4y3ET5oXPKpoVdXJC2g56T4XMcQGH3/+FNZk8ktxpn9W6fTilmw
         GV3D2G/9Qa9OvYHeryAXFpHuPMnnoN2QmBX7uITYBPu68zRcEHnD9dmKkW8y15nwTvzV
         WN3KAgQnDajLlOH3vjH+7hbDCXPL0dvSLyeLAgtl9otsY0KOshRoF/fhr3R0/+ZpF35t
         OS+aAs0AslKksBgLhoCFH9QsQecSK5yUXlCg3c4aVeLt6QoqtvXngdTw2TryJ0l/5L7C
         sw0z7RYAU4mvgwt61P/2yqDOfBcMnPJ2nXk5lwe5b/NjOxqMHWdA4mwVj1z75gmNJGzC
         3oWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIshvcW+dmN6wr7Y/QgpYruJjGhmzM7qSnM+mWsPGXY=;
        b=J4aeVJO9CQpQOoaeRqTfa4RpSF0ruoSfECH4tT0Qe7BsSrdoHFn0AAmFpeMFSjpkJz
         Ef9nhYqbxLKoECzdb7OZ3iqqWzZGTMEbdgoDGJyaGO5IGKQzoyZVrA8GSLnhTPxHjVcj
         f7IIvhIYsf0yBzBxb4CXgNWmbRdt2kFPnkXFpscIJcmB0Oeib7AVJ0iBL4Gra1OvKqaX
         hwORxEWDG0dfmCfk9Hfi7b2LNBSQ7pbJ0xL2DZIyoQn6OYibfLajDFgtMMrnSQKNlBt0
         XLYVlLPSfEPiNt4j2xulvFZrZDoCy2qExotORoiDqPA1iUwYCPN5Z0AgJyuhB4jIilq6
         i0ug==
X-Gm-Message-State: ANoB5plkgItDsdii2/Kp5eHVrpF9FJlUMkBEpBPoTE/sZUNh0fi3LcCd
	UxsjmzeKUMvRE3w7qR9nbDEGO6UwY3O5wA==
X-Google-Smtp-Source: AA0mqf5vn7HfJEjIkm7I/bW7zOpgzzDn48vVJxYmegrRLJ1yP+FH5ahqDN1yPvXihrYvaDUuarJFOg==
X-Received: by 2002:a05:600c:2e51:b0:3cf:6e9b:21f1 with SMTP id q17-20020a05600c2e5100b003cf6e9b21f1mr2893276wmf.90.1669130700262;
        Tue, 22 Nov 2022 07:25:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0? ([2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0])
        by smtp.gmail.com with ESMTPSA id v17-20020a5d5911000000b00241da0e018dsm4906199wrd.29.2022.11.22.07.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 07:24:59 -0800 (PST)
Message-ID: <7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org>
Date: Tue, 22 Nov 2022 16:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic Drivers updates for v6.2
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic Drivers change for v6.3, fixes memcpy vs iomem type warnings in meson_sm driver.

Neil

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.2

for you to fetch changes up to 7dc69c7d073e6004a281db8f7f15cf6ebf702ea0:

   firmware: meson_sm: Fix memcpy vs iomem type warnings (2022-10-17 17:19:04 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.2:
- Fix memcpy vs iomem type warnings in meson_sm driver

----------------------------------------------------------------
Kees Cook (1):
       firmware: meson_sm: Fix memcpy vs iomem type warnings

  drivers/firmware/meson/meson_sm.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
