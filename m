Return-Path: <SRS0=W1zo=NB=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955C1C4338F
	for <soc@archiver.kernel.org>; Tue, 10 Aug 2021 07:45:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 75C7761052; Tue, 10 Aug 2021 07:45:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C37E60F38
	for <soc@kernel.org>; Tue, 10 Aug 2021 07:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C37E60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id c9so24923430wri.8
        for <soc@kernel.org>; Tue, 10 Aug 2021 00:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=g0q3kphIrx1VxRV2EMS6AqhVMyTrmhZVikt1UVfC9jE=;
        b=WWp6Iu9NUui8IEaytPZW4o7A0jVEUvskeillsHJfoOChJizlMPG1d6Kx5vrEDABHxB
         otLUUp3g7SfpxHDtIhGnLjIYRrN4CkkZbSaXhtsX73ySURG9Uif6ABvLLYSggwT/E5pe
         sH1AQKhtobTDi9Vl3a3tAPNzuBKI3EeOk1JIGcq/4NB6PBCRnRL4AuQEwpejCZok/AuD
         I4xqX8a7XLG6cQ6MPB352+VA/cw3Iywkt+rIJIa88vZCOxphd89xyk5CZQPKb0qvA8fv
         qS7Vg8cgF7CBNFbwLNJtkJd+ToYZTygkO7cSCJkcrsgl1x15K+jDr9kbDv67Ut2KDndw
         fwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=g0q3kphIrx1VxRV2EMS6AqhVMyTrmhZVikt1UVfC9jE=;
        b=lygCvMaofbgDrReF+sVPugb38ti3sLrwpIH8yMd0J92WfsiIDUqTITGfu6jRLXAZ2S
         StMlj6cMQ0KLscPXsrJLRwK9FEkf6LLJfq8dummivAXvvIAc6SRgCTzFJpHS5M2kkVqM
         Kbalz86I7K5+I1sQfoRbykMGmD0X/NdPzII6YNM2EnS5lIh8fP2+SkX874aEtlrVXaCu
         zbusfqqNauKjEg28mfz7H7OP6FJSIEYO1Oex0DRh3IkjL9g12pUm7ph9ZE3D8tkqGVxS
         ZSyrQU/XF/FeA0Aki4p6N04tb6x9gZLlakEQUjKPMXI6kNqcA/g6rB5e+RbpGrlLgcLA
         1zmQ==
X-Gm-Message-State: AOAM533akkY/CqXw1wfo3tjm8E/xCTpjoleRHx3qnYMZLcB02d9DEpM2
	IbxKd2tHvFcNN3wm3BfNCr/NCQ==
X-Google-Smtp-Source: ABdhPJx064E2x1aqMgErJdQ7uvxV1ZcoE7GSSdceTUKAusQAu5ZofzMW9b96EIF+QoG9h0905lxZ3A==
X-Received: by 2002:a05:6000:225:: with SMTP id l5mr29983665wrz.242.1628581522006;
        Tue, 10 Aug 2021 00:45:22 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0? ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
        by smtp.gmail.com with ESMTPSA id s10sm10377416wrv.54.2021.08.10.00.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 00:45:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm: dts: amlogic updates for v5.15
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <87519792-c9e7-76a6-5db5-0e955286b564@baylibre.com>
Date: Tue, 10 Aug 2021 09:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's Amlogic ARM DT changes for v5.15:
- meson8: use a default higher default GPU clock to solve probe failure
- meson: add AIU audio controller and codec for ec100
- meson8b: fix pwm regulator supply property name

Neil

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v5.15

for you to fetch changes up to 72ccc373b064ae3ac0c5b5f2306069b60ca118df:

  ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties (2021-07-26 10:05:36 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v5.15:
- meson8: use a default higher default GPU clock to solve probe failure
- meson: add AIU audio controller and codec for ec100
- meson8b: fix pwm regulator supply property name

----------------------------------------------------------------
Anand Moon (3):
      ARM: dts: meson8b: odroidc1: Fix the pwm regulator supply properties
      ARM: dts: meson8b: mxq: Fix the pwm regulator supply properties
      ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties

Martin Blumenstingl (3):
      ARM: dts: meson8: Use a higher default GPU clock frequency
      ARM: dts: meson: Add the AIU audio controller
      ARM: dts: meson8b: ec100: wire up the RT5640 audio codec

 arch/arm/boot/dts/meson.dtsi           | 12 ++++++
 arch/arm/boot/dts/meson8.dtsi          | 68 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-ec100.dts    | 48 +++++++++++++++++++++++-
 arch/arm/boot/dts/meson8b-mxq.dts      |  4 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts |  4 +-
 arch/arm/boot/dts/meson8b.dtsi         | 63 +++++++++++++++++++++++++++++++
 6 files changed, 194 insertions(+), 5 deletions(-)
