Return-Path: <SRS0=7QVw=TS=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BF7C433F5
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0865C340F3; Mon,  7 Mar 2022 08:45:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C451DC340F4
	for <soc@kernel.org>; Mon,  7 Mar 2022 08:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C451DC340F4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id q20so6366001wmq.1
        for <soc@kernel.org>; Mon, 07 Mar 2022 00:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :content-language:organization:content-transfer-encoding;
        bh=NNH81ZuTlZ9R6IvbjsRsCalYWZjx70C0eZ0TqIBdVik=;
        b=rTkMyox9zC1nlmU4aTFhaaPxLaxUyan3IUQoqYUR7zyC4EKLVPR9EHklZucXlReAsH
         PMe7CN1dTzfHw1cCeDjTQoX2jQ6hvMpAzQN0JfUPbInv7GsTuMrrUJjnhMUktX17fSRu
         J9A0XafEqdbUtwx6a0kZliKIux0zEx0kq5GKwasy5mvT7wuozn30PiSERDj4uAR7z9Md
         kn5d9H9pybpRM5O3jDBr0n+aUXhA4MQkhAAYN+di8V3p2gACQCb8DFUmOH+itx67tIDP
         j3M/r2R6yalrP/LV+jjZdCQ0OlhdLFZnN9/2lLpKvjeN9b2J3dVJ8pJMZ/2qEvnVTLOi
         ps5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:organization
         :content-transfer-encoding;
        bh=NNH81ZuTlZ9R6IvbjsRsCalYWZjx70C0eZ0TqIBdVik=;
        b=hLcQ2+yt+eORuLNnNIO8cgOciYiLgFtHtg27WLzYIwCoknAqtR6W9v4ClQO8yhIG2s
         BbmIL7BdKTL+REmgynfZkhs3eMY7++vbGaVxfaqCoewpO0IcaYasVr4i08LbBf5QSH1I
         cazvgfpz7Lfv/j0CCgcfDdEv+tbLcCyK73D1Jn2zssw5AbFUMxSqytl3Eyj+BzHJHxyT
         UPJjf9UeEhyzeAaLSOjcBm540vamnfx9dAJTfe0zS9bldDQQ7DVQueV2vOeuUA1RPFyl
         EapH7Cy4V6a0vAgpaazxA1uu9PCceTTsuHBhoI4MbDYAKE6/rcRwAh+SdC0z+/S79cdT
         O+VQ==
X-Gm-Message-State: AOAM5334zBATCAM+wHgJ2P2WL8AxO+N2iHAcqyOUT75HZrTzW5KebRCm
	1wiSVT8rmphR+GEMB6FoU97rRLgTIXP/GQ==
X-Google-Smtp-Source: ABdhPJzBGnm3vczH9cpTvFWCECpLXeFjAwJgIl3BHH/SNEOKz4pCH74ickWXp10r4cEYNSRe3oZxqA==
X-Received: by 2002:a1c:4c0f:0:b0:382:ab63:19ac with SMTP id z15-20020a1c4c0f000000b00382ab6319acmr8283711wmf.121.1646642734695;
        Mon, 07 Mar 2022 00:45:34 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:1451:71b4:fefe:6096? ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
        by smtp.gmail.com with ESMTPSA id bg18-20020a05600c3c9200b0037c2ef07493sm14636011wmb.3.2022.03.07.00.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 00:45:34 -0800 (PST)
Message-ID: <c7471989-d929-c744-c0c3-c8e86eaaa225@baylibre.com>
Date: Mon, 7 Mar 2022 09:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] soc: amlogic: driver updates for v5.18
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, "arm@kernel.org" <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Please find for v5.18 support for Amlogic S4 SoC in secure power domain driver.

Neil

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v5.18

for you to fetch changes up to f2b03c1056ef5c0829678f51273eace3e6327884:

   soc: s4: Add support for power domains controller (2022-03-07 09:40:39 +0100)

----------------------------------------------------------------
Amlogic Drivers updates for v5.18:
- Add support for Amlogic S4 in meson-secure-pwrc power domain driver

----------------------------------------------------------------
Shunzhou Jiang (2):
       dt-bindings: power: add Amlogic s4 power domains bindings
       soc: s4: Add support for power domains controller

  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  3 ++-
  drivers/soc/amlogic/meson-secure-pwrc.c            | 22 ++++++++++++++++++++++
  include/dt-bindings/power/meson-s4-power.h         | 19 +++++++++++++++++++
  3 files changed, 43 insertions(+), 1 deletion(-)
  create mode 100644 include/dt-bindings/power/meson-s4-power.h
