Return-Path: <SRS0=6fcB=ZI=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245A3ECAAD3
	for <soc@archiver.kernel.org>; Mon,  5 Sep 2022 13:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E0B2C433B5; Mon,  5 Sep 2022 13:56:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3B4FC433D7
	for <soc@kernel.org>; Mon,  5 Sep 2022 13:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3B4FC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id c131-20020a1c3589000000b003a84b160addso7151186wma.2
        for <soc@kernel.org>; Mon, 05 Sep 2022 06:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:organization:content-language:subject:cc
         :to:from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date;
        bh=46nHfwcVM1dDNCdF68Lvdzc8m/qkXwrQBKqu1SebdGU=;
        b=ltzfA3Gd+3ClHYPACNX8TAyUi62J7/B9l8WmYYZc+JsvK8w0IByaJRegcReh5AwCy3
         uJZ0+cQZ10HTp/d0EREkbggRncVZZzdLNfWH56MmzoMi5QMNNDua650zAklG9ektXBTV
         vvrE7qt3nbUbJF1EFjsUkJOE0N7CmRlYyQ88gfBordGaBokmEZu7ltv89xbgdbYrDeWu
         iPgtj7SflLR5sobYqJKl09V9y4JBsaCEgLJQleYs1g2Am7QpKaaUvqD1eCsBPLKiz4Pl
         Y3OQ2ZwsR5tesezdEf+TgYriKIhlqcq3B4cjMMX/0W8u4VmzzwSssjobFqs/AAQfA2SW
         fIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:content-language:subject:cc
         :to:from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=46nHfwcVM1dDNCdF68Lvdzc8m/qkXwrQBKqu1SebdGU=;
        b=rsEH3HbvL+dLY/aQbeCdOCM9lFx0NnJPnxENaE8T3lJ+yy9yaPii1DEiPYyqH4EE8i
         02xS+g1YRHmKU9QgrBgrr3rBoFm0HbhgGak0XZMIXTyzm80tKsYVrEUDM86fC+vt6ESL
         ZBgPu9sw4E40MRw1fKIEQm5+IJKQ/gBKHRtIxQdxYTl+G+G7z+0oBr7s2JTDdgBxmPtH
         3xWs0lEQHswDGvaxHzWp0QgyR1DnEAYJdPrlVHNslgtxYieCSxs+7cSJd6SgXh/AyKJK
         MhyovlVlU5oV3axeNPMnHYPsJe4TGq7GCAn0reSsDJ20AeGzajeiMVPVzscFPPskezdE
         1BgA==
X-Gm-Message-State: ACgBeo1U3qZpWoKFLoX0mE53J1vYqgZGG9sRUE3bgYKtdyoUTfbtn24N
	+UzOXArKctsawGsRUIT2FjHTVt5LtSSS9/vH
X-Google-Smtp-Source: AA6agR5+RfLa+a1KzdIA7RtQhGcgSFgElRnEUw5hzLPm9OQeakg4mFNtRMzXb4uob/qFX1XtV1bXHA==
X-Received: by 2002:a05:600c:600b:b0:3a5:b811:e7fc with SMTP id az11-20020a05600c600b00b003a5b811e7fcmr11412504wmb.190.1662386184598;
        Mon, 05 Sep 2022 06:56:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f365:27e9:453c:4c15? ([2a01:e0a:982:cbb0:f365:27e9:453c:4c15])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d654f000000b002211fc70174sm10598832wrv.99.2022.09.05.06.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 06:56:24 -0700 (PDT)
Message-ID: <ea093c00-a4bb-fb80-3430-71916b2853f8@baylibre.com>
Date: Mon, 5 Sep 2022 15:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic Drivers updates for v6.1
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a Amlogic Drivers change for v6.1, with of_get_parent() refcount fixes for meson_pwrc drivers.

Neil

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.1

for you to fetch changes up to 9491cff16a4996aee578adf9f41acfb1bc483df9:

   soc: amlogic: meson-pwrc: Hold reference returned by of_get_parent() (2022-09-05 09:23:54 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.1:
- Hold reference returned by of_get_parent() in meson_pwrc

----------------------------------------------------------------
Liang He (1):
       soc: amlogic: meson-pwrc: Hold reference returned by of_get_parent()

  drivers/soc/amlogic/meson-ee-pwrc.c     | 5 ++++-
  drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 5 ++++-
  2 files changed, 8 insertions(+), 2 deletions(-)
