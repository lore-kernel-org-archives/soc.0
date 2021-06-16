Return-Path: <SRS0=o3rk=LK=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08562C48BE6
	for <soc@archiver.kernel.org>; Wed, 16 Jun 2021 06:25:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DF2EB613D0; Wed, 16 Jun 2021 06:25:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 863E6613C2
	for <soc@kernel.org>; Wed, 16 Jun 2021 06:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 863E6613C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=narmstrong@baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id i94so1249776wri.4
        for <soc@kernel.org>; Tue, 15 Jun 2021 23:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=AUZLUp42K/lZfioAjz/zadZDn+47Sd2vr6fMgCganLM=;
        b=da715xJIs1OGYk8W+yihj2EYBsJ+t22FZAlss9QxIeGY4dTGUfg04SV4ZLMLcU1b6S
         PF2xF1roY98hEm9Zwo4rT/lNDE5YbC/c29lvkp7Lfd1cGpS/X6MDiwhxaxRK7LNuopko
         MDGzNaBsIFQuiY4latdCXTA4dtfo90GZgxyo6yam57zsUN4X5Ca6Z4CJOi0iYfQjdSLP
         8+UiulZHKsp+6U4GA96EszJNglsfvoEZetHzux7msKlVOyJMHSf+7nOYrZLWklkEPNUH
         TTYG0xYKs0qfXh+DHznLKtlfiTXXDODCQZxbi+nVUDeYg3TW1nWwpOyOsg6vsua6Mz7/
         VjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=AUZLUp42K/lZfioAjz/zadZDn+47Sd2vr6fMgCganLM=;
        b=HYVbbGeYyNt/ISfJPArNbH7suAGZrHBG8JMhxfTYrNQtPz4wWXNENNJVKXuChYJ0qW
         M/eOfVXFPq6nSifKD8nWAfIHJwNjpLl80Wu0Fe5IC3gMLdggf5ZSGOG9z2A3MgtAsnRO
         6l9hAMyDBK9iOTz5fax/yInbJHBUgtb2YsUOkTYoeec3BVUlF5vBghfsTUNXA2/Dhh2C
         ujgH1hOtjiDzOIYpG1KmubgpaPZLfJsuvWdHVhg9b9XN1Wch9eiqB38tV+CSJyRGLNLH
         H3LUDJbCGANdPSp1Cn3q+QdZb197YoEUEP09oW7qNOm1kYKienUxNGID4rlANdeJxi5C
         HWOQ==
X-Gm-Message-State: AOAM533PAFv3I4CrlhdNgMkirpMsF1BoZ56fgWtF4NjoSScJdmYYunza
	dYhsjX9qudUlQQAWWjUbL7aicA==
X-Google-Smtp-Source: ABdhPJww34TnZw+Mcbi7UsDVAQwY7mMh972gsuBgbSstjk5G0zLB8T69bGa+0DYd3TU5rgPNnH0oEw==
X-Received: by 2002:adf:ee82:: with SMTP id b2mr3305744wro.360.1623824713130;
        Tue, 15 Jun 2021 23:25:13 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6b98:6d35:fe47:b739? ([2a01:e0a:90c:e290:6b98:6d35:fe47:b739])
        by smtp.gmail.com with ESMTPSA id c20sm726379wml.37.2021.06.15.23.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 23:25:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.14, part 2
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <c953e97a-f901-a749-1fb6-b1caa75b4748@baylibre.com>
Date: Wed, 16 Jun 2021 08:25:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's some changes to enhance support for the Odroid C4 & Odroid HC4 boards.

Neil

The following changes since commit a270a2b24de5be0480136cbbd7805b9134762b97:

  arm64: dts: meson: set 128bytes FIFO size on uart A (2021-06-01 10:27:02 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.14-v2

for you to fetch changes up to 303d2af21aedeaebe824411fbff912dfcdb48de5:

  arm64: dts: meson-sm1-odroid-c4: remove invalid hub_5v regulator (2021-06-14 09:57:45 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.14 round 2:
-  various fixes for Odroid C4/HC4 regulators handling, USB and SPI NOR Flash for HC4

----------------------------------------------------------------
Christian Hewitt (1):
      arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4

Neil Armstrong (6):
      arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for tf_io regulator
      arm64: dts: meson-sm1-odroid: set tf_io regulator gpio as open source
      arm64: dts: meson-sm1-odroid: add 5v regulator gpio
      arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0
      arm64: dts: meson-sm1-odroid-hc4: add regulators controlled by GPIOH_8
      arm64: dts: meson-sm1-odroid-c4: remove invalid hub_5v regulator

 .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts | 17 --------
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  9 +++-
 3 files changed, 54 insertions(+), 20 deletions(-)
